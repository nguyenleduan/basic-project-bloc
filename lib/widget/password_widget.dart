import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import '../core/utils/size_utils.dart';
import 'custom_image_view.dart';

class PassWordWidget extends StatefulWidget {
  TextEditingController controller;
  late Function? onChanged;
  String?  hint;
  PassWordWidget(this.controller,{Key? key,this.onChanged ,this.hint }) : super(key: key);

  @override
  State<PassWordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PassWordWidget> {
  bool isCheck  = true;
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: getVerticalSize(50),
        padding: getPadding(left: 10,right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
          border: Border.all(
              color: Colors.black.withOpacity(0.5),
              width: getSize(0.1)
          ),),
        child: Row(
          children: [
            const Text('*',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
            Expanded(
              child: TextField(
                obscureText: isCheck,
                decoration: InputDecoration(
                    hintText: widget.hint,
                    border: InputBorder.none
                ),
                controller: widget.controller,
              ),
            ),
            CustomImageView(
                onTap: ()=>setState(() {
                  isCheck = !isCheck;
                }) ,
                svgPath: ImageConstant.imgCall)
          ],
        )) ;
  }
}
