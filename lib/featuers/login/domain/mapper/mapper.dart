import 'package:devbey/featuers/login/data/response/login_response.dart';
import 'package:devbey/featuers/login/domain/entites/login_model.dart';
import 'package:http/retry.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension LoginResponseToModel on LoginResponse? {
  LoginModel toModel() {
    return LoginModel(
      photo: this!.user!.customer!.photo?? '',
        token: this!.token ?? '',
        firstName: this!.user!.customer!.name ?? '',
        lastName: this!.user!.customer!.surname ?? '',
        email: this!.user!.customer!.email ?? '',
        phoneNumber: this!.user!.customer!.phone ?? '',
        phoneCountryCode: this!.user!.customer!.phoneCountryCode ?? '',
        address: this!.user!.customer!.address ?? '',
        gender: this!.user!.customer!.gender ?? '',
        nationality: this!.user!.customer!.nationality ?? '',
        birthDate: this!.user!.customer!.birthDate ?? '',
        birthPlace: this!.user!.customer!.birthPlace ?? '',
        additonalPhone: this!.user!.customer!.birthPlace ?? '');
  }
}
////
