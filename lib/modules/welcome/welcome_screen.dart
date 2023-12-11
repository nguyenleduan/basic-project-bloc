import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:onlinica/config/key_cache_config.dart';
import 'package:onlinica/config/loading_config.dart';
import 'package:onlinica/core/dio/data_state.dart';
import 'package:onlinica/datasetting.dart';
import 'package:onlinica/service/update_service.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../model/account_model.dart';
import '../../service/api_service/token_service.dart';
import '../../service/sharedPreferences/sharedPreferences_manager.dart';
import '../../widget/custom_image_view.dart';
import '../../widget/theme/custom_text_style.dart';
import '../../widget/theme/theme_helper.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    start();
  }
  Future<void> checkCache() async {
    print("----environment--- ${DataSetting.environment}");
    if((DataSetting.accountModel.accessToken ?? "").isNotEmpty){
      final result = DataSuccess;
      // final result = await ApiToken.instance.refreshToken(); // refresh token
      if(result is DataSuccess){
        // DataSetting.userInfo = await SharedPreferencesManager.instance.get(KeyCacheConfig.instance.keyLoginFB, UserInfoModel());
        // if(DataSetting.userInfo.id == null){
        //   /// get lại profile
        // }
        context.goNamed('Discover');
        return;
      }
    }
    context.goNamed('AfterWelcomeScreen');
  }
  Future<void> start() async {
    await SharedPreferencesManager.instance.init();
    if(DataSetting.environment == 0){
      DataSetting.environment = SharedPreferencesManager.instance.get(KeyCacheConfig.instance.keyEnvironment, 0);
    }
    DataSetting.accountModel = SharedPreferencesManager.instance.get<AccountModel>(KeyCacheConfig.instance.keyLogin, AccountModel());
    print("--======${DataSetting.environment}");
    final result = await ApiToken.instance.getConfig(); // refresh token
    if(result is DataSuccess){
      if(DataSetting.config.android!.isLockApp! && Platform.isAndroid){
        showInfo('${DataSetting.config.android!.messageLock}');
      }else if(DataSetting.config.iOS!.isLockApp! && Platform.isIOS){
        showInfo('${DataSetting.config.iOS!.messageLock}');
      }else{
        if(await UpdateService.instance.checkUpdate()){
          UpdateService.instance.showDialogUpdate(context,checkCache);
        }else{
          checkCache();
        }
      }
    }else{
      showError('Get config error');
    } 
  }
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      width: mediaQueryData.size.width,
      height: mediaQueryData.size.height,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        gradient: LinearGradient(
          begin: Alignment(0.47, -0.11),
          end: Alignment(0.47, 1.05),
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.onError,
            theme.colorScheme.primary,
          ],
        ),
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.img1welcome,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.maxFinite,
        padding: getPadding(
          top: 196,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Chào mừng đến với".toUpperCase(),
              style: CustomTextStyles.titleLargeWhiteA700Regular,
            ),
            SizedBox(height: getVerticalSize(16)),
            CustomImageView(
              svgPath: ImageConstant.imgLayer1,
              height: getVerticalSize(57),
              width: getHorizontalSize(200),
            ),
            SizedBox(height: getVerticalSize(5)),
          ],
        ),
      ),
    );
  }
}