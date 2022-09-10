import 'package:flutter/material.dart';
import 'package:weather_application/Core/Utils/strings.dart';
import 'package:weather_application/Feature/Presentation/Screens/splashScreen.dart';
import 'package:weather_application/Feature/Presentation/Screens/weatherHomeScreen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String currentweather = '/currentweather';
}

class AppRoutes {
  static Route? onGenerateRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (
            context,
          ) {
            return const SplashScreen();
          },
        );

      case Routes.currentweather:
        return MaterialPageRoute(
          builder: ((
            context,
          ) {
            return WeatherHomeScreen();
          }),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((
        context,
      ) =>
          Scaffold(
            body: Center(
              child: Text(
                AppStrings.noRouteFound,
              ),
            ),
          )),
    );
  }
}
