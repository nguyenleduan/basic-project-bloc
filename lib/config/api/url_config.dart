

import 'package:onlinica/datasetting.dart';

class URLConfig {
  URLConfig._();

  static final URLConfig _instance = URLConfig._();

  static URLConfig get instance => _instance;


  String domain() {
    if (DataSetting.environment == 0) {
      print("domain---PRO------: ${DataSetting.config.domain!.domainPro!}");
      return DataSetting.config.domain!.domainPro!;
    } else if (DataSetting.environment == 1) {
      print("domain---QA------: ${DataSetting.config.domain!.domainQA!}");
      return DataSetting.config.domain!.domainQA!;
    }
    print("domain-----DEV----: ${DataSetting.config.domain!.domainDev!}");
    return  DataSetting.config.domain!.domainDev!;
  }

  String get urlLogin => '${domain()}/api/mobile-login';

  String get urlLoginGoogle => '${domain()}/api/login-social-mobile';

  String get urlForgotPassword => '${domain()}/account/password';

  String get urlCreateCAccount => '${domain()}/register-account-mobile';

  String get urlRefreshToken => '${domain()}/api/mobile-token/refresh';

  String get urlConfig => DataSetting.environment == 0 ?'https://vtcnewprj2022.my.salesforce-sites.com/services/apexrest/PublicContent' : 'https://vtcnewprj2022--dev.sandbox.my.salesforce-sites.com/services/apexrest/PublicContent';

  String get urlCourseFroApp=> '${domain()}/api/mobile-get-list-course-for-app';

  String get urlCategoryCurriculum=> '${domain()}/api/category-curriculum';

  String get urlCurriculums=> '${domain()}/api/list-curriculums';

  String get urlCombo=> '${domain()}/combo-mobile';

  String get urlMajor=> '${domain()}/api/list-data-major';

  String get urlCourseList=> '${domain()}/api/course-list';

  String get urlMyCourse=> '${domain()}/api/get-my-courses?user_id=${DataSetting.accountModel.userInfo?.id}';

  String get urlCourseComboList=> '${domain()}/api/course-combo-list';

  String get urlUpdateAvatar=> '${domain()}/api/profile-upload-img';

  String get urlCheckSubcription=> '${domain()}/api/check-user-subcription-api';

  String get urlGetCertificates=> '${domain()}/api/list-certificates';

  String get urlSearch=> '${domain()}/api/search_api';

  String get urlUserInfo=> '${domain()}/api/mobile-get-user-info';

  String get urlCourseDetailt=> '${domain()}/api/detail-course';

  String get urlMyCurriculum=> '${domain()}/api/my-curriculums';

  String get urlCancelCurriculum=> '${domain()}/api/unenroll-curriculum-api';

  String urlCheckBlockAccount(String value) {
    return '${domain()}/api/delete-api?user_id=${DataSetting.accountModel.userInfo?.id}&isBlock=$value';
  }

  String urlGetNotifications(String id) {
    return '${domain()}/service/get-notify-parent/$id';
  }

  String urlGetDetailCombo(int id) {
    return '${domain()}/combo-mobile/$id/detail';
  }

  String urlDetailCurriculum(String id) {
    return '${domain()}/api/detail-curriculum?curriculum_id=$id&user_id=${DataSetting.accountModel.userInfo?.id}';
  }


}
