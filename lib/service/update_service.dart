import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onlinica/service/sharedPreferences/sharedPreferences_manager.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';
import '../config/key_cache_config.dart';
import '../core/utils/size_utils.dart';
import '../datasetting.dart';
import '../model/account_model.dart';
import 'launch_service.dart';

class UpdateService{
  UpdateService._();
  static final UpdateService _instance = UpdateService._();
  static UpdateService get instance => _instance;

  Future<bool> checkUpdate() async {
    try{

      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String version = packageInfo.version;
      if(DataSetting.config != null){
        String versionCache = SharedPreferencesManager.instance.get<String>(KeyCacheConfig.instance.keyVerUpdate, '1.1.1');
        if (Platform.isAndroid){
          if((Version.parse(version) < Version.parse(DataSetting.config?.android!.versionAnroid ?? '1.1.1')
              &&  versionCache != DataSetting.config?.android!.versionAnroid)
              || (DataSetting.config?.android!.isObligatoryUpdate ?? false)  ){
            return DataSetting.config?.android!.versionAnroid  != DataSetting.version;
          }
        } else if (Platform.isIOS){
          if((Version.parse(version) < Version.parse(DataSetting.config?.iOS!.versionIOS ?? '1.1.1')
              &&  versionCache != DataSetting.config?.iOS!.versionIOS)
              || (DataSetting.config?.iOS!.isObligatoryUpdate ?? false)  ){
            return DataSetting.config?.iOS!.versionIOS != DataSetting.version;
          }
        }
        return false;
      }else{
        await EasyLoading.showError("Get config error");
      }
      return false;
    }catch(e){
      await EasyLoading.showError("$e");
      return false;
    }
  }
  Future<void> showDialogUpdate(BuildContext context ,Function function) async {
    bool isNotRepeat = false;
    bool isObligatoryUpdateC = false;
    if((Platform.isAndroid)){
      isObligatoryUpdateC =  DataSetting.config?.android!.isObligatoryUpdate ?? false;
    }else{
      isObligatoryUpdateC =  DataSetting.config?.iOS!.isObligatoryUpdate ?? false;
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (context, setState) {
            return Column(
              children: [
                const Spacer(),
                Center(
                  child: Container(
                    margin: getMargin(left: 16, right: 16),
                    padding:
                    getPadding(top: 16, left: 16, right: 16, bottom: 4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Text((Platform.isAndroid) ? DataSetting.config?.android!.titleUpdate?? "" : DataSetting.config?.iOS!.titleUpdate ?? "" ,
                            style:   TextStyle(
                                fontSize: getSize(20),
                                fontWeight: FontWeight.w700,
                                height: 1.5)),
                        Padding(
                          padding: getPadding(top: 16, bottom: 20),
                          child: Text((Platform.isAndroid) ? DataSetting.config?.android!.contentUpdate?? "" : DataSetting.config?.iOS!.contentUpdate ?? "" ,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2)),
                        ),
                        isObligatoryUpdateC ? Container() : Container(
                          margin: getMargin(bottom: getVerticalSize(4)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isNotRepeat = !isNotRepeat;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(isNotRepeat ? Icons.check_box : Icons.check_box_outline_blank,color: appTheme.blueXD,),
                                    Padding(
                                      padding: getPadding(left: 8),
                                      child: Text(
                                        "Không nhắc lại",
                                        style: TextStyle(fontSize: getSize(14)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isObligatoryUpdateC
                                ? Container()
                                : Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      if (isNotRepeat) {
                                        SharedPreferencesManager.instance.set<String?>(
                                            KeyCacheConfig
                                                .instance.keyVerUpdate,
                                            Platform.isIOS ? DataSetting.config?.iOS!.versionIOS! : DataSetting.config?.android!.versionAnroid!  ,
                                            5 * 24 * 60);
                                      }else{
                                          print("Clear AccountModel cache ");
                                          DataSetting.accountModel = AccountModel();
                                          SharedPreferencesManager.instance.clear(KeyCacheConfig.instance.keyLogin);
                                      }
                                      function();
                                    },
                                    child: const  Text('Cập nhật sau'))),
                            Expanded(
                                child: TextButton(
                                    onPressed: ()   {
                                        LaunchService.instance.openURL(
                                          Platform.isIOS
                                              ? DataSetting
                                              .config?.linkStore!.appStore! ?? ""
                                              : DataSetting
                                              .config?.linkStore!.appStore!  ?? "");
                                    },
                                    child: const Text('Cập nhật ngay')))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer()
              ],
            );
          });
        });
  }


}