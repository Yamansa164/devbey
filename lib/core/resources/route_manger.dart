import 'package:devbey/core/di/di.dart';
import 'package:devbey/featuers/login/presntiation/page/login_page.dart';
import 'package:devbey/featuers/profile/presntiation/page/profild_page.dart';
import 'package:devbey/featuers/search/presntiation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../featuers/login/presntiation/bloc/login_bloc.dart';
import '../../featuers/search/presntiation/bloc/search_bloc.dart';

class Routes {
  static const String loginPage = '/loginPage';
  static const String profilePage = '/profilePage';
  static const String searchPage = '/searchPage';
}

class RouteGenerator {
  static Route<dynamic> ?getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginPage:
        {
          loginDi();
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context) => LoginBloc(),
              child: LoginPage(),
            ),
          );
        }
   
      case Routes.searchPage:
      searchDi();
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchBloc(),
            child: HomePage(),
          ),
        );

      case Routes.profilePage:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
        );

      // default:
      // searchDi();
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => SearchBloc(),
      //       child: HomePage(),
      //     ),
      //   );
    }
    return null;
  }

  
}
