import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:onlinica/datasetting.dart';
import 'package:onlinica/service/launch_service.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';

import '../../config/api/url_config.dart';
import '../../config/loading_config.dart';
import '../../core/utils/image_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../service/Chrome.dart';
import '../../widget/custom_image_view.dart';
import '../../widget/dialog_custom_widget.dart';
import '../../widget/theme/custom_text_style.dart';
import '../login/popup_change_environment.dart';
class AfterWelcomeScreen extends StatefulWidget {
  const AfterWelcomeScreen({super.key});

  @override
  State<AfterWelcomeScreen> createState() => _asdState();
}

class _asdState extends State<AfterWelcomeScreen> {

  int index = 0;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    final ChromeSafariBrowser browser = MyChromeSafariBrowser();
    return  Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: theme.colorScheme.primary,
      body: Container(
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
              ImageConstant.img2afterwelcome,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 12,
            top: 103,
            right: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: getVerticalSize(30),),
              CustomImageView(
                svgPath: ImageConstant.imgLayer1,
                height: getVerticalSize(57),
                width: getHorizontalSize(200),
              ),
              Expanded(child: Container()),
              Expanded(child: Container()),
              InkWell(
                onTap: ()=>context.goNamed('LoginScreen'),
                child: Container(
                  width: double.maxFinite,
                  height: getVerticalSize(40),
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Text("Đăng nhập và bắt đầu học",style: TextStyle(fontSize: getSize(16),color: appTheme.blue800, fontWeight: FontWeight.w700),),
                ),
              ),
              SizedBox(height: getVerticalSize(21)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text( "Bạn chưa có tài khoản? ",
                    style: CustomTextStyles.bodyLargeWhiteA700_1,),
                  InkWell(
                    onTap: () async {
                      context.goNamed('RegisTrationScreen');
                      // try{
                      //   await  browser.open(
                      //     url: Uri.parse( "${URLConfig.instance.domain()}/n/registration"
                      //     ),
                      //   );
                      // }catch(e){
                      //   showInfo('$e');
                      // }
                    },
                    child: Text(
                      "Đăng ký ngay",
                      style: CustomTextStyles.bodyLargeWhiteA700_1.copyWith(
                        decoration: TextDecoration.underline,
                      ),),
                  ),
                ],
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: (){
                  if(index == 5){
                    HapticFeedback.heavyImpact();
                    Navigator.push(
                        context,
                        HeroDialogRoute(
                            builder: (context) =>
                                PopupChangeEnvironment()));
                    index=1;
                  }else{
                    index ++ ;
                  }
                },
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: getPadding(bottom: 12,left: 12),
                    child: Text("Version: ${DataSetting.version}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
              )
            ],
          ),
        ),
      ),
    ) ;
  }
}


class HeroDialogRoute<T> extends PageRoute<T> {
  /// {@macro hero_dialog_route}
  HeroDialogRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool fullscreenDialog = false,
  })  : _builder = builder,
        super(settings: settings, fullscreenDialog: fullscreenDialog);

  final WidgetBuilder _builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  @override
  String get barrierLabel => 'Popup dialog open';
}