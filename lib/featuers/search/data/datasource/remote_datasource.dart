import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:devbey/core/error/failuer.dart';
import 'package:devbey/featuers/search/data/response/cars_response.dart';
import 'package:devbey/featuers/search/data/response/cities_response.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/const_manager.dart';

abstract class SearchRemoteDataSource {
  Future<Either<Failuer, CitiesResponse>> getCities();
  Future<Either<Failuer, AllResponse>> getCars();
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<Either<Failuer, CitiesResponse>> getCities() async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final http.Response response = await http.get(
        Uri.parse('${ConstManage.url}/geoplaces?asciiname=ist&country_code=TR'),
        headers: headers,
      );
      if (response.statusCode == 200) {
        return Right(CitiesResponse.fromJson(jsonDecode(response.body)));
      } else {
        final body = jsonDecode(response.body);
        return Left(Failuer(message: body['error']['message']));
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failuer, AllResponse>> getCars() async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final http.Response response = await http.get(
        Uri.parse(
            '${ConstManage.url}/cars/non-reserved?receiving_location=44561&delivering_location=44561&to=2022-09-19 08:10&deliver_to_different_location=false&page=1&from=2022-09-16 08:10'),
        headers: headers,
      );
        final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('x');
        print(body['data']['data'][3]['photos']);
        return Right(AllResponse.fromJson(jsonDecode(response.body)));
      } else {
      
        print(body['error']['message']);
        return Left(Failuer(message: body['error']['message']));
      }
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }
}
