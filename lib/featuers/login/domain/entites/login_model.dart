class LoginModel {
  final String token;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String phoneCountryCode;
  final String address;
  final String gender;
  final String nationality;
  final String birthDate;
  final String birthPlace;
  final String additonalPhone;

  LoginModel({
    required this.token,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.phoneCountryCode,
      required this.address,
      required this.gender,
      required this.nationality,
      required this.birthDate,
      required this.birthPlace,
      required this.additonalPhone});
}
