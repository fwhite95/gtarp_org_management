import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:org_management/firebase_options.dart';
import 'package:org_management/src/apis/auth_api.dart';
import 'package:org_management/src/apis/cleaning_api.dart';
import 'package:org_management/src/apis/heist_api.dart';
import 'package:org_management/src/apis/moonshine_api.dart';
import 'package:org_management/src/apis/organization_api.dart';
import 'package:org_management/src/apis/theft_api.dart';
import 'package:org_management/src/apis/weed_api.dart';
import 'package:org_management/src/app.dart';
import 'package:org_management/src/repositories/auth_repository.dart';
import 'package:org_management/src/repositories/cleaning_repository.dart';
import 'package:org_management/src/repositories/heist_repository.dart';
import 'package:org_management/src/repositories/moonshine_repository.dart';
import 'package:org_management/src/repositories/organization_repository.dart';
import 'package:org_management/src/repositories/theft_repository.dart';
import 'package:org_management/src/repositories/weed_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final OrganizationAPI organizationAPI = OrganizationAPI(firestore: firestore);
  final WeedAPI weedAPI = WeedAPI(firestore: firestore);
  final MoonshineAPI moonshineAPI = MoonshineAPI(firestore: firestore);
  final HeistAPI heistAPI = HeistAPI(firestore: firestore);
  final TheftAPI theftAPI = TheftAPI(firestore: firestore);
  final CleaningAPI cleaningAPI = CleaningAPI(firestore: firestore);
  final AuthAPI authAPI = AuthAPI(firebaseAuth: firebaseAuth);

  final weedRepository = WeedRepository(weedAPI: weedAPI);
  final moonshineRepository = MoonshineRepository(moonshineAPI: moonshineAPI);
  final heistRepository = HeistRepository(heistAPI: heistAPI);
  final theftRepository = TheftRepository(theftAPI: theftAPI);
  final cleaningRepository = CleaningRepository(cleaningAPI: cleaningAPI);
  final organizationRepository =
      OrganizationRepository(organizationAPI: organizationAPI);
  final authRepository = AuthRepository(authAPI: authAPI);
  runApp(MyApp(
    weedRepository: weedRepository,
    moonshineRepository: moonshineRepository,
    heistRepository: heistRepository,
    theftRepository: theftRepository,
    cleaningRepository: cleaningRepository,
    organizationRepository: organizationRepository,
    authRepository: authRepository,
  ));
}
