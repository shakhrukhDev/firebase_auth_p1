part of 'with_google_bloc.dart';

@immutable
abstract class WithGoogleEvent {}

class SignUpGoogleEvent extends WithGoogleEvent {
  SignUpGoogleEvent();

  @override
  List<Object?> get props {
    return [];
  }
}
