
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../../../config/api/url_config.dart';
import '../../../core/dio/data_state.dart';
import '../../../datasetting.dart';
import '../../model/config_model.dart';

class ApiToken {
  ApiToken._();

  static final ApiToken _instance = ApiToken._();

  static ApiToken get instance => _instance;

  Dio get dio => _initDio();

  Dio _initDio() {
    final Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      return client;
    };
    return dio;
  }

  Future<DataState> getConfig() async {
    try {
      print("---- ${DataSetting.environment} --- ${URLConfig.instance.urlConfig}");
      final response = await dio.get( URLConfig.instance.urlConfig );
      if (response.statusCode == 200) {
         DataSetting.config = ConfigModel.fromJson(response.data);
        return const DataSuccess(true);
      }
      return DataFailed(response.statusCode!, "${response.statusCode!} get config error");
    } catch (e) {
      print('error getConfig: $e');
      return DataFailed(69, '$e');
    }
  }
}