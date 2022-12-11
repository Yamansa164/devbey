part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class GetCitiesEvent extends SearchEvent{}
class GetCarsEvent extends SearchEvent{}
