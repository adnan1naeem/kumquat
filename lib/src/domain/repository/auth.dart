import 'dart:io';

import '../../data/models/session.dart';

abstract class Auth {
  Future<Session> login({
    required String email,
    required String password,
  });

  Future<void> signup(
      {required String email,
      required String password,
      required String username});

  Future<void> createUserProfile({
    required String username,
    required String uid,
    required String email,
    required String profession,
    required String category1,
    required String category2,
    required String category3,
    required double phoneRate,
    required double videoRate,
    required String about,
    required File image,
    required List<String> socials,
  });

  Future<void> logout();

}
