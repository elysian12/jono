// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final bool isHospital;

  const SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.isHospital,
  });

  @override
  List<Object> get props => [email, password, name, isHospital];
}

class SignOutEvent extends AuthEvent {}

class AuthStateChangeEvent extends AuthEvent {}
