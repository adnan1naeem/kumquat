import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kumquat_app/src/data/models/user_profile.dart';

class SecureStorageService {

  String idKey = 'uid';
  String firebaseToken = 'firebaseToken';
  String userKey = 'appUser';

  final FlutterSecureStorage storage;

  static final SecureStorageService _singleton =
  SecureStorageService._instantiate();

  factory SecureStorageService() => _singleton;

  SecureStorageService._instantiate() : storage = const FlutterSecureStorage();

  Future<void> saveId (String id)async{
    await storage.write(key: idKey, value: id);
  }

  Future<void> saveProfile(UserProfile user)async{
    await storage.write(key: userKey, value: UserProfile.serialize(user));
  }

  Future<UserProfile> getProfile()async{
    var profile = await storage.read(key: userKey);
    return UserProfile.deSerialize(profile ?? {}.toString());
  }

  Future<String?> getId()async{
    var id = await storage.read(key: idKey);
    return id ??'';
  }

  Future<void> deleteSession ()async{
       await Future.wait([
      storage.delete(key: idKey),
      storage.delete(key: firebaseToken),
    ]);
  }
}