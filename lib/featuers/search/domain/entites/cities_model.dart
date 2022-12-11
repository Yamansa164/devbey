

class CitiesModel{
  List<CityModel> citiesModel;
  CitiesModel({required this.citiesModel});
}
class CityModel{
  final String name;
  final int id;
  CityModel({required this.id,required this.name,});
}