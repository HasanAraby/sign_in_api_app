import 'package:sign_app_api/core/constants/api_keys.dart';

class DeleteUserModel {
  final String message;

  DeleteUserModel({required this.message});

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) {
    return DeleteUserModel(message: json[ApiKey.message]);
  }
}
