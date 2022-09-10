import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Core/Service/serviceLocator.dart';
import 'package:weather_application/Core/Utils/appConstance.dart';
import 'package:weather_application/Core/Utils/colors.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherEvent.dart';
import 'package:weather_application/Feature/Presentation/Screens/searchScreen.dart';
import 'package:weather_application/Feature/Presentation/Screens/weatherHomeScreen.dart';
import 'package:weather_application/Feature/Presentation/Widgets/search.dart';
import 'package:weather_application/Feature/Presentation/Widgets/statusByCitySearch.dart';
import 'package:weather_application/Feature/Presentation/Widgets/sunsetSunriseByCitySearch.dart';

// ignore: must_be_immutable
class WeatherByCityScreen extends StatelessWidget {
  String? cityName;
  WeatherByCityScreen({
    required this.cityName,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocProvider(
      create: (BuildContext context) => sl<WeatherBloc>()
        ..add(
          GetCurrentWeatherByCityEvent(
            cityName!,
          ),
        )
        ..add(
          GetCurrentWeatherEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blueColor,
          leading: InkWell(
            onTap: () {
              NavigateTo(
                router: WeatherHomeScreen(),
                context: context,
              );
            },
            child: Icon(
              Icons.near_me_rounded,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  NavigateTo(
                    router: SearchScreen(),
                    context: context,
                  );
                },
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              WeatherByCityWidget(),
              SizedBox(
                height: 20,
              ),
              StatusWidgetByCityName(),
              SunsetSunriseByCitySearch()
            ],
          ),
        ),
      ),
    );
  }
}
