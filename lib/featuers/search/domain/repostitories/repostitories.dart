import 'package:dartz/dartz.dart';
import 'package:devbey/core/error/failuer.dart';
import 'package:devbey/featuers/search/data/request/get_cars_request.dart';
import 'package:devbey/featuers/search/domain/entites/cars_model.dart';
import 'package:devbey/featuers/search/domain/entites/cities_model.dart';

abstract class SearchRepostitories {
  Future<Either<Failuer, CitiesModel>> getCities();
    Future<Either<Failuer, CarsModel>> getCar({required GetCarsRequest getCarsRequest});
}
