part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingState extends SearchState {}

class GetCitiesFaield extends SearchState {
  final Failuer failuer;
  GetCitiesFaield({required this.failuer});
}

class GetCitiesSuccess extends SearchState {
  GetCitiesSuccess({required this.citiesModel});
  final CitiesModel citiesModel;
}

class GetCarsFaield extends SearchState {
  final Failuer failuer;
  GetCarsFaield({required this.failuer});
}

class GetCarsSuccess extends SearchState {
  GetCarsSuccess({required this.carsModel});
  final CarsModel carsModel;
}
