import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<GmailEvent>(_signWithEmail);
    on<SignUpGmailEvent>(_singUpWithEmail);
  }

  Future<void> _signWithEmail(
      GmailEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(firebaseStatus: Status.loading));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(firebaseStatus: Status.success));
    } on FirebaseAuthException catch (e) {
      print('error----${e.code}');
      emit(state.copyWith(firebaseStatus: Status.error));
    }
  }
  Future<void> _singUpWithEmail(
      SignUpGmailEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(firebaseStatus: Status.loading));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.gmail, password: event.password);
      emit(state.copyWith(firebaseStatus: Status.success));
    } on FirebaseAuthException catch (e) {
      print('error----${e.code}');
      emit(state.copyWith(firebaseStatus: Status.error));
    }
  }
}

enum Status { initial, loading, success, error }

extension FirebaseStatusX on Status {
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}
