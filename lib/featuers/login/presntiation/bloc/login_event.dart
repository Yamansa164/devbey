part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class LoginExcute extends LoginEvent{}
class GoToLoginInitial extends LoginEvent{}

