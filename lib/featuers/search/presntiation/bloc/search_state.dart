part of 'search_bloc.dart';

@immutable
abstract class BlocState {}

class SearchInitial extends BlocState {}

class LoadingState extends BlocState {}

class GetCitiesFaield extends BlocState {
  final Failuer failuer;
  GetCitiesFaield({required this.failuer});
}

class GetCitiesSuccess extends BlocState {
  GetCitiesSuccess({required this.citiesModel});
  final CitiesModel citiesModel;
}

class GetCarsFaield extends BlocState {
  final Failuer failuer;
  GetCarsFaield({required this.failuer});
}

class GetCarsSuccess extends BlocState {}

class GetMoreCarsInitial extends BlocState {


}
class GetMoreCarsLoading extends BlocState {


}
class GetMoreDataFaield extends BlocState {
  final Failuer failuer;
  GetMoreDataFaield({required this.failuer});
}
class GetMoreCarsSuccess extends BlocState {
    final CarsModel carsModel;

  GetMoreCarsSuccess({required this.carsModel});

}
