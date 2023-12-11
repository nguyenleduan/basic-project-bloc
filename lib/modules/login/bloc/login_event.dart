part of 'login_bloc.dart';



abstract class LoginEvent {}

class Login extends LoginEvent {
  Login();
}

class LoginGoogle extends LoginEvent {
  LoginGoogle();
}
class LoginFacebook extends LoginEvent {
  LoginFacebook();
}

