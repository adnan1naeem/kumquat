import 'dart:convert';
import 'package:kumquat_app/src/data/models/base.dart';
import 'package:kumquat_app/src/data/models/json_doc.dart';

class UserProfile extends BaseModel {
  const UserProfile({required super.jsonDoc});

  String get username => data['user_name'];
  String get email => data['email'];
  String get profession => data['profession'];
  String get category1 => data['category1'];
  String get category2 => data['category2'];
  String get category3 => data['category3'];
  String get image => data['profileImage'];
  double get phoneRt => data['phone_rate'];
  double get videoRt => data['video_rate'];
  String get about => data['about'];
  List get socialsList => data['socials'];
  double get rating => data['rating'];
  double get kamquats => data['kamquats'];
  Settings get setting => getSettings(data['settings']);

   Settings getSettings(Map<String,dynamic> json){
    return Settings(jsonDoc: JsonDoc(
      data: json
    ));
  }

  static Map<String, dynamic> toMap(UserProfile user)=>{
    'user_name': user.username,
    'email': user.email,
    'profession': user.profession,
    'category1': user.category1,
    'category2': user.category2,
    'category3': user.category3,
    'profileImage': user.image,
    'phone_rate': user.phoneRt,
    'video_rate': user.videoRt,
    'about': user.about,
    'socials': user.socialsList,
    'rating': user.rating,
    'kamquats': user.kamquats,
    'settings': Settings.toMap(user.setting)
  };

  static String serialize(UserProfile model)=> jsonEncode(UserProfile.toMap(model));
  static UserProfile deSerialize(String json) => UserProfile(jsonDoc: JsonDoc(data: jsonDecode(json)));
}

class Settings extends BaseModel {
  const Settings({required super.jsonDoc});
  bool get payLimit => data['pay_limit'];
  int get payLimitRt => data['pay_limit_rate'];
  bool get timeLimit => data['time_limit'];
  int get timeLimitRt => data['time_limit_rate'];
  String get privacy => data['privacy'];
  String get subPrivacy => data['private_sub_privacy'];
  List get services => data['services'];

   static Map<String, dynamic> toMap(Settings model)=>{
    'pay_limit': model.payLimit,
    'pay_limit_rate': model.payLimitRt,
    'time_limit': model.timeLimit,
    'time_limit_rate': model.timeLimitRt,
    'privacy': model.privacy,
    'private_sub_privacy': model.subPrivacy,
    'services': model.services
  };

}
