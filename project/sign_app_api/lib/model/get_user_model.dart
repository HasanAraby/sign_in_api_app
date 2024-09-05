import 'package:sign_app_api/core/constants/api_keys.dart';

class GetUserModel {
  final String email;
  final String name;
  final String phone;
  final String location;
  final String id;
  final String imgLink;

  GetUserModel(
      {required this.email,
      required this.name,
      required this.phone,
      required this.location,
      required this.id,
      required this.imgLink});
  factory GetUserModel.fromJson(Map<String, dynamic> json) {
    return GetUserModel(
        email: json[ApiKey.email],
        name: json[ApiKey.userName],
        phone: json[ApiKey.phone],
        location: json[ApiKey.location]['type'],
        id: json[ApiKey.getId],
        imgLink: json[ApiKey.profilePic]);
  }
}
