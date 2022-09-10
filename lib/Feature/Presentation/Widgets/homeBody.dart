import 'package:flutter/material.dart';
import 'package:weather_application/Feature/Presentation/Widgets/dailyTable.dart';
import 'package:weather_application/Feature/Presentation/Widgets/status.dart';
import 'package:weather_application/Feature/Presentation/Widgets/sunsetSunrise.dart';
import 'package:weather_application/Feature/Presentation/Widgets/todayHourWeather.dart';
import 'package:weather_application/Feature/Presentation/Widgets/weatherDetails.dart';

class HomeBodyWidgets extends StatelessWidget {
  const HomeBodyWidgets({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return SingleChildScrollView(
      child: Column(children: [
        CurrentWeatherDetails(),
        SizedBox(
          height: 10,
        ),
        TodayWeather(),
        Status(),
        DailyTable(),
        SunsetSunrise(),
      ]),
    );
  }
}
