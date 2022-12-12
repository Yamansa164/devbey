import 'dart:ffi';
import 'dart:math';

import 'package:devbey/featuers/login/domain/entites/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<void> setUserInfo({required LoginModel loginModel});
  Future<void> removeUserInfo();

  Future<bool> isLogin();
}

class LocalDataSourceImpl extends LocalDataSource {
  final SharedPreferences prefs;
  LocalDataSourceImpl({required this.prefs});
  @override
  Future<void> setUserInfo({required LoginModel loginModel}) async {
    await prefs.setString('token', loginModel.token);
    await prefs.setString('firstName', loginModel.firstName);
    await prefs.setString('lastName', loginModel.lastName);

    await prefs.setString('email', loginModel.email);
    await prefs.setString('phoneCode', loginModel.phoneCountryCode);
    await prefs.setString('photo', loginModel.photo);

    await prefs.setString('phone', loginModel.phoneNumber);
    await prefs.setString('address', loginModel.address);
    await prefs.setString('nationality', loginModel.nationality);
    await prefs.setString('birthDate', loginModel.birthDate);
  }

  @override
  Future<bool> isLogin() async {
    if (await prefs.getString('token')!.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Future<void> removeUserInfo() async {
    await prefs.setString('token', '');
    await prefs.setString('firstName', '');
    await prefs.setString('lastName', '');

    await prefs.setString('email', '');
    await prefs.setString('phoneCode', '');
    await prefs.setString('photo', '');

    await prefs.setString('phone', '');
    await prefs.setString('address', '');
    await prefs.setString('nationality', '');
    await prefs.setString('birthDate', '');
  }
}
