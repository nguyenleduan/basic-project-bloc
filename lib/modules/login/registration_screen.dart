import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:onlinica/core/utils/format_time.dart';
import 'package:onlinica/modules/login/bloc/login_bloc.dart';

import '../../config/loading_config.dart';
import '../../core/dio/data_state.dart';
import '../../core/utils/size_utils.dart';
import '../../service/api_service/login/api_login.dart';
import '../../widget/password_widget.dart';
import '../../widget/theme/app_decoration.dart';
import '../../widget/theme/theme_helper.dart';

class RegisTrationScreen extends StatefulWidget {
  const RegisTrationScreen({super.key});

  @override
  State<RegisTrationScreen> createState() => _RegisTrationScreenState();
}

class _RegisTrationScreenState extends State<RegisTrationScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerCode = TextEditingController();
  TextEditingController controllerPass = TextEditingController();
  TextEditingController controllerPass2 = TextEditingController();
  LoginBloc bloc = LoginBloc();
  String? gender;
  String? bOD;
  String? bODCall;

  bool isInformation = false;
  bool isSendInformation = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: bloc!,
      listener: (context, state) {
        if (state is LoadingState) {
          EasyLoading.show(status: 'Loading...');
        }
        if (state is LoginSuccessState) {
          EasyLoading.dismiss();
          context.goNamed('Discover');
        }
        if (state is ErrorState) {
          EasyLoading.dismiss();
          EasyLoading.showError(state.error!);
        }
      },
      builder: (context, state) => SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SingleChildScrollView(
                child: Form(
                    key: bloc.formKey,
                    child: SizedBox(
                        width: double.maxFinite,
                        child: Container(
                            padding: const EdgeInsets.only(top: 24, bottom: 24, left: 12, right: 12),
                            decoration: AppDecoration.fillGray,
                            child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () => context.pop(),
                                      child: Container(alignment: Alignment.centerLeft, child: Icon(Icons.close)),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Đăng ký",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: getSize(20), color: appTheme.blueX, fontWeight: FontWeight.w700),
                                  )),
                                  Expanded(child: Container()),
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              SizedBox(
                                height: getVerticalSize(10),
                              ),
                              Container(
                                  height: getVerticalSize(50),
                                  padding: getPadding(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black.withOpacity(0.5), width: getSize(0.1)),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      const Text(
                                        '*',
                                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: 'Họ và Tên',
                                              hintStyle: TextStyle(fontSize: getSize(16)),
                                              border: InputBorder.none),
                                          controller: controllerName,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: getVerticalSize(12),
                              ),
                              Container(
                                  height: getVerticalSize(50),
                                  padding: getPadding(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black.withOpacity(0.5), width: getSize(0.1)),
                                      color: Colors.white),
                                  child: Row(
                                    children: [
                                      const Text(
                                        '*',
                                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          maxLength: 10,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            hintText: 'Số điện thoại',
                                            hintStyle: TextStyle(fontSize: getSize(16)),
                                            border: InputBorder.none,
                                            counterText: "",
                                          ),
                                          controller: controllerPhone,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: getVerticalSize(12),
                              ),
                              Container(
                                  height: getVerticalSize(50),
                                  padding: getPadding(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black.withOpacity(0.5), width: getSize(0.1)),
                                  ),
                                  child: Row(
                                    children: [
                                      const Text(
                                        '*',
                                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              hintText: 'Email',
                                              hintStyle: TextStyle(fontSize: getSize(16)),
                                              border: InputBorder.none),
                                          controller: controllerEmail,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: getVerticalSize(12),
                              ),
                              PassWordWidget(
                                controllerPass,
                                hint: 'Mật khẩu của bạn',
                              ),
                              SizedBox(
                                height: getVerticalSize(12),
                              ),
                              Container(
                                  height: getVerticalSize(50),
                                  padding: getPadding(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black.withOpacity(0.5), width: getSize(0.1)),
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                        final DateTime? picked = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1900),
                                            lastDate: DateTime.now(),
                                            locale: const Locale('vi'));
                                        if (picked != null) {
                                          bOD = FormatDate.instance.dateTimeToStringDDMMYYYY(picked);
                                          bODCall = FormatDate.instance.dateTimeToStringYYYYMMDD(picked);
                                        } else {
                                          bODCall = null;
                                          bOD = null;
                                        }
                                        print("BOD: $bOD");
                                        print("--- BOD: $bODCall");
                                        setState(()   {});
                                    },
                                    child: Row(
                                      children: [
                                        const Text(
                                          '',
                                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                            child: Text(
                                          bOD == null ? 'Ngày sinh' : '$bOD',
                                          style: TextStyle(color: bOD == null ? Colors.black54: null, fontSize: getSize(16)),
                                        )),
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.black45,
                                        )
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: getVerticalSize(12),
                              ),
                              Container(
                                  alignment: Alignment.center,
                                  height: getVerticalSize(50),
                                  padding: getPadding(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black.withOpacity(0.5), width: getSize(0.1)),
                                  ),
                                  child: DropdownButton(
                                    icon: Icon(Icons.arrow_drop_down_sharp),
                                    iconSize: 24,
                                    elevation: 16,
                                    value: gender,
                                    hint: const Text(
                                      "Giới tính",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    isExpanded: true,
                                    style: TextStyle(color: Colors.deepPurple, fontSize: getSize(16)),
                                    underline: Container(),
                                    borderRadius: BorderRadius.zero,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value;
                                      });
                                    },
                                    items: <String>['Nam', 'Nữ'].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                  )),
                              SizedBox(
                                height: getVerticalSize(12),
                              ),
                              Container(
                                  height: getVerticalSize(50),
                                  padding: getPadding(left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black.withOpacity(0.5), width: getSize(0.1)),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          keyboardType: TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                              hintText: 'Mã giới thiệu (nếu có)',
                                              hintStyle: TextStyle(fontSize: getSize(16)),
                                              border: InputBorder.none),
                                          controller: controllerCode,
                                        ),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                height: getVerticalSize(12),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                    scale: 1.1,
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: appTheme.blueXD,
                                      ),
                                      child: Checkbox(
                                        activeColor: appTheme.blueXD,
                                        value: isInformation,
                                        onChanged: (value) {
                                          setState(() {
                                            isInformation = !isInformation;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: Text('Thông tin bạn cung cấp sẽ hiện trên chứng chỉ'))
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                    scale: 1.1,
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        unselectedWidgetColor: appTheme.blueXD,
                                      ),
                                      child: Checkbox(
                                        activeColor: appTheme.blueXD,
                                        value: isSendInformation,
                                        onChanged: (value) {
                                          setState(() {
                                            isSendInformation = !isSendInformation;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                      child:
                                          Text('Giữ cho tôi cập nhật về các sự kiện lớp học và các bản phát hành mới.'))
                                ],
                              ),
                              Row(
                                children: [
                                  const Text("Bạn đã có tài khoản?"),
                                  InkWell(
                                      onTap: () => context.goNamed('LoginScreen'),
                                      child: Text(
                                        " Đăng nhập",
                                        style: TextStyle(color: appTheme.blueXD, fontWeight: FontWeight.bold),
                                      )),
                                  const Spacer()
                                ],
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                              InkWell(
                                onTap: () async {
                                  if (controllerName.value.text.isEmpty) {
                                    EasyLoading.showInfo('Chưa nhập họ và tên');
                                  } else if (controllerPhone.value.text.isEmpty) {
                                    EasyLoading.showInfo('Chưa nhập số điện thoại');
                                  } else if (controllerEmail.value.text.isEmpty) {
                                    EasyLoading.showInfo('Chưa nhập địa chỉ email');
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(controllerEmail.value.text)) {
                                    EasyLoading.showInfo('Email không đúng định dạng');
                                  } else if (controllerPass.value.text.isEmpty) {
                                    EasyLoading.showInfo('Chưa nhập mật khẩu');
                                  }  else if (bOD == null) {
                                    EasyLoading.showInfo('Chưa chọn ngày sinh');
                                  } else if (!isInformation) {
                                    EasyLoading.showInfo('Bạn chưa đồng ý cung cấp thông tin trên chứng chỉ');
                                  }  else if (gender == null ) {
                                    EasyLoading.showInfo('Bạn chưa chọn giới tính');
                                  } else {
                                    showLoading();
                                    DataState result = await ApiLogin.instance.createAccount(
                                        email: controllerEmail.value.text,
                                        phone: controllerPhone.value.text,
                                        pass: controllerPass.value.text,
                                       name: controllerName.value.text,
                                     bOD: '$bODCall',
                                      code: controllerCode.value.text,
                                      gender: gender,
                                      isGetNotifications: isSendInformation
                                    );
                                    dismissLoading();
                                    if (result is DataSuccess) {
                                      Navigator.of(context, rootNavigator: true).pop(true);
                                      context.goNamed('LoginScreen');
                                    } else {
                                      showInfo(result.error.toString());
                                    }
                                  }
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  padding: getPadding(top: 12, bottom: 12),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: appTheme.blueX,
                                    border: Border.all(color: Colors.black.withOpacity(0.5), width: getSize(0.1)),
                                  ),
                                  child: Text(
                                    "ĐĂNG KÝ",
                                    style: TextStyle(
                                        fontSize: getSize(16), fontWeight: FontWeight.w800, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: getVerticalSize(20),
                              ),
                            ])))),
              ))),
    );
  }

  onTapCloseone(BuildContext context) {
    Navigator.pop(context);
  }
}
