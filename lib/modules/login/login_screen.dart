import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlinica/config/key_cache_config.dart';
import 'package:onlinica/config/loading_config.dart';
import 'package:onlinica/datasetting.dart';
import 'package:onlinica/modules/login/bloc/login_bloc.dart';
import 'package:onlinica/service/sharedPreferences/sharedPreferences_manager.dart';
import 'package:onlinica/widget/dialog_custom_widget.dart';
import '../../config/api/url_config.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../firebase_options.dart';
import '../../service/Chrome.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_image_view.dart';
import '../../widget/theme/app_decoration.dart';
import '../../widget/theme/custom_button_style.dart';
import '../../widget/theme/custom_text_style.dart';
import '../../widget/theme/theme_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc  bloc = LoginBloc();
  @override
  void initState() {
    super.initState();
  }
  void sendEmailResetPassword(){
    showLoading();
    Timer(Duration(seconds: 2), () {
      EasyLoading.dismiss();
      DialogCustom.instance.resetPassWordSuccess(context);
    });
  }
  final ChromeSafariBrowser browser = MyChromeSafariBrowser();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocConsumer<LoginBloc,LoginState>(
      bloc: bloc!,
      listener: (context, state) {
        if(state is LoadingState){
          EasyLoading.show(status: 'Loading...');
        }
        if(state is LoginSuccessState){
          EasyLoading.dismiss();
          context.goNamed('Discover');
        }
        if(state is ErrorState){
          EasyLoading.dismiss();
          EasyLoading.showError(state.error!);
        }
      },  builder: (context, state) => SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: bloc.formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Container(
                        padding: getPadding(top: 24, bottom: 24),
                        decoration: AppDecoration.fillGray,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: getMargin(right: 12, left: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: ()=>context.pop(),
                                        child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Icon(Icons.close)),
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                          "Đăng nhập",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: getSize(20),
                                              color: appTheme.blueX,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              ),
                              Container(
                                margin: getMargin(right: 12, left: 12, top: 20),
                                height: getVerticalSize(44),
                                alignment: Alignment.centerLeft,
                                padding: getPadding(left: 12, right: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: getSize(0.5),
                                        color: Colors.black26)),
                                child: TextField(
                                  controller: bloc.emailController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Số điện thoại / Email'),
                                ),
                              ),
                              Container(
                                margin: getMargin(right: 12,top: 12, left: 12),
                                height: getVerticalSize(44),
                                padding: getPadding(left: 12, right: 12),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: getSize(0.5),
                                        color: Colors.black26)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        obscureText: bloc.isCheckPass,
                                        controller: bloc.passwordlabelController,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Mật khẩu của bạn'),
                                      ),
                                    ),
                                    CustomImageView(
                                      onTap: ()=>setState(() {
                                        bloc.isCheckPass = !bloc.isCheckPass;
                                      }) ,
                                        width: getSize(17),
                                        height: getSize(17),
                                        svgPath: ImageConstant.imgCall)
                                  ],
                                ),
                              ),
                              Padding(
                                  padding:
                                  getPadding(left: 12, top: 16, right: 12),
                                  child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                              padding:
                                              getPadding(left: 12,right: 12),
                                              child: Divider(
                                                  height: 1,
                                                  color: Colors.black26)),
                                        ),
                                        Text("Hoặc",
                                            style: CustomTextStyles
                                                .bodyLargeGray700_1),
                                        Expanded(
                                          child: Padding(
                                              padding:
                                              getPadding(left: 12,right: 12),
                                              child: Divider(
                                                  height: 1,
                                                  color: Colors.black26)),
                                        ),
                                      ])), 
                              if(DataSetting.config.isLogin ?? true)CustomElevatedButton(
                                onTap: (){
                                  // print("${bloc?.check}");
                                  // signInWithGoogle();
                                  bloc.add(LoginGoogle());
                                },
                                  height: getVerticalSize(40),
                                  text: "Đăng nhập với Google",
                                  margin:
                                  getMargin(left: 12, top: 13, right: 12),
                                  leftIcon: Container(
                                      margin: getMargin(right: 12),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgClock)),
                                  buttonStyle: CustomButtonStyles.fillOnPrimary,
                                  buttonTextStyle:
                                  CustomTextStyles.titleMediumGray100),
                              if(DataSetting.config.isLogin ?? true)CustomElevatedButton(
                                  onTap: (){
                                    bloc!.add(LoginFacebook( ));
                                  },
                                  height: getVerticalSize(40),
                                  text: "Đăng nhập với Facebook",
                                  margin:
                                  getMargin(  top: 12,left: 12,right: 12 ),
                                  leftIcon: Container(
                                      margin: getMargin(right: 12),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgFacebook)),
                                  buttonStyle: CustomButtonStyles.fillIndigo,
                                  buttonTextStyle:
                                  CustomTextStyles.titleMediumGray100),
                              // CustomElevatedButton(
                              //     height: getVerticalSize(40),
                              //     text: "Đăng nhập với LinkedIn",
                              //     margin:
                              //     getMargin(left: 12, top: 12, right: 12),
                              //     leftIcon: Container(
                              //         margin: getMargin(right: 12),
                              //         child: CustomImageView(
                              //             svgPath: ImageConstant
                              //                 .imgSocialMediaLogo)),
                              //     buttonStyle: CustomButtonStyles.fillLightBlue,
                              //     buttonTextStyle:
                              //     CustomTextStyles.titleMediumGray100),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: getPadding(left: 12, top: 21),
                                      child: InkWell(
                                        onTap: (){
                                          DialogCustom.instance.resetPassWord(context,function: sendEmailResetPassword);
                                        },
                                        child: Text("Quên mật khẩu?",
                                            style: CustomTextStyles
                                                .bodyLargeBlue800),
                                      ))),
                              Container(
                                  padding: getPadding(left: 12, top: 5),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(  "Bạn chưa có tài khoản? ",
                                          style:
                                          theme.textTheme.bodyLarge),
                                      InkWell(
                                        onTap: ()   {
                                          context.pushNamed('RegisTrationScreen');
                                        },
                                        // onTap: ()=>
                                        //     LaunchService.instance.openURL('${URLConfig.instance.domain()}/login'),
                                        child: Text("Đăng ký ngay",
                                            style: CustomTextStyles
                                                .bodyLargeBlue800_1),
                                      )
                                    ],
                                  )),
                              CustomElevatedButton(
                                  buttonStyle: CustomButtonStyles.login,
                                alignment: Alignment.center,
                                onTap: ()=>
                                    bloc!.add(Login()),
                                  height: getVerticalSize(40),
                                  text: "Đăng nhập",
                                  margin: getMargin(
                                      left: 12, top: 18, right: 12, bottom: 18))
                            ])))))) ,
    );
  }
  onTapCloseone(BuildContext context) {
    Navigator.pop(context);
  }
}
