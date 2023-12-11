import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchService{
  LaunchService._();
  static final LaunchService _instance = LaunchService._();

  static LaunchService get instance => _instance;


  Future<void> openURL(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl( uri,  mode: LaunchMode.externalApplication )) {
      EasyLoading.showError('Could not launch $url');
      throw Exception('Could not launch $url');
    }
  }
}