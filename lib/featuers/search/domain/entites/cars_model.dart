import 'package:flutter/material.dart';




class CarsModel {
  List<CarModel> listCarModel;
  CarsModel({required this.listCarModel});
}

class CarModel {
  dynamic rentalPrice;
  dynamic rentalPricePerDay;

  final String photos;

  final String brandName;

  final String color;

  CarModel(
      {required this.rentalPrice,
      required this.rentalPricePerDay,
      required this.photos,
      required this.brandName,
      required this.color});
}
