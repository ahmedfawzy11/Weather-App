import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/Core/Error/exceptions.dart';
import 'package:weather_application/Core/Network/cacheHelper.dart';
import 'package:weather_application/Core/Network/dioHelper.dart';
import 'package:weather_application/Core/Service/serviceLocator.dart';
import 'package:weather_application/Feature/Presentation/Management/observerBloc.dart';
import 'package:weather_application/myApp.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location Not Available',
      );
    }
  }
  if (!await Geolocator.isLocationServiceEnabled()) {
    throw LocationDisabledException();
  }
  // ignore: deprecated_member_use
  BlocOverrides.runZoned(
    () {
      runApp(
        MyApp(),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}
