import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DoLogin extends AuthEvent {
  final String email;
  final String password;

  DoLogin({
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [];
}


class DoSignup extends AuthEvent {
  final String email;
  final String username;
  final String password;

  DoSignup({
    required this.email,
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [];
}

class DoLogout extends AuthEvent {
  DoLogout();
  @override
  List<Object?> get props => [];
}

class CreateProfile extends AuthEvent {
  final String username;
  final String uid;
  final String email;
  final String profession;
  final String category1;
  final String category2;
  final String category3;
  final double phoneRate;
  final double videoRate;
  final String about;
  final File image;
  final List<String> socials;

  CreateProfile({
    required this.username,
    required this.uid,
    required this.email,
    required this.profession,
    required this.category1,
    required this.category2,
    required this.category3,
    required this.phoneRate,
    required this.videoRate,
    required this.about,
    required this.image,
    required this.socials,
  });
  @override
  List<Object?> get props => [];
}