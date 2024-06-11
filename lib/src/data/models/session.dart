
import 'package:kumquat_app/src/data/models/base.dart';
import 'package:kumquat_app/src/data/models/user_profile.dart';

class Session extends BaseModel{
  const Session({required super.jsonDoc});

  String get uid => data['uid'];

  UserProfile get user => data['user'];



}