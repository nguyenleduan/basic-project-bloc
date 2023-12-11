import 'package:onlinica/config/api/url_config.dart';

class AccountModel {
  UserInfo? userInfo;
  UserProfile? userProfile;
  String? accessToken;
  String? refreshToken;

  AccountModel(
      {this.userInfo, this.userProfile, this.accessToken, this.refreshToken});

  AccountModel.fromJson(Map<String, dynamic> json) {
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
    accessToken = json['access_token'] ?? "";
    refreshToken = json['refresh_token']?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo!.toJson();
    }
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile!.toJson();
    }
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}

class UserInfo {
  int? id;
  String? password;
  String? lastLogin;
  bool? isSuperuser;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isStaff;
  bool? isActive;
  String? dateJoined;
  List<int>? groups;
  List<int>? userPermissions;

  UserInfo(
      {this.id,
        this.password,
        this.lastLogin,
        this.isSuperuser,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.isStaff,
        this.isActive,
        this.dateJoined,
        this.groups,
        this.userPermissions});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    groups = json['groups'].cast<int>();
    userPermissions = json['user_permissions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['password'] = this.password;
    data['last_login'] = this.lastLogin;
    data['is_superuser'] = this.isSuperuser;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['is_staff'] = this.isStaff;
    data['is_active'] = this.isActive;
    data['date_joined'] = this.dateJoined;
    data['groups'] = this.groups;
    data['user_permissions'] = this.userPermissions;
    return data;
  }
}

class UserProfile {
  int? id;
  String? country;
  String? name;
  String? meta;
  String? courseware;
  String? companyName;
  String? companyCode;
  bool? b2bActive;
  String? language;
  String? location;
  int? yearOfBirth;
  String? gender;
  String? levelOfEducation;
  String? mailingAddress;
  String? city;
  String? state;
  String? goals;
  bool? allowCertificate;
  String? bio;
  String? profileImageUploadedAt;
  String? phoneNumber;
  String? dateOfBrith;
  String? address;
  String? schoolInformation;
  String? departmentOfStudy;
  String? employmentStatus;
  String? careerField;
  String? avatarUser;
  int? user;

  UserProfile(
      {this.id,
        this.country,
        this.name,
        this.meta,
        this.courseware,
        this.companyName,
        this.companyCode,
        this.b2bActive,
        this.language,
        this.location,
        this.yearOfBirth,
        this.gender,
        this.levelOfEducation,
        this.mailingAddress,
        this.city,
        this.state,
        this.goals,
        this.allowCertificate,
        this.bio,
        this.profileImageUploadedAt,
        this.phoneNumber,
        this.dateOfBrith,
        this.avatarUser,
        this.address,
        this.schoolInformation,
        this.departmentOfStudy,
        this.employmentStatus,
        this.careerField,
        this.user});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id']  ;
    country = json['country'];
    name = json['name'];
    meta = json['meta'];
    courseware = json['courseware'];
    companyName = json['company_name'];
    companyCode = json['company_code'];
    b2bActive = json['b2b_active'];
    language = (json['language'] ?? "").isEmpty ? "Tiếng Việt" : json['language'];
    location = json['location'];
    yearOfBirth = json['year_of_birth'];
    gender = json['gender'];
    levelOfEducation = json['level_of_education'];
    mailingAddress = json['mailing_address'];
    city = json['city'];
    state = json['state'];
    goals = json['goals'];
    allowCertificate = json['allow_certificate'];
    bio = json['bio'];
    profileImageUploadedAt = json['profile_image_uploaded_at'];
    phoneNumber = '0${json['phone_number'] ?? ""}';
    dateOfBrith = json['date_of_brith'];
    address = json['address'];
    schoolInformation = json['school_information'];
    departmentOfStudy = json['department_of_study'];
    employmentStatus = json['employment_status'];
    avatarUser =json['avatar_user'];
    careerField = json['career_field'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country'] = this.country;
    data['name'] = this.name;
    data['meta'] = this.meta;
    data['courseware'] = this.courseware;
    data['company_name'] = this.companyName;
    data['company_code'] = this.companyCode;
    data['b2b_active'] = this.b2bActive;
    data['language'] = this.language;
    data['location'] = this.location;
    data['year_of_birth'] = this.yearOfBirth;
    data['gender'] = this.gender;
    data['level_of_education'] = this.levelOfEducation;
    data['mailing_address'] = this.mailingAddress;
    data['city'] = this.city;
    data['state'] = this.state;
    data['goals'] = this.goals;
    data['allow_certificate'] = this.allowCertificate;
    data['bio'] = this.bio;
    data['profile_image_uploaded_at'] = this.profileImageUploadedAt;
    data['phone_number'] = this.phoneNumber;
    data['date_of_brith'] = this.dateOfBrith;
    data['address'] = this.address;
    data['school_information'] = this.schoolInformation;
    data['department_of_study'] = this.departmentOfStudy;
    data['employment_status'] = this.employmentStatus;
    data['career_field'] = this.careerField;
    data['user'] = this.user;
    return data;
  }
}