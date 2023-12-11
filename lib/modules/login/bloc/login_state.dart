part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  final List? propss;
  LoginState([this.propss]);
  @override
  List<Object?> get props => (propss ?? []);
}

class InitState extends LoginState {
  InitState() : super([]);
  @override
  String toString() => 'InitState';
}
class LoginSuccessState extends LoginState {
  LoginSuccessState() : super([]);
  @override
  String toString() => 'LoginSuccessState';
}
class LoadingState extends LoginState {
  LoadingState() : super([]);
  @override
  String toString() => 'LoadingState';
}

class ErrorState extends LoginState {
  String? error;
  ErrorState({this.error}) : super([]);
  @override
  String toString() => 'ErrorState';
}