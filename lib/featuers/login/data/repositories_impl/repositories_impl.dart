import 'package:devbey/core/network/network.dart';
import 'package:devbey/featuers/login/data/datasource/remote_datasource.dart';
import 'package:devbey/featuers/login/data/response/login_response.dart';
import 'package:devbey/featuers/login/domain/entites/login_model.dart';
import 'package:devbey/core/error/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/featuers/login/domain/mapper/mapper.dart';
import 'package:devbey/featuers/login/domain/repostitories/repostitories.dart';

import '../../../../core/error/execption.dart';

class LoginRepostitoriesImpl extends LoginRepostitories {
  final LoginRemoteDataSource loginRemoteDataSource;
  final NetworkInfo networkInfo;
  LoginRepostitoriesImpl(
      {required this.loginRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failuer, LoginModel>> login(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final Either<Failuer, LoginResponse> addSuccess =
            await loginRemoteDataSource.Login(email: email, password: password);

        return addSuccess.fold((faliuer) {
          return Left(faliuer);
        }, (loginresponse) {
          return right(loginresponse.toModel());
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
