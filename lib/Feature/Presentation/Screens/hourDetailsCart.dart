import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Core/Utils/colors.dart';
import 'package:weather_application/Core/Utils/enums.dart';
import 'package:weather_application/Core/Utils/mediaQuery.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherState.dart';
import 'package:weather_application/Feature/Presentation/Widgets/hourlyChart.dart';

class HourDetailsChart extends StatelessWidget {
  const HourDetailsChart({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CurrentCityName(),
          SizedBox(
            height: 70,
          ),
          HourlyChart(),
        ],
      ),
    );
  }
}

class CurrentCityName extends StatelessWidget {
  const CurrentCityName({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        switch (state.currentRequestState) {
          case RequestState.loading:
            return const Center();
          case RequestState.loaded:
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_location,
                  size: context.height30,
                  color: AppColors.blueColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  state.currentWeather!.cityName,
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.blueColor,
                  ),
                ),
              ],
            );
          case RequestState.error:
            return Center(
              child: Text(
                state.currentMessage,
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
