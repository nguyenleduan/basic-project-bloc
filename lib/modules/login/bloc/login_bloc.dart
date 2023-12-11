
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onlinica/config/loading_config.dart';
import 'package:onlinica/service/api_service/login/api_login.dart';

import '../../../config/key_cache_config.dart';
import '../../../core/dio/data_state.dart';
import '../../../core/go_router/go_router.dart';
import '../../../datasetting.dart';
import '../../../firebase_options.dart';
import '../../../service/sharedPreferences/sharedPreferences_manager.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc< LoginEvent, LoginState> {
  String? check ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordlabelController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isCheckPass = true;
  LoginBloc() : super(InitState()) {
    on<Login>(_login);
    on<LoginFacebook>(_loginFacebook);
    on<LoginGoogle>(_signInWithGoogle);
  }

  void _login(Login event, Emitter<LoginState> emit ) async {
    try {
      showLoading();
      if(emailController.value.text.isEmpty){
        showInfo('Bạn chưa nhập email');
      } else if(passwordlabelController.value.text.isEmpty){
        showInfo('Bạn chưa nhập mật khẩu');
      }else{
        final result = await ApiLogin.instance.getLogin(email: emailController.value.text ,pass: passwordlabelController.value.text);
        if (result is DataSuccess) {
          print('save E ${DataSetting.environment }');
          SharedPreferencesManager.instance.set(KeyCacheConfig.instance.keyEnvironment, DataSetting.environment);
          emit(LoginSuccessState()) ;
        } else {
          showError('Tài khoản hoặc mật khẩu chưa chính xác');
        }
      }
    } catch (e) {
      showError('$e');
    }
  }
  void _loginFacebook(LoginFacebook event, Emitter<LoginState> emit ) async {
    try {
      // // URL("https://graph.facebook.com/" + userID + "/picture?type=large");
      // final result =
      // await FacebookAuth.i.login(permissions: ['public_profile', 'email' ]);
      // if (result.status == LoginStatus.success) {
      //   Map<String, dynamic> userData = await FacebookAuth.i.getUserData();
      //   var a = await FacebookAuth.i.accessToken;
      //   // DataSetting.profile.name = userData['name'];
      //   // DataSetting.userInfo.email = userData['email'];
      //   print(userData);
      //   // SharedPreferencesManager.instance.set(KeyCacheConfig.instance.keyLoginFB, DataSetting.userInfo);
      //   router.goNamed('Discover');
      // }
      showLoading();
          final LoginResult loginResult = await FacebookAuth.instance.login();
          final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
          final user = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
          Map<String, dynamic> map = {
            'social_type': 'facebook',
            'displayName': user.user?.providerData[0].displayName,
            'email': user.user?.providerData[0].email,
            'phoneNumber': user.user?.providerData[0].phoneNumber,
            'photoURL': user.user?.providerData[0].photoURL,
            'tenantId': user.user?.tenantId,
            'uid': user.user?.providerData[0].uid,
          };
          final result = await ApiLogin.instance.loginGoogle(map);
          dismissLoading();
          if (result is DataSuccess) {
            emit(LoginSuccessState()) ;
          } else {
            showError('${result.statusCode} API SSO ERROR: ---${result.error}');
          }
    } catch (error) {
      showError(' Function SSO FacebookERROR: ---$error');
      dismissLoading();
    }}

  void _signInWithGoogle(LoginGoogle event, Emitter<LoginState> emit ) async {
    try{
      showLoading();
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
          clientId: (DefaultFirebaseOptions.currentPlatform ==
              DefaultFirebaseOptions.ios)
              ? DefaultFirebaseOptions.currentPlatform.iosClientId
              : DefaultFirebaseOptions.currentPlatform.androidClientId)
          .signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential model =  await FirebaseAuth.instance.signInWithCredential(credential);
      Map<String, dynamic> map = {
        'social_type': 'google',
        'displayName': model.user?.providerData[0].displayName,
        'email': model.user?.providerData[0].email,
        'phoneNumber': model.user?.providerData[0].phoneNumber,
        'photoURL': '${model.user?.providerData[0].photoURL}',
        'tenantId': model.user?.tenantId,
        'uid': model.user?.providerData[0].uid,
      };
      print("----- $map");
      final result = await ApiLogin.instance.loginGoogle(map);
      dismissLoading();
      if (result is DataSuccess) {
        emit(LoginSuccessState()) ;
      } else {
        showError('${result.statusCode} API SSO ERROR: ---${result.error}');
      }
    }catch(e){
      print("------- $e");
      showError(' Function SSO Google ERROR: ---$e');
    }
  }
}
