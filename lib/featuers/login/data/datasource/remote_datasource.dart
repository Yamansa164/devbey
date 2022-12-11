import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:devbey/core/error/failuer.dart';
import 'package:devbey/featuers/login/data/response/login_response.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/const_manager.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failuer, LoginResponse>> Login(
      {required String email, required String password});
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  @override
  Future<Either<Failuer, LoginResponse>> Login(
      {required String email, required String password}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final http.Response response = await http.post(
        Uri.parse('${ConstManage.url}/login?email=$email&password=$password'),
        headers: headers,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('sss');
         print(jsonDecode(response.body));
        return Right(LoginResponse.fromJson(jsonDecode(response.body)));
      } else {
        final body = jsonDecode(response.body);
        print(jsonDecode(response.body));
         print(body['error']['message']);
        return Left(Failuer(message: body['error']['message']));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }
}
