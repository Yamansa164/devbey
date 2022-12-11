import 'package:devbey/featuers/search/domain/entites/cars_model.dart';

class AllResponse {
  CarsResponse? data;

  AllResponse({
    this.data,
  });

  AllResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? CarsResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    return data;
  }
}

class CarsResponse {
  List<CarResponse>? data1;

  CarsResponse({
    this.data1,
  });

  CarsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data1 = <CarResponse>[];
      json['data'].forEach((v) {
        data1!.add(CarResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (data1 != null) {
      data['data'] = data1!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class CarResponse {
  int? id;
  dynamic rentalPrice;
  dynamic rentalPricePerDay;

  Brand? brand;

  String? color;

  String? photos;

  CarResponse(
      {this.id,
      this.brand,
      this.color,
      this.photos,
      required this.rentalPrice,
      required this.rentalPricePerDay});

  CarResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    rentalPrice = json['rental_price'];
    rentalPricePerDay = json['rental_price_per_day'];
    color = json['color'];

    photos = json['photos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (brand != null) {
      data['brand'] = brand!.toJson();
      data['rental_price'] = rentalPrice;
      data['rental_price_per_day'] = rentalPricePerDay;
    }

    data['color'] = color;

    data['photos'] = photos;

    return data;
  }
}

class Brand {
  int? id;
  String? name;

  Brand({
    this.id,
    this.name,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    return data;
  }
}
