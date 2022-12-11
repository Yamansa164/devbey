import 'package:devbey/core/error/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/core/usecase/base_usecase.dart';
import 'package:devbey/featuers/search/domain/entites/cities_model.dart';
import 'package:devbey/featuers/search/domain/repostitories/repostitories.dart';

class GetCitiesUseCase extends UseCase<void,CitiesModel>{
  final SearchRepostitories searchRepostitories;
  GetCitiesUseCase({required this.searchRepostitories});
  @override
  Future<Either<Failuer, CitiesModel>> excute({required void input}) {
    print('object');
    return searchRepostitories.getCities();
  }

}