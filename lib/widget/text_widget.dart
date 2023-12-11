import 'package:flutter/material.dart';
import 'package:onlinica/widget/theme/custom_text_style.dart';
import 'package:onlinica/widget/theme/theme_helper.dart';

class ExpandableText extends StatefulWidget {
    String? text;
    double? max;
    ExpandableText({Key? key,   this.text,   this.max})
      : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  TextPainter? textPainter;
  String text ='';
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    checkText();
  }

  void checkText(){
    int index =0;
    text = (widget.text ?? '').substring(
        0,
        int.parse(
            "${((widget.text ?? '').length * (widget.max ?? 1)).round()}"));

    while(text[text.length -1] != ' '){
      if(!text.contains(' ')){
          return;
      }
      text=  (widget.text ?? '').substring(
          0,
          int.parse(
              "${((widget.text ?? '').length * (widget.max ?? 1)).round()}") - index);
      index ++;
      print("----------$text");
    }
  }

  @override
  Widget build(BuildContext context) {
    return isOpen
        ? SizedBox(
        child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(children: [
                TextSpan(
                    text: widget.text, style: theme.textTheme.bodyLarge ),
                WidgetSpan(
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                        child: Text(
                          " Rút gọn",
                          style: CustomTextStyles.bodyLargeBlue800_1
                        )), )
              ]),
            )))
        : Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: [
          TextSpan(
              text:  text +
                  "...", style: theme.textTheme.bodyLarge ),
          WidgetSpan(
              child: InkWell(
                  mouseCursor: SystemMouseCursors.click,
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  child: Text(
                    " Xem thêm",
                      style: CustomTextStyles.bodyLargeBlue800_1
                  )), )
        ]),
      ),
    );
  }
}