import 'package:bloc/bloc.dart';
import 'package:devbey/core/di/di.dart';
import 'package:devbey/featuers/login/presntiation/page/login_page.dart';
import 'package:flutter/material.dart';

import 'core/bloc/bloc_observer.dart';
import 'core/resources/route_manger.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.firstPage,
    );
  }
}
