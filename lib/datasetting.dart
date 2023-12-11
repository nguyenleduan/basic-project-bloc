
import 'package:flutter/cupertino.dart';
import 'package:onlinica/service/sharedPreferences/sharedPreferences_manager.dart';

import 'model/account_model.dart';
import 'model/config_model.dart';
class DataSetting {
  DataSetting._();

  static final DataSetting _instance = DataSetting._();

  static DataSetting get instance => _instance;
  static BuildContext? contextHome;
  static int? environment = 0; // 0 pro // 1 QA // 2 dev
  static int indexButtonBar = 0;
  static int limit = 10;
  static bool isShowAppbar = true;
  static String? tokenFCM;
  static String  refreshToken = '';
  static AccountModel accountModel = AccountModel();
  static ConfigModel config = ConfigModel();
  static String? version;
  static bool  isSubcription = false;
  static String? name;
  static String? email;
  void reStart(){
    environment = 0;
    indexButtonBar = 0;
    isShowAppbar = true;
    tokenFCM = null;
    refreshToken = '';
    accountModel = AccountModel();
    isSubcription = false;
    SharedPreferencesManager.instance.clear();
  }
}
