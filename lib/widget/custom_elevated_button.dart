import 'package:flutter/material.dart';
import 'package:onlinica/widget/theme/custom_text_style.dart';

import '../core/utils/size_utils.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onTap,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    ButtonStyle? disabledButtonStyle,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    required String text,
  }) : super(
          text: text,
          onTap: onTap,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          disabledButtonStyle: disabledButtonStyle,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  ButtonStyle? get elevatedButtonStyle =>
      (isDisabled ?? false) ? disabledButtonStyle : buttonStyle;
  Widget get buildElevatedButtonWidget => Container(
        height: this.height ?? getVerticalSize(38),
        width: this.width ?? double.maxFinite,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: elevatedButtonStyle,
          onPressed: onTap ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex:3,child: Container(alignment: Alignment.centerRight,child: leftIcon ?? const SizedBox.shrink())),
              Expanded(flex:7,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: buttonTextStyle ?? CustomTextStyles.titleMediumWhite,
                ),
              ),
              Expanded(flex:3,child:
              rightIcon ?? const SizedBox.shrink(),)
            ],
          ),
        ),
      );
}
