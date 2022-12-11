class LoginResponse {
  String? token;
  User? user;
  List<dynamic>? permissions;

  LoginResponse({this.token, this.user, this.permissions});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (permissions != null) {
      data['permissions'] = permissions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  dynamic companyId;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic avatar;
  dynamic notificationKey;
  dynamic notificationKeyName;
  dynamic createdBy;
  int? updatedBy;
  dynamic deletedBy;
  String? latestToken;
  bool? isCoordinator;
  List<dynamic>? branches;
  dynamic company;
  Customer? customer;

  User(
      {this.id,
      this.companyId,
      this.name,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.avatar,
      this.notificationKey,
      this.notificationKeyName,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.latestToken,
      this.isCoordinator,
      this.branches,
      this.company,
      this.customer});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    avatar = json['avatar'];
    notificationKey = json['notification_key'];
    notificationKeyName = json['notification_key_name'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    latestToken = json['latest_token'];
    isCoordinator = json['is_coordinator'];
    
    company = json['company'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['avatar'] = avatar;
    data['notification_key'] = notificationKey;
    data['notification_key_name'] = notificationKeyName;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_by'] = deletedBy;
    data['latest_token'] = latestToken;
    data['is_coordinator'] = isCoordinator;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    data['company'] = company;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? name;
  String? surname;
  String? phone;
  String? phoneCountryCode;
  dynamic gender;
  dynamic additionalPhone;
  dynamic nationality;
  dynamic birthDate;
  String? email;
  dynamic countryId;
  dynamic stateId;
  dynamic cityId;
  dynamic address;
  dynamic residenceNumber;
  dynamic residenceExpiry;
  dynamic passportNumber;
  dynamic passportExpiry;
  String? licenseNumber;
  String? licenseType;
  String? licenseExpiry;
  dynamic notes;
  bool? taxEnabled;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic photo;
  dynamic birthPlace;
  bool? isForeignResident;
  dynamic createdBy;
  int? updatedBy;
  dynamic deletedBy;
  dynamic signature;
  int? userId;
  int? registerSource;
  int? licenseSourceId;
  bool? isVerified;
  bool? isActual;
  bool? hasOnlineAccount;
  String? fullName;

  Customer(
      {this.id,
      this.name,
      this.surname,
      this.phone,
      this.phoneCountryCode,
      this.gender,
      this.additionalPhone,
      this.nationality,
      this.birthDate,
      this.email,
      this.countryId,
      this.stateId,
      this.cityId,
      this.address,
      this.residenceNumber,
      this.residenceExpiry,
      this.passportNumber,
      this.passportExpiry,
      this.licenseNumber,
      this.licenseType,
      this.licenseExpiry,
      this.notes,
      this.taxEnabled,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.photo,
      this.birthPlace,
      this.isForeignResident,
      this.createdBy,
      this.updatedBy,
      this.deletedBy,
      this.signature,
      this.userId,
      this.registerSource,
      this.licenseSourceId,
      this.isVerified,
      this.isActual,
      this.hasOnlineAccount,
      this.fullName});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    phone = json['phone'];
    phoneCountryCode = json['phone_country_code'];
    gender = json['gender'];
    additionalPhone = json['additional_phone'];
    nationality = json['nationality'];
    birthDate = json['birth_date'];
    email = json['email'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    address = json['address'];
    residenceNumber = json['residence_number'];
    residenceExpiry = json['residence_expiry'];
    passportNumber = json['passport_number'];
    passportExpiry = json['passport_expiry'];
    licenseNumber = json['license_number'];
    licenseType = json['license_type'];
    licenseExpiry = json['license_expiry'];
    notes = json['notes'];
    taxEnabled = json['tax_enabled'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    photo = json['photo'];
    birthPlace = json['birth_place'];
    isForeignResident = json['is_foreign_resident'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    deletedBy = json['deleted_by'];
    signature = json['signature'];
    userId = json['user_id'];
    registerSource = json['register_source'];
    licenseSourceId = json['license_source_id'];
    isVerified = json['is_verified'];
    isActual = json['is_actual'];
    hasOnlineAccount = json['has_online_account'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['phone'] = phone;
    data['phone_country_code'] = phoneCountryCode;
    data['gender'] = gender;
    data['additional_phone'] = additionalPhone;
    data['nationality'] = nationality;
    data['birth_date'] = birthDate;
    data['email'] = email;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['address'] = address;
    data['residence_number'] = residenceNumber;
    data['residence_expiry'] = residenceExpiry;
    data['passport_number'] = passportNumber;
    data['passport_expiry'] = passportExpiry;
    data['license_number'] = licenseNumber;
    data['license_type'] = licenseType;
    data['license_expiry'] = licenseExpiry;
    data['notes'] = notes;
    data['tax_enabled'] = taxEnabled;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['photo'] = photo;
    data['birth_place'] = birthPlace;
    data['is_foreign_resident'] = isForeignResident;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['deleted_by'] = deletedBy;
    data['signature'] = signature;
    data['user_id'] = userId;
    data['register_source'] = registerSource;
    data['license_source_id'] = licenseSourceId;
    data['is_verified'] = isVerified;
    data['is_actual'] = isActual;
    data['has_online_account'] = hasOnlineAccount;
    data['full_name'] = fullName;
    return data;
  }
}