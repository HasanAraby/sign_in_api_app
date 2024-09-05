import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sign_app_api/core/api/api_consumer.dart';
import 'package:sign_app_api/core/constants/api_keys.dart';
import 'package:sign_app_api/core/constants/end_points.dart';
import 'package:sign_app_api/core/errors/exception.dart';
import 'package:sign_app_api/core/functions/upload_image_to_api.dart';
import 'package:sign_app_api/core/services/services.dart';
import 'package:sign_app_api/model/delete_user_model.dart';
import 'package:sign_app_api/model/get_user_model.dart';
import 'package:sign_app_api/model/log_out_model.dart';
import 'package:sign_app_api/model/sign_in_model.dart';
import 'package:sign_app_api/model/sign_up_model.dart';
import 'package:sign_app_api/model/update_user_model.dart';

class UserRepository {
  final ApiConsumer api;
  MyServices myServices = Get.find();

  UserRepository({required this.api});
  Future<Either<String, SignInModel>> signIn(
      {required String email, required String password}) async {
    try {
      final response = await api.post(EndPoint.signIn, data: {
        ApiKey.email: email,
        ApiKey.password: password,
      });
      final user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.token);
      myServices.sharedPreferences.setString(ApiKey.token, user.token);
      myServices.sharedPreferences
          .setString(ApiKey.id, decodedToken[ApiKey.id]);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, SignUpModel>> signUp({
    required String email,
    required String userName,
    required String phone,
    required String password,
    required String confirmPassword,
    required XFile profilePic,
  }) async {
    try {
      final response = await api.post(EndPoint.signUp, isFormData: true, data: {
        ApiKey.email: email,
        ApiKey.userName: userName,
        ApiKey.phone: phone,
        ApiKey.password: password,
        ApiKey.confirmPassword: confirmPassword,
        ApiKey.profilePic: await uploadImageToAPI(profilePic),
        ApiKey.location:
            '{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
      });

      final signUpModel = SignUpModel.fromJson(response);

      return Right(signUpModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, UpdateUserModel>> edit({
    required String phone,
    required String userName,
  }) async {
    try {
      final response =
          await api.patch(EndPoint.updateUser, isFormData: true, data: {
        ApiKey.phone: phone,
        ApiKey.userName: userName,
        ApiKey.location: """{
          "name": "Egypt",
          "address": "meet halfa",
          "coordinates": [1214451511, 12541845]
        }""",
      });

      final updateUserModel = UpdateUserModel.fromJson(response);
      return Right(updateUserModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, GetUserModel>> getUserData() async {
    try {
      final response = await api.get(EndPoint.getUserData(
          myServices.sharedPreferences.getString(ApiKey.id)!));

      final user = GetUserModel.fromJson(response[ApiKey.user]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, LogOutModel>> logOut() async {
    try {
      final response = await api.get(EndPoint.logOut);

      myServices.sharedPreferences.setString(ApiKey.id, '');

      final logOutModel = LogOutModel.fromJson(response);
      return Right(logOutModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }

  Future<Either<String, DeleteUserModel>> deleteUser() async {
    try {
      final response = await api.delete(EndPoint.deleteUser, queryParameters: {
        ApiKey.id: myServices.sharedPreferences.getString(ApiKey.id),
      });

      myServices.sharedPreferences.setString(ApiKey.id, '');
      final deleteModel = DeleteUserModel.fromJson(response);
      return Right(deleteModel);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
