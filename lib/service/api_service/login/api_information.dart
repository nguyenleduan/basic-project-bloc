// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:onlinica/datasetting.dart';

import '../../../config/api/url_config.dart';
import '../../../config/key_cache_config.dart';
import '../../../config/loading_config.dart';
import '../../../core/dio/data_state.dart';
import '../../../core/dio/status_code.dart';
import '../../../model/account_model.dart';
import '../../sharedPreferences/sharedPreferences_manager.dart';
import '../jwt_interceptor.dart';

class ApiInformation {
  ApiInformation._();

  static final ApiInformation _instance = ApiInformation._();

  static ApiInformation get instance => _instance;

  Dio get dio => _initDio();

  Dio _initDio() {
    final Dio dio = Dio();
    // final env = AppConfig.instance.env;
    dio
    // ..options.connectTimeout = 60000
    // ..options.receiveTimeout = 60000 as Duration?
      ..options.headers = {
        'Authorization': 'Bearer ${DataSetting.accountModel.accessToken}',
      }
      // ..interceptors.add(PrettyDioLogger(
      //   request: true,
      //   requestBody: true,
      //   responseBody: true,
      //   requestHeader: true,
      //   responseHeader: false,
      //   error: true,
      // ))
      ..interceptors.add(JWTInterceptor());

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // You can verify the certificate here
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };
    return dio;
  }

  Future<DataState> getUserInfo ({bool? isCheckLoading }) async {
    try {
      final response = await dio.get(
          URLConfig.instance.urlUserInfo  ,options: Options(
        validateStatus: (statusCode) {
          return StatusCode.instance.checkStatusCode(statusCode!);
        },
      ));
      if (response.statusCode == 200) {
        UserInfo info = UserInfo.fromJson(response.data['user']);
        UserProfile profile =  UserProfile.fromJson(response.data['user_profile']);
        DataSetting.accountModel.userInfo = info;
        DataSetting.accountModel.userProfile = profile;
        SharedPreferencesManager.instance.set<AccountModel>(KeyCacheConfig.instance.keyLogin, DataSetting.accountModel);
          return const DataSuccess(true);
      }
      return DataFailed(response.statusCode!, "Get discover error");
    } catch (e) {
      showError('$e');
      return DataFailed(69, '$e');
    }
  }

}