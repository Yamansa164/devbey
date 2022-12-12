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

class SearchBloc extends Bloc<BlocEvent, BlocState> {
  GetCitiesUseCase getCitiesUseCase = instance<GetCitiesUseCase>();
  GetCarsUseCase getCarsUseCase = instance<GetCarsUseCase>();

  SearchBloc() : super(SearchInitial()) {
    on<GetCitiesEvent>((event, emit) async {
      emit(LoadingState());
      Either<Failuer, CitiesModel> successOrFailuer =
          await getCitiesUseCase.excute(input: Void);

      successOrFailuer.fold(
          (faliuer) => emit(GetCitiesFaield(failuer: faliuer)), (citiesModel) {
        emit(GetCitiesSuccess(citiesModel: citiesModel));
      });
    });

    on<GetCarsEvent>((event, emit) async {
      emit(LoadingState());
      Either<Failuer, CarsModel> successOrFailuer = await getCarsUseCase.excute(
          input: GetCarsInput(
              location: getSelectedCityid,
              dateFrom: dateFrom.text,
              dateTo: dateTo.text,
              page: 0));

      successOrFailuer.fold((faliuer) {
        emit(GetCarsFaield(failuer: faliuer));
      }, (carsModel) {
        listcarsModel= carsModel;
        emit(GetCarsSuccess());
      });
    });
  }
  static SearchBloc getBloc(BuildContext context) {
    return BlocProvider.of<SearchBloc>(context);
  }

  String _selectedCityid = '';
  String get getSelectedCityid => _selectedCityid;
  void setSelectedCityId(String selectedCityid) {
    _selectedCityid = selectedCityid;
  }

  String _selectedCityname = '';
  String get getSelectedCityname => _selectedCityname;
  void setSelectedCityName(String selectedCityName) {
    _selectedCityname = selectedCityName;
  }

  final TextEditingController dateFrom = TextEditingController();

  final TextEditingController dateTo = TextEditingController();
  final TextEditingController searchCity = TextEditingController();
  CarsModel ?listcarsModel;
}