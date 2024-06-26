import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object?> get props=> [];
}

class AuthInitial extends AuthState{
  AuthInitial();
  @override
  List<Object?> get props=> [];
}

class AuthLoading extends AuthState{
  final bool showIndicator;
  AuthLoading({required this.showIndicator});

  @override
  List<Object?> get props=> [];
}

class AuthSuccess extends AuthState{

  final bool isLoggedIn;
  final bool isSignup;
  final bool isProfileCreation;

  AuthSuccess({
    this.isLoggedIn = false,
    this.isSignup = false,
    this.isProfileCreation = false,
});

  @override
  List<Object?> get props=> [];
}

class AuthError extends AuthState{

  final bool isLoggedIn;
  final bool isSignup;
  final bool isProfileCreation;
  final String error;

  AuthError({
    this.isLoggedIn = false,
    this.isSignup = false,
    this.isProfileCreation = false,
    required this.error
  });

  @override
  List<Object?> get props=> [];
}