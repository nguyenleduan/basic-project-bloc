
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../../config/api/url_config.dart';
import '../../../config/key_cache_config.dart';
import '../../../core/dio/data_state.dart';
import '../../../core/dio/status_code.dart';
import '../../../datasetting.dart';
import '../../../model/account_model.dart';
import '../../sharedPreferences/sharedPreferences_manager.dart';
import '../jwt_interceptor.dart';

class ApiLogin {
  ApiLogin._();

  static final ApiLogin _instance = ApiLogin._();

  static ApiLogin get instance => _instance;

  Dio get dio => _initDio();

  Dio _initDio() {
    final Dio dio = Dio();
    // final env = AppConfig.instance.env;
    dio
    // ..options.connectTimeout = 60000
    // ..options.receiveTimeout = 60000 as Duration?
      ..options.headers = {
        'Authorization': (DataSetting.accountModel.accessToken  ?? "").isNotEmpty ? 'Bearer ${DataSetting.accountModel.accessToken}': null,
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

  Future<DataState> getLogin({String? email, String? pass} ) async {
    try {
      final response = await dio.post(
          URLConfig.instance.urlLogin
          ,data: {
        "username": email,
        "password": pass
      }, options: Options(
        validateStatus: (statusCode) {
          return StatusCode.instance.checkStatusCode(statusCode!);
        },
      ));
      if (response.statusCode == 200) {
       print('Token: ${response.data['access_token']}');
        DataSetting.accountModel = AccountModel.fromJson(response.data);
        SharedPreferencesManager.instance.set<AccountModel>(KeyCacheConfig.instance.keyLogin, DataSetting.accountModel);
          return DataSuccess(true);
      }
      return DataFailed(response.statusCode!, "response.data['message']");
    } catch (e) {
      print('error: $e');
      return DataFailed(69, '$e');
    }
  }
  Future<DataState> loginGoogle(Map<String, dynamic> map) async {
    try {
      final response = await dio.post(
          URLConfig.instance.urlLoginGoogle
          ,data: map, options: Options(
        validateStatus: (statusCode) {
          return StatusCode.instance.checkStatusCode(statusCode!);
        },
      ));
      if (response.statusCode == 200) {
       print('Token: ${response.data['access_token']}');
        DataSetting.accountModel = AccountModel.fromJson(response.data);
        SharedPreferencesManager.instance.set<AccountModel>(KeyCacheConfig.instance.keyLogin, DataSetting.accountModel);
          return DataSuccess(true);
      }
      return DataFailed(response.statusCode!, "response.data['message']");
    } catch (e) {
      print('error: $e');
      return DataFailed(69, '$e');
    }
  }
  Future<DataState> forgotPassword(String email) async {
    try {
      final response = await dio.post(
          URLConfig.instance.urlForgotPassword
          ,data: FormData.fromMap({
        'email': email
      }), options: Options(
        validateStatus: (statusCode) {
          return StatusCode.instance.checkStatusCode(statusCode!);
        },
      ));
      if (response.statusCode == 200) {
          return const DataSuccess(true);
      }
      return DataFailed(response.statusCode!, "Gủi thông tin thất bại");
    } catch (e) {
      print('error: $e');
      return DataFailed(69, '$e');
    }
  }
  Future<DataState> createAccount({required String email,required String phone,required String pass,required String bOD, required String name,String? code,bool? isGetNotifications,String? gender }) async {
    try {
      final response = await dio.post(
          URLConfig.instance.urlCreateCAccount
          ,data: FormData.fromMap({
        'email': email,
        'username': phone,
        'password': pass,
        'name': name,
        'date_of_brith': bOD,
        'referral_code': code,
        'isGetNotifications': code,
        'gender': gender !=null ? gender == 'Nam' ? 'm' : 'f':null,
      }),  options: Options(
        validateStatus: (statusCode) {
          return StatusCode.instance.checkStatusCode(statusCode!);
        },
      ));
      if (response.statusCode == 200) {
          return DataSuccess(true);
      }else if (response.statusCode == 409) {
        String? message = response.data['email'] != null ? response.data['email'] :  response.data['username'];
        return DataFailed(response.statusCode!, "$message");
      }
      return DataFailed(response.statusCode!, "${response.statusCode!} --- api create error");
    } catch (e) {
      print('error: $e');
      return DataFailed(69, 'catch error $e');
    }
  }

}