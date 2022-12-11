class CitiesResponse {
  List<CityResponse>? cityResponse;

  CitiesResponse({this.cityResponse});

  CitiesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      cityResponse = <CityResponse>[];
      json['data'].forEach((v) {
        cityResponse!.add(new CityResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (cityResponse != null) {
      data['data'] = cityResponse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityResponse {
  int? id;
  String? name;

  CityResponse(
      {this.id,
      this.name,
      });

  CityResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
  
   
    return data;
  }
}
