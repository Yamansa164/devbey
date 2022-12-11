import 'package:devbey/core/network/network.dart';
import 'package:devbey/core/error/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/featuers/search/data/datasource/remote_datasource.dart';
import 'package:devbey/featuers/search/data/request/get_cars_request.dart';
import 'package:devbey/featuers/search/data/response/cars_response.dart';
import 'package:devbey/featuers/search/data/response/cities_response.dart';
import 'package:devbey/featuers/search/domain/entites/cars_model.dart';
import 'package:devbey/featuers/search/domain/entites/cities_model.dart';
import 'package:devbey/featuers/search/domain/mapper/mapper.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/execption.dart';
import '../../domain/repostitories/repostitories.dart';

class SearchRepostitoriesImpl extends SearchRepostitories {
  final SearchRemoteDataSource searchRemoteDataSource;
  final NetworkInfo networkInfo;
  SearchRepostitoriesImpl(
      {required this.searchRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failuer, CitiesModel>> getCities() async {
    if (await networkInfo.isConnected) {
      try {
        final Either<Failuer, CitiesResponse> getSuccess =
            await searchRemoteDataSource.getCities();

        return getSuccess.fold((faliuer) {
          return Left(faliuer);
        }, (cityresponse) {
          return right(cityresponse.toModel());
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }

  @override
  Future<Either<Failuer, CarsModel>> getCar({required GetCarsRequest getCarsRequest}) async {
    if (await networkInfo.isConnected) {
      try {
        final Either<Failuer, AllResponse> getSuccess =
            await searchRemoteDataSource.getCars(getCarsRequest: getCarsRequest);

        return getSuccess.fold((faliuer) {

          return Left(faliuer);


        }, (carResponse) async {
          return right(carResponse.data.toModel());
        });
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return left(NoInternetFailure());
    }
  }
}
