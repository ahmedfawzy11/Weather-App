import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Core/Service/serviceLocator.dart';
import 'package:weather_application/Core/Utils/appConstance.dart';
import 'package:weather_application/Core/Utils/colors.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherEvent.dart';
import 'package:weather_application/Feature/Presentation/Screens/searchScreen.dart';
import 'package:weather_application/Feature/Presentation/Widgets/customDrawer.dart';
import 'package:weather_application/Feature/Presentation/Widgets/homeBody.dart';

// ignore: must_be_immutable
class WeatherHomeScreen extends StatelessWidget {
  late String cityName = 'Cairo';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (
        BuildContext context,
      ) =>
          sl<WeatherBloc>()
            ..add(
              GetHourlyWeatherEvent(),
            )
            ..add(
              GetCurrentWeatherEvent(),
            )
            ..add(
              GetDailyWeatherEvent(),
            ),
      child: Scaffold(
        drawer: CustomDrawer(),
        body: HomeBodyWidgets(),
        appBar: AppBar(
          backgroundColor: AppColors.blueColor,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 20,
              ),
              child: InkWell(
                onTap: () {
                  NavigateTo(
                    context: context,
                    router: SearchScreen(),
                  );
                },
                child: Icon(
                  Icons.search,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
