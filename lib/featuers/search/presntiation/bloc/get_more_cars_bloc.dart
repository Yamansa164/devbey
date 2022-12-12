import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:devbey/featuers/search/presntiation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/error/failuer.dart';
import '../../domain/entites/cars_model.dart';
import '../../domain/usecase/get_cars_use_case.dart';

class GetMoreCarsBloc extends Bloc<BlocEvent, BlocState> {
  GetCarsUseCase getCarsUseCase = instance<GetCarsUseCase>();
  final SearchBloc bloc;

  GetMoreCarsBloc({required this.bloc}) : super(GetMoreCarsInitial());

  static GetMoreCarsBloc getBloc(BuildContext context) {
    return BlocProvider.of<GetMoreCarsBloc>(context);
  }

  int page = 1;
  bool loader = false;
  final ScrollController controller = ScrollController();

  Future<void> addListener() async {
    if (controller.position.pixels == controller.position.maxScrollExtent &&
        loader == false ) {
      loader = true;
      emit(GetMoreCarsLoading());

      page++;
      Either<Failuer, CarsModel> successOrFailuer = await getCarsUseCase.excute(
          input: GetCarsInput(
              location: bloc.getSelectedCityid,
              dateFrom: bloc.dateFrom.text,
              dateTo: bloc.dateTo.text,
              page: page));
      successOrFailuer.fold((failuer) {
          emit(GetMoreDataFaield(failuer:failuer ));
       }, (carsModel) {

        
        emit(GetMoreCarsSuccess(carsModel: carsModel));
        loader = false;
      });
    }
  }
}
