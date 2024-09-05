import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sign_app_api/core/constants/api_keys.dart';
import 'package:sign_app_api/core/services/services.dart';

class ApiInterceptor extends Interceptor {
  MyServices myServices = Get.find();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        'FOODAPI ${myServices.sharedPreferences.getString(ApiKey.token)}';
    super.onRequest(options, handler);
  }
}
