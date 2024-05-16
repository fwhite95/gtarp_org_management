import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:org_management/constants.dart';
import 'package:org_management/src/blocs/auth/auth_cubit.dart';
import 'package:org_management/src/widgets/auth_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.goNamed(
                'dashboard',
              );
            });

            return const CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hello Again!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                // textfield 1
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                  obscure: false,
                  onChanged: context.read<AuthCubit>().emailChanged,
                ),
                const SizedBox(
                  height: 25,
                ),

                // textfield 2
                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscure: true,
                  onChanged: context.read<AuthCubit>().passwordChanged,
                ),
                const SizedBox(
                  height: 40,
                ),
                // button
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5,
                        vertical: defaultPadding,
                      ),
                    ),
                    onPressed: () {
                      context.read<AuthCubit>().signInPressed();
                    },
                    icon: const Icon(Icons.login),
                    label: const Text("Sign In"),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
