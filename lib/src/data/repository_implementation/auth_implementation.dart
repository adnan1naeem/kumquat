import 'dart:io';
import 'dart:math';

import 'package:kumquat_app/src/data/models/base.dart';
import 'package:kumquat_app/src/data/models/json_doc.dart';
import 'package:kumquat_app/src/data/models/user_profile.dart';
import 'package:kumquat_app/src/domain/repository/auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../models/session.dart';

class AuthImplementation implements Auth {
  @override
  Future<Session> login(
      {required String email, required String password}) async {
    firebase_auth.UserCredential userCredential =
        await BaseModel.adapter.loginUser(email: email, password: password);
    firebase_auth.User? user = userCredential.user;
    JsonDoc response = await BaseModel.adapter.read("users", id: user!.uid);
    return Session(
        jsonDoc: JsonDoc(
            data: {'uid': user.uid, 'user': UserProfile(jsonDoc: response)}));
  }

  @override
  Future<void> signup(
      {required String email,
      required String password,
      required String username}) async {
    await BaseModel.adapter.createUser(
      email,
      password,
    );
  }

  @override
  Future<void> createUserProfile(
      {required String username,
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
      required List<String> socials}) async {
    int temp = Random().nextInt(1000);
    String reference =
        await BaseModel.adapter.uploadToStorage(image, 'image$temp');

    Map<String, dynamic> body = {
      'uid': uid,
      'user_name': username,
      'email': email,
      'profession': profession,
      'category1': category1,
      'category2': category2,
      'category3': category3,
      'profileImage': reference,
      'phone_rate': phoneRate,
      'video_rate': videoRate,
      'about': about,
      'socials': socials,
      'rating': 0.0,
      'kamquats': 0.0,
      'settings': {
        'pay_limit': false,
        'pay_limit_rate': 0,
        'time_limit': false,
        'time_limit_rate': 0,
        'privacy': 'Public',
        'private_sub_privacy': '',
        'services': ['Phone', 'Video'],
      }
    };
    await BaseModel.adapter.write('users', body);
  }

  @override
  Future<void> logout() async{
   await BaseModel.adapter.firebaseAuth.signOut();
  }
}
