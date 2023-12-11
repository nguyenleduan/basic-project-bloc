import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading(){
  EasyLoading.show(status: 'Loading...');
}
void dismissLoading(){
  EasyLoading.dismiss();
}
void showInfo(String mess){
  EasyLoading.dismiss();
  EasyLoading.showInfo(mess);
}
void showError(String mess){
  EasyLoading.dismiss();
  EasyLoading.showError(mess);
}
void showSuccess(String mess){
  EasyLoading.dismiss();
  EasyLoading.showSuccess(mess);
}