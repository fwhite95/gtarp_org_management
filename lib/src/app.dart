import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/admin/admin_bloc.dart';
import 'package:org_management/src/blocs/auth/auth_cubit.dart';
import 'package:org_management/src/blocs/dialog/dialog_cubit.dart';
import 'package:org_management/src/blocs/dashboard/dashboard_bloc.dart';
import 'package:org_management/src/blocs/weed_stats/weed_stats_bloc.dart';
import 'package:org_management/src/navigator/app_router.dart';
import 'package:org_management/src/repositories/auth_repository.dart';
import 'package:org_management/src/repositories/cleaning_repository.dart';
import 'package:org_management/src/repositories/heist_repository.dart';
import 'package:org_management/src/repositories/moonshine_repository.dart';
import 'package:org_management/src/repositories/organization_repository.dart';
import 'package:org_management/src/repositories/theft_repository.dart';
import 'package:org_management/src/repositories/weed_repository.dart';

import 'blocs/moonshine_stats/moonshine_stats_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required this.weedRepository,
    required this.moonshineRepository,
    required this.heistRepository,
    required this.theftRepository,
    required this.cleaningRepository,
    required this.organizationRepository,
    required this.authRepository,
    super.key,
  });

  final WeedRepository weedRepository;
  final MoonshineRepository moonshineRepository;
  final HeistRepository heistRepository;
  final TheftRepository theftRepository;
  final CleaningRepository cleaningRepository;
  final OrganizationRepository organizationRepository;
  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: weedRepository),
        RepositoryProvider.value(value: moonshineRepository),
        RepositoryProvider.value(value: heistRepository),
        RepositoryProvider.value(value: theftRepository),
        RepositoryProvider.value(value: cleaningRepository),
        RepositoryProvider.value(value: organizationRepository),
        RepositoryProvider.value(value: authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DashboardBloc(
              weedRepository: context.read<WeedRepository>(),
              moonshineRepository: context.read<MoonshineRepository>(),
              heistRepository: context.read<HeistRepository>(),
              theftRepository: context.read<TheftRepository>(),
              cleaningRepository: context.read<CleaningRepository>(),
              organizationRepository: context.read<OrganizationRepository>(),
            )..add(const DashboardLoadEvent('')),
          ),
          BlocProvider(
            create: (context) => WeedStatsBloc(
              weedRepository: context.read<WeedRepository>(),
              organizationRepository: context.read<OrganizationRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => MoonshineStatsBloc(
              moonshineRepository: context.read<MoonshineRepository>(),
              organizationRepository: context.read<OrganizationRepository>(),
            ),
          ),
          BlocProvider(
              create: (context) => DialogCubit(
                    weedRepository: context.read<WeedRepository>(),
                  )),
          BlocProvider(
              create: (context) => AuthCubit(
                    authRepository: context.read<AuthRepository>(),
                  )),
          BlocProvider(
              create: (context) => AdminBloc(
                    organizationRepository:
                        context.read<OrganizationRepository>(),
                  )),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Org Management',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: bgColor,
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme,
            ).apply(bodyColor: Colors.white),
            canvasColor: secondaryColor,
          ),
          routerConfig: AppRouter().router,
        ),
      ),
    );
  }
}
