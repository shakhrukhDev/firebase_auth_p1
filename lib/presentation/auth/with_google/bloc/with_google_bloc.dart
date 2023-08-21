import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'with_google_event.dart';
part 'with_google_state.dart';

class WithGoogleBloc extends Bloc<WithGoogleEvent, WithGoogleState> {
  WithGoogleBloc() : super(WithGoogleState()) {
    on<SignUpGoogleEvent>(_singUpWithGoogle);
  }

  Future<void> _singUpWithGoogle(
      SignUpGoogleEvent event, Emitter<WithGoogleState> emit) async {

    final _googleSign = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleUser = await _googleSign.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return null;
    } catch (e, s) {
      debugPrint('$e, $s');
      return null;
    }
  }
}
