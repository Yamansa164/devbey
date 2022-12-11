import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:devbey/core/di/di.dart';
import 'package:devbey/featuers/search/domain/entites/cars_model.dart';
import 'package:devbey/featuers/search/domain/entites/cities_model.dart';
import 'package:devbey/featuers/search/domain/usecase/get_cars_use_case.dart';
import 'package:devbey/featuers/search/domain/usecase/get_cities_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failuer.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GetCitiesUseCase getCitiesUseCase = instance<GetCitiesUseCase>();
  GetCarsUseCase getCarsUseCase = instance<GetCarsUseCase>();

  SearchBloc() : super(SearchInitial()) {
    on<GetCitiesEvent>((event, emit) async {
      emit(LoadingState());
      print('s');
      Either<Failuer, CitiesModel> successOrFailuer =
          await getCitiesUseCase.excute(input: Void);
      print('s');

      successOrFailuer.fold(
          (faliuer) => emit(GetCitiesFaield(failuer: faliuer)), (citiesModel) {
        emit(GetCitiesSuccess(citiesModel: citiesModel));
      });
    });

    on<GetCarsEvent>((event, emit) async {
      emit(LoadingState());
      Either<Failuer, CarsModel> successOrFailuer =
          await getCarsUseCase.excute(input: Void);

      successOrFailuer.fold((faliuer) {
        emit(GetCarsFaield(failuer: faliuer));
      }, (carsModel) {
        print(carsModel.listCarModel.map((e) => e.brandName));
        print(carsModel.listCarModel.map((e) => e.rentalPrice));
        print(carsModel.listCarModel.map((e) => e.rentalPricePerDay));

        print(carsModel.listCarModel.map((e) => e.photos));
        listcarsModel=carsModel;
        emit(GetCarsSuccess(carsModel: carsModel));
      });
    });
  }
  static SearchBloc getBloc(BuildContext context) {
    return BlocProvider.of<SearchBloc>(context);
  }

  String _selectedCity = '';
  String get getSelectedCity => _selectedCity;
  void setSelectedCity(String selectedCity) {
    _selectedCity = selectedCity;
  }

  final TextEditingController dateFrom = TextEditingController();

  final TextEditingController dateTo = TextEditingController();
  final TextEditingController searchCity = TextEditingController();
  CarsModel ?listcarsModel;
}
