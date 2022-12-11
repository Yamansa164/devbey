import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/core/di/di.dart';
import 'package:devbey/featuers/login/domain/entites/login_model.dart';
import 'package:devbey/featuers/login/domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failuer.dart';
import '../../../../core/resources/route_manger.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginUseCase loginUseCase = instance<LoginUseCase>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginExcute>((event, emit) async {
      emit(LoadingState());
      Either<Failuer, LoginModel> successOrFailuer = await loginUseCase.excute(
          input: LoginInput(email: email.text, password: password.text));
      successOrFailuer.fold((faliuer) => emit(LoginFaield(failuer: faliuer)),
          (loginModel) {
        emit(LoginSuccess());
       
      });
    });
        on<GoToLoginInitial>((event, emit)  {
          emit(LoginInitial());
         });

  }
  static LoginBloc getBloc(BuildContext context) {
    return BlocProvider.of<LoginBloc>(context);
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
}
