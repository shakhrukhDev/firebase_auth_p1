part of 'login_bloc.dart';

@immutable

class LoginState extends Equatable {

  final Status firebaseStatus;

  const LoginState({this.firebaseStatus = Status.initial});

  LoginState copyWith({
    Status? firebaseStatus,
  }) =>
      LoginState(
        firebaseStatus: firebaseStatus ?? this.firebaseStatus,
      );

  @override
  List<Object?> get props => [firebaseStatus];
}
