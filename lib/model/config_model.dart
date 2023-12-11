class ConfigModel {
  Domain? domain;
  LinkStore? linkStore;
  Android? android;
  IOS? iOS;
  QCHeader? qCHeader;
  BannerFooter? bannerFooter;
  bool? isBuyCurriculum;
  bool? isBuyCourse;
  bool? isBuyCombo;
  bool? isLogin;

  ConfigModel(
      {this.domain,
        this.linkStore,
        this.android,
        this.iOS,
        this.qCHeader,
        this.bannerFooter,
        this.isBuyCurriculum,
        this.isBuyCourse,
        this.isLogin,
        this.isBuyCombo});

  ConfigModel.fromJson(dynamic json) {
    domain =
    json['domain'] != null ? new Domain.fromJson(json['domain']) : null;
    linkStore = json['linkStore'] != null
        ? new LinkStore.fromJson(json['linkStore'])
        : null;
    android =
    json['Android'] != null ? new Android.fromJson(json['Android']) : null;
    iOS = json['IOS'] != null ? new IOS.fromJson(json['IOS']) : null;
    qCHeader = json['QCHeader'] != null
        ? new QCHeader.fromJson(json['QCHeader'])
        : null;
    bannerFooter = json['bannerFooter'] != null
        ? new BannerFooter.fromJson(json['bannerFooter'])
        : null;
    isBuyCurriculum = json['isBuyCurriculum'];
    isBuyCourse = json['isBuyCourse'];
    isBuyCombo = json['isBuyCombo'];
    isLogin = json['isLogin'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.domain != null) {
      data['domain'] = this.domain!.toJson();
    }
    if (this.linkStore != null) {
      data['linkStore'] = this.linkStore!.toJson();
    }
    if (this.android != null) {
      data['Android'] = this.android!.toJson();
    }
    if (this.iOS != null) {
      data['IOS'] = this.iOS!.toJson();
    }
    if (this.qCHeader != null) {
      data['QCHeader'] = this.qCHeader!.toJson();
    }
    if (this.bannerFooter != null) {
      data['bannerFooter'] = this.bannerFooter!.toJson();
    }
    data['isBuyCurriculum'] = this.isBuyCurriculum;
    data['isBuyCourse'] = this.isBuyCourse;
    data['isBuyCombo'] = this.isBuyCombo;
    return data;
  }
}

class Domain {
  String? domainDev;
  String? domainQA;
  String? domainPro;

  Domain({this.domainDev, this.domainQA, this.domainPro});

  Domain.fromJson(Map<String, dynamic> json) {
    domainDev = json['domainDev'];
    domainQA = json['domainQA'];
    domainPro = json['domainPro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domainDev'] = this.domainDev;
    data['domainQA'] = this.domainQA;
    data['domainPro'] = this.domainPro;
    return data;
  }
}

class LinkStore {
  String? appStore;
  String? chPlay;

  LinkStore({this.appStore, this.chPlay});

  LinkStore.fromJson(Map<String, dynamic> json) {
    appStore = json['appStore'];
    chPlay = json['chPlay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appStore'] = this.appStore;
    data['chPlay'] = this.chPlay;
    return data;
  }
}

class Android {
  String? versionAnroid;
  bool? isObligatoryUpdate;
  bool? isLockApp;
  String? titleUpdate;
  String? contentUpdate;
  String? titleLock;
  String? messageLock;
  String? codeEnvironment;

  Android(
      {this.versionAnroid,
        this.isObligatoryUpdate,
        this.isLockApp,
        this.titleUpdate,
        this.contentUpdate,
        this.titleLock,
        this.messageLock,
        this.codeEnvironment});

  Android.fromJson(Map<String, dynamic> json) {
    versionAnroid = json['versionAnroid'];
    isObligatoryUpdate = json['isObligatoryUpdate'];
    isLockApp = json['isLockApp'];
    titleUpdate = json['titleUpdate'];
    contentUpdate = json['contentUpdate'];
    titleLock = json['titleLock'];
    messageLock = json['messageLock'];
    codeEnvironment = json['codeEnvironment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['versionAnroid'] = this.versionAnroid;
    data['isObligatoryUpdate'] = this.isObligatoryUpdate;
    data['isLockApp'] = this.isLockApp;
    data['titleUpdate'] = this.titleUpdate;
    data['contentUpdate'] = this.contentUpdate;
    data['titleLock'] = this.titleLock;
    data['messageLock'] = this.messageLock;
    data['codeEnvironment'] = this.codeEnvironment;
    return data;
  }
}

class IOS {
  String? versionIOS;
  bool? isObligatoryUpdate;
  bool? isLockApp;
  String? titleUpdate;
  String? contentUpdate;
  String? titleLock;
  String? messageLock;
  String? codeEnvironment;

  IOS(
      {this.versionIOS,
        this.isObligatoryUpdate,
        this.isLockApp,
        this.titleUpdate,
        this.contentUpdate,
        this.titleLock,
        this.messageLock,
        this.codeEnvironment});

  IOS.fromJson(Map<String, dynamic> json) {
    versionIOS = json['versionIOS'];
    isObligatoryUpdate = json['isObligatoryUpdate'];
    isLockApp = json['isLockApp'];
    titleUpdate = json['titleUpdate'];
    contentUpdate = json['contentUpdate'];
    titleLock = json['titleLock'];
    messageLock = json['messageLock'];
    codeEnvironment = json['codeEnvironment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['versionIOS'] = this.versionIOS;
    data['isObligatoryUpdate'] = this.isObligatoryUpdate;
    data['isLockApp'] = this.isLockApp;
    data['titleUpdate'] = this.titleUpdate;
    data['contentUpdate'] = this.contentUpdate;
    data['titleLock'] = this.titleLock;
    data['messageLock'] = this.messageLock;
    data['codeEnvironment'] = this.codeEnvironment;
    return data;
  }
}

class QCHeader {
  bool? isShow;
  String? title;
  String? titleBlod;
  String? linkAction;

  QCHeader({this.isShow, this.title, this.titleBlod, this.linkAction});

  QCHeader.fromJson(Map<String, dynamic> json) {
    isShow = json['isShow'];
    title = json['title'];
    titleBlod = json['titleBlod'];
    linkAction = json['linkAction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isShow'] = this.isShow;
    data['title'] = this.title;
    data['titleBlod'] = this.titleBlod;
    data['linkAction'] = this.linkAction;
    return data;
  }
}

class BannerFooter {
  bool? isShow;
  String? title;
  String? textNext;
  String? linkAction;

  BannerFooter({this.isShow, this.title, this.textNext, this.linkAction});

  BannerFooter.fromJson(Map<String, dynamic> json) {
    isShow = json['isShow'];
    title = json['title'];
    textNext = json['textNext'];
    linkAction = json['linkAction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isShow'] = this.isShow;
    data['title'] = this.title;
    data['textNext'] = this.textNext;
    data['linkAction'] = this.linkAction;
    return data;
  }
}