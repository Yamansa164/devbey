import 'package:devbey/core/error/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/core/usecase/base_usecase.dart';
import 'package:devbey/featuers/login/domain/entites/login_model.dart';
import 'package:devbey/featuers/login/domain/repostitories/repostitories.dart';

class SaveInfoUseCase {
  final LoginRepostitories loginRepostitories;
  SaveInfoUseCase({required this.loginRepostitories});
  void excute({required LoginModel input}) {
    loginRepostitories.setUserInfo(loginModel: input);
    
  }
}