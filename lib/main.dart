
import 'package:agile/shared/network/remote/dio_helper.dart';
import 'package:agile/shared/service/app_reouter.dart';
import 'package:agile/shared/service/bloc_observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}

