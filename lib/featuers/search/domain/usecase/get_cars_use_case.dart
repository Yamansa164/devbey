import 'package:devbey/core/error/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/core/usecase/base_usecase.dart';
import 'package:devbey/featuers/search/data/request/get_cars_request.dart';
import 'package:devbey/featuers/search/domain/entites/cars_model.dart';
import 'package:devbey/featuers/search/domain/repostitories/repostitories.dart';

class GetCarsUseCase extends UseCase<GetCarsInput, CarsModel> {
  final SearchRepostitories searchRepostitories;
  GetCarsUseCase({required this.searchRepostitories});
  @override
  Future<Either<Failuer, CarsModel>> excute({required GetCarsInput input}) {
    return searchRepostitories.getCar(getCarsRequest: GetCarsRequest(location: input.location, dateFrom: input.dateFrom, dateTo: input.dateTo, page: input.page));
  }
}
class GetCarsInput{

final String location;
  final String dateFrom;
  final String dateTo;
  final int page;

  GetCarsInput(
      {required this.location,
      required this.dateFrom,
      required this.dateTo,
      required this.page});
}