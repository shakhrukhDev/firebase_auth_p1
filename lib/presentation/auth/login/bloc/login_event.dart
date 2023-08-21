part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class GmailEvent extends LoginEvent {
  final String email;
  final String password;

  GmailEvent({required this.email, required this.password});

  @override
  List<Object?> get props {
    return [];
  }
}


class SignUpGmailEvent extends LoginEvent {
  final String gmail;
  final String password;

  SignUpGmailEvent({required this.gmail, required this.password});

  @override
  List<Object?> get props {
    return [];
  }
}

