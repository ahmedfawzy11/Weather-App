import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Core/Utils/enums.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherState.dart';

class FavouriteLocation extends StatelessWidget {
  const FavouriteLocation({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (
        context,
        state,
      ) {
        switch (state.currentRequestState) {
          case RequestState.loading:
            return const Center();
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.location_pin,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    state.currentWeather!.cityName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "${state.currentWeather!.temperature.toInt()} \u00B0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
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
