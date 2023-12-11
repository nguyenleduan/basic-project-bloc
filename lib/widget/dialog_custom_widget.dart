import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onlinica/config/loading_config.dart';
import 'package:onlinica/core/dio/data_state.dart';
import 'package:onlinica/core/utils/image_constant.dart';
import 'package:onlinica/service/api_service/login/api_login.dart';
import 'package:onlinica/widget/custom_image_view.dart';
import 'package:onlinica/widget/password_widget.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';

import '../core/utils/size_utils.dart';

class DialogCustom {
  DialogCustom._();

  static final DialogCustom _instance = DialogCustom._();

  static DialogCustom get instance => _instance;
  // Navigator.of(context, rootNavigator: true).pop(true),
  void optionUpdateAvatar(BuildContext context, {Function? functionCamera,Function? functionAlbum}) {
    showGeneralDialog(
      context: context,
      barrierLabel: "optionUpdateAvatar",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Cập nhật ảnh đại diện",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:(){
                                if(functionCamera !=null){
                                  functionCamera!();
                                }
        },
                                    child: Icon(Icons.camera_alt_outlined,size: getSize(45),color: appTheme.blueX,)),
                                const Text("Camera",style: TextStyle(fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                    onTap:(){
                                      if(functionAlbum !=null){
                                        functionAlbum!();
                                      }
                                    },child: Icon(Icons.image_outlined,size: getSize(45),color: appTheme.blueX,)),
                                const Text("Thư viện ảnh",style: TextStyle(fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: getVerticalSize(20),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void resetPassWord(BuildContext context, {Function? function}) {
    TextEditingController controller = TextEditingController();
    showGeneralDialog(
      context: context,
      barrierLabel: "showResetPassWord",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Đặt lại mật khẩu",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Nhập địa chỉ email của tài khoản và chúng tôi sẽ gửi hướng dẫn đặt lại mật khẩu cho bạn.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: getSize(16)),
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Container(
                        padding: getPadding(left: 10,right: 10),
                          margin: getMargin(left: 5,right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(getSize(10))),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none
                            ),
                            controller: controller,
                          )),
                      SizedBox(height: getVerticalSize(10),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(50),
                  child: Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: ()   {
                            Navigator.of(context, rootNavigator: true).pop(true);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Text("Huỷ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                        ),
                      )),
                      Container(height: getVerticalSize(50),
                        width: getHorizontalSize(0.5),
                        color: Colors.black12,),
                      Expanded(child: InkWell(
                        onTap: () async {
                          if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(controller.value.text)){
                            EasyLoading.showInfo('Email không đúng định dạng');
                          }else if(controller.value.text.isNotEmpty){
                            EasyLoading.show(status: "Loading...");
                            final result = await ApiLogin.instance.forgotPassword(controller.value.text);
                            EasyLoading.dismiss();
                            if(result is DataSuccess){
                              // EasyLoading.showSuccess('Gửi thành công\n Vui lòng kiểm tra email của bạn');
                              Navigator.of(context, rootNavigator: true).pop(true);
                              resetPassWordSuccess(context);
                            }else{
                              EasyLoading.showError('${result.error}');
                              // Navigator.of(context, rootNavigator: true).pop(true);
                            }
                            // Navigator.of(context, rootNavigator: true).pop(true);
                            // if(function !=null){
                            //   function!();
                            // }
                          }else{
                            EasyLoading.showInfo("Bạn chưa nhập email");
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Text('OK',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void createAccount(BuildContext context ) {
    TextEditingController controllerName = TextEditingController();
    TextEditingController controllerPhone = TextEditingController();
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPass = TextEditingController();
    var mediaQuery = MediaQuery.of(context);
    showGeneralDialog(
      context: context,
      barrierLabel: "createAccount",
      barrierDismissible: false, 
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Container(
          alignment: Alignment.center,
          margin: getMargin(bottom: 100),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Đăng ký",
                        style: TextStyle(
                            fontSize: getSize(25), fontWeight: FontWeight.w700),
                      ),
                      // SizedBox(
                      //   height: getVerticalSize(10),
                      // ),
                      // Text(
                      //   "Nhập địa chỉ email của tài khoản và chúng tôi sẽ gửi hướng dẫn đặt lại mật khẩu cho bạn.",
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(fontSize: getSize(16)),
                      // ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Container(
                        padding: getPadding(left: 10,right: 10),
                          margin: getMargin(left: 5,right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(getSize(10))),
                          child: Row(
                            children: [
                              Text('*',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Họ và Tên',
                                    border: InputBorder.none
                                  ),
                                  controller: controllerName,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Container(
                        padding: getPadding(left: 10,right: 10),
                          margin: getMargin(left: 5,right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(getSize(10))),
                          child: Row(
                            children: [
                              Text('*',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                              Expanded(
                                child: TextField(
                                  maxLength: 10,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: 'Số điện thoại',
                                    border: InputBorder.none,
                                    counterText: "",
                                  ),
                                  controller: controllerPhone,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Container(
                        padding: getPadding(left: 10,right: 10),
                          margin: getMargin(left: 5,right: 5),
                          decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(getSize(10))),
                          child: Row(
                            children: [
                              Text('*',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    border: InputBorder.none
                                  ),
                                  controller: controllerEmail,
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      PassWordWidget(controllerPass),
                      SizedBox(height: getVerticalSize(10),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: getVerticalSize(50),
                  child: Row(
                    children: [
                      Expanded(child: InkWell(
                        onTap: ()=>Navigator.of(context, rootNavigator: true).pop(true),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Text("Huỷ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                        ),
                      )),
                      Container(height: getVerticalSize(50),
                        width: getHorizontalSize(0.5),
                        color: Colors.black12,),
                      Expanded(child: InkWell(
                        onTap: () async {
                          // if(controllerName.value.text.isEmpty){
                          // }else if(controllerPhone.value.text.isEmpty){
                          //   EasyLoading.showInfo('Chưa nhập số điện thoại');
                          // }else if(controllerEmail.value.text.isEmpty){
                          //   EasyLoading.showInfo('Chưa nhập email');
                          // }else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          //     .hasMatch(controllerEmail.value.text)){
                          //   EasyLoading.showInfo('Email không đúng định dạng');
                          // }else if(controllerPass.value.text.isEmpty){
                          //   EasyLoading.showInfo('Chưa nhập mật khẩu');
                          // }else{
                          //   showLoading();
                          //   DataState result = await ApiLogin.instance.createAccount(controllerEmail.value.text, controllerPhone.value.text,
                          //       controllerPass.value.text, controllerName.value.text);
                          //   if(result is DataSuccess){
                          //     Navigator.of(context, rootNavigator: true).pop(true);
                          //     showSuccess('Đã đăng ký thành công');
                          //   }else{
                          //     showInfo(result.error.toString());
                          //   }
                          // }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: double.maxFinite,
                          child: Text('OK',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void resetPassWordSuccess(BuildContext context ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "resetPassWordSuccess",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Đã gửi email đặt lại mật khẩu",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Chúng tôi đã gửi tin nhắn hướng dẫn đặt lại mật khẩu đến địa chỉ email của bạn. Nếu bạn vẫn chưa nhận được email sau ít phút, vui lòng kiểm tra thư mục spam.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: getSize(16)),
                      ),
                      SizedBox(height: getVerticalSize(10),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(50),
                  child: InkWell(
                    onTap: ()=>Navigator.of(context, rootNavigator: true).pop(true),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: Text("OK",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                    ),
                  )
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void notifyCancelTrip(BuildContext context,Function function ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "notifyCreateTrip",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Thông báo",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgIsolationmode,
                      ),
                      Padding(
                        padding: getPadding(left: 20,right: 20,top: 15),
                        child: Text(
                          "Chọn hủy đồng nghĩa với việc bạn không thể tiếp tục học các khóa học trong Hành trình tri thức",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getSize(16),color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 20,right: 20,top: 15),
                        child: Text(
                          "<Curriculum Name>",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getSize(16),color: appTheme.blueXD),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(10),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                SizedBox(
                  height: getVerticalSize(50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: double.maxFinite,
                            height: getVerticalSize(50),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context, rootNavigator: true).pop(true);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Text("Quay lại",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                              ),
                            )
                        ),
                      ),
                      Container(width: getHorizontalSize(1),
                        color: Colors.black12,),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: getVerticalSize(50),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context, rootNavigator: true).pop(true);
                              function();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Text("Huỷ đăng ký",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void notifyBlockAccount(BuildContext context, Function function ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "notifyBlockAccount",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Xác nhận xoá tài khoản",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      CustomImageView(
                        color: Colors.red,
                        svgPath: ImageConstant.imgIsolationmode,
                      ),
                      Padding(
                        padding: getPadding(left: 20,right: 20,top: 15),
                        child: Text(
                          "Bạn đã chắc chắn ràng\nxoá tài khoản này",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getSize(21) ,fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(10),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                SizedBox(
                  height: getVerticalSize(50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: double.maxFinite,
                            height: getVerticalSize(50),
                            child: InkWell(
                              onTap: ()=>Navigator.of(context, rootNavigator: true).pop(true),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Text("Quay lại",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                              ),
                            )
                        ),
                      ),
                      Container(width: getHorizontalSize(1),
                        color: Colors.black12,),
                      Expanded(
                        child: SizedBox(
                          width: double.maxFinite,
                          height: getVerticalSize(50),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context, rootNavigator: true).pop(true);
                              function();
                              // notifyCreateTrip(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Text("Xác nhận",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getSize(15),color: Colors.red, fontWeight: FontWeight.w700),),
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void notifyCreateTrip(BuildContext context, ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "notifyCreateTrip",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Thông báo",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgCheckCircle,
                      ),
                      Padding(
                        padding: getPadding(left: 20,right: 20,top: 15),
                        child: Text(
                          "Huỷ đăng ký thành công",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getSize(20),color: appTheme.blueX,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(20),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                SizedBox(
                  height: getVerticalSize(50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: double.maxFinite,
                            height: getVerticalSize(50),
                            child: InkWell(
                              onTap: ()=>Navigator.of(context, rootNavigator: true).pop(true),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Text("Đóng",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                              ),
                            )
                        ),
                      ),
                      Container(width: getHorizontalSize(1),
                        color: Colors.black12,),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: getVerticalSize(50),
                          child: InkWell(
                            onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true);
                                notifyUpdateVipTrip(context);
                              },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Text("Đăng ký mới",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void notifyUpdateVipTrip(BuildContext context, ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "notifyCreateTrip",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Thông báo",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgIsolationmode,
                      ),
                      Padding(
                        padding: getPadding(left: 10,right: 10,top: 15),
                        child: Text(
                          "Oops gói subscription của bạn đã hết hạn\nNâng cấp VIP ngay để không bị gián đoạn quá trình học của bạn",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getSize(16),color: Colors.black),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(20),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                SizedBox(
                  height: getVerticalSize(50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: double.maxFinite,
                            height: getVerticalSize(50),
                            child: InkWell(
                              onTap: ()=>Navigator.of(context, rootNavigator: true).pop(true),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Text("Huỷ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                              ),
                            )
                        ),
                      ),
                      Container(width: getHorizontalSize(1),
                        color: Colors.black12,),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: getVerticalSize(50),
                          child: InkWell(
                            onTap: ()  {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true);
                              notifyGoHTTTTrip(context);
                              },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Text("Nâng cấp VIP",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }
  void notifyGoHTTTTrip(BuildContext context, ) {
    showGeneralDialog(
      context: context,
      barrierLabel: "notifyCreateTrip",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: appTheme.xam2, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: getMargin(all: 5
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getVerticalSize(10),
                      ),
                      Text(
                        "Thông báo",
                        style: TextStyle(
                            fontSize: getSize(20), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgSetting,
                      ),
                      Padding(
                        padding: getPadding(left: 10,right: 10,top: 15),
                        child: Text(
                          "Bạn đã đăng ký 3/3 hành trình tri thức. Để đăng ký thêm, vui lòng hoàn thành hoặc hủy 1 trong số các hành trình tri thức của bạn.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: getSize(16),color: Colors.black),
                        ),
                      ),
                      SizedBox(height: getVerticalSize(20),),
                    ],
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: getVerticalSize(0.5),
                  color: Colors.black12,
                ),
                SizedBox(
                  height: getVerticalSize(50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            width: double.maxFinite,
                            height: getVerticalSize(50),
                            child: InkWell(
                              onTap: ()=>Navigator.of(context, rootNavigator: true).pop(true),
                              child: Container(
                                alignment: Alignment.center,
                                width: double.maxFinite,
                                height: double.maxFinite,
                                child: Text("Đóng",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                              ),
                            )
                        ),
                      ),
                      Container(width: getHorizontalSize(1),
                        color: Colors.black12,),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: getVerticalSize(50),
                          child: InkWell(
                            onTap: ()=>Navigator.of(context, rootNavigator: true).pop(true),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.maxFinite,
                              height: double.maxFinite,
                              child: Text("Hành trình của tôi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: getSize(15),color: appTheme.blueLogin, fontWeight: FontWeight.w700),),
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(1, 2), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

// void showImage(BuildContext context, String url) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Container(
//           child:  Stack(
//             children: [
//               CustomImageView(
//                 height: double.infinity,
//                 margin: getMargin(top: 50),
//                 url: url,
//               ),
//               Positioned(
//                   right: 2,top: 2,
//                   child: InkWell(
//                       onTap: () =>
//                           Navigator.of(context, rootNavigator: true).pop(true),
//                       child: CustomImageView(svgPath: 'assets/img/image_close.svg',height: getSize(30),)))
//             ],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 150),
//           decoration: BoxDecoration(
//               color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }

// void showImageFile(BuildContext context, File file) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Container(
//           child:  Stack(
//             children: [
//               CustomImageView(
//                 height: double.infinity,
//                 margin: getMargin(top: 50),
//                 file: file,
//               ),
//               Positioned(
//                   right: 2,top: 2,
//                   child: InkWell(
//                       onTap: () =>
//                           Navigator.of(context, rootNavigator: true).pop(true),
//                       child: CustomImageView(svgPath: 'assets/img/image_close.svg',height: getSize(30),)))
//             ],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 20,vertical: 150),
//           decoration: BoxDecoration(
//               color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }

// void showCustomDialog(BuildContext context, String tile, String content) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                   margin: getMargin(all: 10),
//                   padding: getPadding(top: 20),
//                   child: Text(
//                     tile,
//                     style: TextStyle(
//                         fontSize: getSize(24), fontWeight: FontWeight.w700),
//                   )),
//               SizedBox(
//                 height: getVerticalSize(10),
//               ),
//               Container(
//                 margin: getMargin(all: 10),
//                 child: Text(
//                   content,
//                   textAlign: TextAlign.center,
//                 ),
//                 alignment: Alignment.center,
//               ),
//               CustomButton(
//                 margin: getMargin(all: 20),
//                 onTap: () =>
//                     Navigator.of(context, rootNavigator: true).pop(true),
//                 height: getVerticalSize(
//                   45,
//                 ),
//                 text: "ĐÓNG",
//               ),
//             ],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }
//
// void showCustomYesNoWarningDialog(BuildContext context, String tile, String content, {Function? function}) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                   margin: getMargin(all: 10),
//                   padding: getPadding(top: 20),
//                   child: Text(
//                     tile,
//                     style: TextStyle(color: Colors.red,
//                         fontSize: getSize(24), fontWeight: FontWeight.w700),
//                   )),
//               Container(
//                 margin: getMargin(all: 10),
//                 child: Text(
//                   content,
//                   textAlign: TextAlign.center,
//                 ),
//                 alignment: Alignment.center,
//               ),
//               Container(
//                 width: double.maxFinite,
//                 margin: getMargin(all: 10),
//                 height: getVerticalSize(
//                   45,
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: CustomButton(
//                         onTap: () =>
//                             Navigator.of(context, rootNavigator: true).pop(true),
//                         height: getVerticalSize(
//                           45,
//                         ),
//                         text: "ĐÓNG",
//                       ),
//                     ),
//                     SizedBox(width: getHorizontalSize(10),),
//                     Expanded(
//                       child: CustomButton(
//                         onTap: () {
//                           Navigator.of(context, rootNavigator: true).pop(true);
//                           if(function !=null){
//                             function!();
//                           }
//                         }
//                             ,
//                         height: getVerticalSize(
//                           45,
//                         ),
//                         text: "XÁC NHẬN",
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }
//
// void showCustomDialogFunction(BuildContext context, String tile, String content,Function function) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                   margin: getMargin(all: 10),
//                   padding: getPadding(top: 20),
//                   child: Text(
//                     tile,
//                     style: TextStyle(
//                         fontSize: getSize(24), fontWeight: FontWeight.w700),
//                   )),
//               SizedBox(
//                 height: getVerticalSize(10),
//               ),
//               Container(
//                 margin: getMargin(all: 10),
//                 child: Text(
//                   content,
//                   textAlign: TextAlign.center,
//                 ),
//                 alignment: Alignment.center,
//               ),
//               CustomButton(
//                 margin: getMargin(all: 20),
//                 onTap: () =>function(),
//                 height: getVerticalSize(
//                   45,
//                 ),
//                 text: "ĐÓNG",
//               ),
//             ],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }
//
// void showCustomDialogContact(BuildContext context) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Barrier",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: getVerticalSize(10),
//               ),
//               Container(
//                   margin: getMargin(all: 10),
//                   child: Text(
//                     'Liên hệ',
//                     style: TextStyle(
//                         fontSize: getSize(24), fontWeight: FontWeight.w700),
//                   )),
//               Container(
//                   margin: getMargin(all: 5),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: 'Vui lòng gọi vào số',
//                       style: DefaultTextStyle.of(context).style,
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: ' Hotline: 0314630000',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: ColorConstant.backGroupWelcome),
//                         ),
//                       ],
//                     ),
//                   )),
//               Text("để được hỗ trợ"),
//               SizedBox(
//                 height: getVerticalSize(10),
//               ),
//               CustomButton(
//                 margin: getMargin(all: 20),
//                 onTap: () =>
//                     Navigator.of(context, rootNavigator: true).pop(true),
//                 height: getVerticalSize(
//                   45,
//                 ),
//                 text: "ĐÓNG",
//               ),
//             ],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }
// void showCustomDialogBlock(BuildContext context) {
//   showGeneralDialog(
//     context: context,
//     barrierLabel: "Block",
//     barrierDismissible: true,
//     barrierColor: Colors.black.withOpacity(0.5),
//     transitionDuration: Duration(milliseconds: 300),
//     pageBuilder: (_, __, ___) {
//       return Center(
//         child: Container(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: getVerticalSize(10),
//               ),
//               Container(
//                   margin: getMargin(all: 10),
//                   child: Text(
//                     'Tài khoản bị khoá',
//                     style: TextStyle(
//                         fontSize: getSize(24), fontWeight: FontWeight.w700),
//                   )),
//               Container(
//                   margin: getMargin(all: 5),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       text: 'Tài khoản của bạn đã bị khoá. Vui lòng liên hệ\nđến số ',
//                       style: DefaultTextStyle.of(context).style.copyWith(fontSize: getFontSize(14)),
//                       children: <TextSpan>[
//                         TextSpan(
//                           text: 'Hotline: 0314630000',
//                           style: TextStyle(
//                               fontSize: getFontSize(14),
//                               fontWeight: FontWeight.bold,
//                               color: ColorConstant.backGroupWelcome),
//                         ),
//                         TextSpan(
//                           text: ' để được hỗ trợ',
//                           style: DefaultTextStyle.of(context).style.copyWith(fontSize: getFontSize(14)),
//                         ),
//                       ],
//                     ),
//                   )),
//               SizedBox(
//                 height: getVerticalSize(10),
//               ),
//               CustomButton(
//                 margin: getMargin(all: 20),
//                 onTap: () =>
//                     Navigator.of(context, rootNavigator: true).pop(true),
//                 height: getVerticalSize(
//                   45,
//                 ),
//                 text: "ĐÓNG",
//               ),
//             ],
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           decoration: BoxDecoration(
//               color: Colors.white, borderRadius: BorderRadius.circular(20)),
//         ),
//       );
//     },
//     transitionBuilder: (_, anim, __, child) {
//       Tween<Offset> tween;
//       if (anim.status == AnimationStatus.reverse) {
//         tween = Tween(begin: Offset(-1, 2), end: Offset.zero);
//       } else {
//         tween = Tween(begin: Offset(1, 2), end: Offset.zero);
//       }
//
//       return SlideTransition(
//         position: tween.animate(anim),
//         child: FadeTransition(
//           opacity: anim,
//           child: child,
//         ),
//       );
//     },
//   );
// }
}
