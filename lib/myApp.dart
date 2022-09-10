import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Config/Route/appRoutes.dart';
import 'package:weather_application/Config/Theme/themes.dart';
import 'package:weather_application/Core/Service/serviceLocator.dart';
import 'package:weather_application/Core/Utils/strings.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherEvent.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherState.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((
            context,
          ) =>
              sl<WeatherBloc>()
                ..add(
                  GetHourlyWeatherEvent(),
                )
                ..add(
                  GetDailyWeatherEvent(),
                )
                ..add(
                  GetCurrentWeatherEvent(),
                )),
        ),
      ],
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (
          context,
          state,
        ) {},
        builder: (
          context,
          state,
        ) {
          return MaterialApp(
            title: AppStrings.weather,
            theme: DarkTheme(),
            //  home:  WeatherHomeScreen(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
