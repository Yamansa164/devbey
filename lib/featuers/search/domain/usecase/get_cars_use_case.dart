import 'package:devbey/core/error/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/core/usecase/base_usecase.dart';
import 'package:devbey/featuers/search/domain/entites/cars_model.dart';
import 'package:devbey/featuers/search/domain/repostitories/repostitories.dart';

class GetCarsUseCase extends UseCase<void, CarsModel> {
  final SearchRepostitories searchRepostitories;
  GetCarsUseCase({required this.searchRepostitories});
  @override
  Future<Either<Failuer, CarsModel>> excute({required void input}) {
    return searchRepostitories.getCar();
  }
}
