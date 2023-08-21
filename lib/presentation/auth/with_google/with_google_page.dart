import 'package:firebase_auth_p1/presentation/auth/with_google/bloc/with_google_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithGooglePage extends StatelessWidget {
  const WithGooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WithGoogleBloc, WithGoogleState>(
      builder: (_, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('WithGoogle Page'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('WithGoogle Page'),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    context.read<WithGoogleBloc>().add(SignUpGoogleEvent());
                  },
                  child: const Text('Log in with Google')),
            ],
          ),
        );
      },
    );
  }
}
