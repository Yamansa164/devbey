import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:devbey/core/error/failuer.dart';
import 'package:devbey/featuers/search/data/request/get_cars_request.dart';
import 'package:devbey/featuers/search/data/response/cars_response.dart';
import 'package:devbey/featuers/search/data/response/cities_response.dart';
import 'package:http/http.dart' as http;

import '../../../../core/resources/const_manager.dart';

abstract class SearchRemoteDataSource {
  Future<Either<Failuer, CitiesResponse>> getCities();
  Future<Either<Failuer, AllResponse>> getCars(
      {required GetCarsRequest getCarsRequest});
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
  Future<Either<Failuer, AllResponse>> getCars(
      {required GetCarsRequest getCarsRequest}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final http.Response response = await http.get(
        Uri.parse(
            '${ConstManage.url}/cars/non-reserved?receiving_location=${getCarsRequest.location}&delivering_location=${getCarsRequest.location}&to=${getCarsRequest.dateTo}&deliver_to_different_location=false&page=${getCarsRequest.page}&limit=9&from=${getCarsRequest.dateFrom}'),
        headers: headers,
      );

      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (body['data']['data'] != null) {
          return Right(AllResponse.fromJson(jsonDecode(response.body)));
        } else {
          return  Left(Failuer(message: 'No More Data')) ;
        }
      } else {
        return Left(Failuer(message: body['error']['message']));
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
