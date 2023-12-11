
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:onlinica/config/key_cache_config.dart';
import 'package:onlinica/core/go_router/go_router.dart';
import 'package:onlinica/service/sharedPreferences/sharedPreferences_manager.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';

import '../../datasetting.dart';

class PopupChangeEnvironment extends StatefulWidget {
  Function? function;

  PopupChangeEnvironment({Key? key, this.function}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PopupChangeEnvironment();
  }
}

class _PopupChangeEnvironment extends State<PopupChangeEnvironment> {
  TextEditingController controller = TextEditingController();
  String dropdownValue = 'STG';
  List<String>  listEnvironment = ["PRO","STG","DEV"];
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Container(
          height: double.infinity,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 10, right: 10),
              child: Hero(
                tag: _heroCart,
                createRectTween: (begin, end) {
                  return CustomRectTween(begin: begin, end: end);
                },
                child: Material(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Stack(
                          children: [
                            Positioned(
                              right: 5,
                              top: 5,
                              child: InkWell(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: const Icon(Icons.close)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: const Text(
                                      "Môi trường",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    )),
                                Container(
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(Icons.menu_open_sharp),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: listEnvironment.map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.0)),
                                    color: Colors.black12,
                                  ),
                                  padding:
                                  EdgeInsets.only(right: 5 , left: 5),
                                  margin: EdgeInsets.only(
                                      right: 10,
                                      left: 10,
                                      top: 5,
                                      bottom: 5),
                                  child:   TextField(
                                    textInputAction: TextInputAction.done,
                                    controller: controller ,
                                    keyboardType: TextInputType.number,
                                    decoration: const  InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Code',
                                      prefixIcon: Icon(Icons.code_outlined),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: GestureDetector(
                                    onTap: (){
                                      if(controller.value.text == '0090'){
                                        if(dropdownValue == "DEV"){
                                          DataSetting.environment = 2;
                                        }else if (dropdownValue == "STG"){
                                          DataSetting.environment = 1;
                                        }else{
                                          DataSetting.environment = 0;
                                        }
                                        print("--- Environment: ${DataSetting.environment}");
                                        Navigator.of(context).pop();
                                        router.goNamed('/');
                                      }else{
                                        EasyLoading.showInfo("Code chưa đúng");
                                      }
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        height: 40 ,
                                        margin: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.all(
                                                Radius.circular(
                                                    12.0 )),
                                            color: appTheme.blueX),
                                        child: Text(
                                          // B00E2F
                                          "OK",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14 ,
                                              color: Colors.white),
                                        )),
                                  ),
                                )
                              ],
                            )
                          ],
                        ))),
              ),
            ),
          ),
        ));
  }
}

const String _heroCart = 'add-setting';

class CustomRectTween extends RectTween {
  /// {@macro custom_rect_tween}
  CustomRectTween({
    required Rect? begin,
    required Rect? end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin!.left, end!.left, elasticCurveValue)!,
      lerpDouble(begin!.top, end!.top, elasticCurveValue)!,
      lerpDouble(begin!.right, end!.right, elasticCurveValue)!,
      lerpDouble(begin!.bottom, end!.bottom, elasticCurveValue)!,
    );
  }
}