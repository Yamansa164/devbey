import 'package:devbey/core/error/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/core/usecase/base_usecase.dart';
import 'package:devbey/featuers/login/domain/entites/login_model.dart';
import 'package:devbey/featuers/login/domain/repostitories/repostitories.dart';

class LoginUseCase extends UseCase<LoginInput,LoginModel>{
  final LoginRepostitories loginRepostitories;
  LoginUseCase({required this.loginRepostitories});
  @override
  Future<Either<Failuer, LoginModel>> excute({required LoginInput input}) {
  return loginRepostitories.login(email: input.email, password: input.password);
  }

}

class LoginInput{
  final String email;
  final String password;

  LoginInput({required this.email,required this.password});
}