import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_p1/presentation/auth/login/bloc/login_bloc.dart';
import 'package:firebase_auth_p1/presentation/auth/login/login_win_page.dart';
import 'package:firebase_auth_p1/presentation/auth/login/mixin/auth_mixin.dart';
import 'package:firebase_auth_p1/presentation/auth/with_google/bloc/with_google_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginPageMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (_, state) {
        return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return LoginWinPage();
              } else {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Category Page'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter your email',
                          ),
                        ),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                        ),
                        if (state.firebaseStatus.isLoading)
                          const CircularProgressIndicator(),
                        if (state.firebaseStatus.isError)
                          const Text('Email yoki parol xato'),
                      ],
                    ),
                  ),
                  bottomNavigationBar: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     /* ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              context.read<LoginBloc>().add(GmailEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: const Text('Log in with Email')),*/
                      ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              context.read<LoginBloc>().add(SignUpGmailEvent(
                                  gmail: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          child: const Text('Sign Up with Email')),
                     ElevatedButton(
                          onPressed: () {
                            GoogleSignIn _googleSignIn = GoogleSignIn();
                            try {
                              _googleSignIn.signIn().then((result) {
                                print(result?.email ?? "");
                                print("==================");
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                      return LoginWinPage();
                                    }));
                              });
                            }catch(error,stack){
                              print(error);
                              print(stack);
                            }
                          },
                          child: const Text('Log in with Google')),

                     /* ElevatedButton(
                          onPressed: () {
                            context.read<WithGoogleBloc>().add(SignUpGoogleEvent());
                          },
                          child: const Text('Log in with Google 2')),*/
                    ],
                  ),
                );
              }
            });
      },
    );
  }
}
