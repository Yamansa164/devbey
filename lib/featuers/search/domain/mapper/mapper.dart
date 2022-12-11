import 'package:devbey/featuers/search/data/response/cities_response.dart';
import 'package:devbey/featuers/search/domain/entites/cities_model.dart';

import '../../data/response/cars_response.dart';
import '../entites/cars_model.dart';

extension CitiesResponseToModel on CitiesResponse? {
  CitiesModel toModel() {
    return CitiesModel(
        citiesModel: this!.cityResponse!.map((e) => e.toModel()).toList());
  }
}

extension CityResponseToModel on CityResponse? {
  CityModel toModel() {
    return CityModel(id: this!.id ?? 0, name: this!.name ?? '');
  }
}


extension CarsResponseToModel on CarsResponse? {
  CarsModel toModel() {
    return CarsModel(
        listCarModel: this!.data1!.map((e) => e.toModel()).toList());
  }
}

extension CarResponseToModel on CarResponse? {
  CarModel toModel() {
    return CarModel(
        rentalPrice: this!.rentalPrice ?? 0.0,
        rentalPricePerDay: this!.rentalPricePerDay ??0.0,
        photos: this!.photos ?? '',
        brandName: this!.brand!.name ?? '',
        color: this!.color ?? '');
  }
}
