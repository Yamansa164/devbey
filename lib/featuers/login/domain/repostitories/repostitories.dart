import 'package:dartz/dartz.dart';
import 'package:devbey/core/error/failuer.dart';
import 'package:devbey/featuers/login/domain/entites/login_model.dart';

abstract class LoginRepostitories {
  Future<Either<Failuer, LoginModel>> login(
      {required String email, required String password});
}
