part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoadingState extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFaield extends LoginState {
 final Failuer failuer;
 LoginFaield({required this.failuer});
}




