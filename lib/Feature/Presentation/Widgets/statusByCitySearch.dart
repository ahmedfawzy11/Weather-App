import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/Core/Utils/colors.dart';
import 'package:weather_application/Core/Utils/enums.dart';
import 'package:weather_application/Core/Utils/images.dart';
import 'package:weather_application/Core/Utils/strings.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherState.dart';

class StatusWidgetByCityName extends StatelessWidget {
  const StatusWidgetByCityName({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(
      context,
    ).size;
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (
        context,
        state,
      ) {
        switch (state.currentRequestStateByCity) {
          case RequestState.loading:
            return const Center();
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.all(
                15.00,
              ),
              child: Container(
                height: size.height * 0.22,
                width: size.width,
                margin: const EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.2,
                    color: AppColors.blueColor,
                  ),
                  borderRadius: BorderRadius.circular(
                    35,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                            ImageAsset.humidity,
                            height: size.height * 0.1,
                            width: size.width * 0.2,
                          ),
                          Text(
                            '${state.currentWeatherByCity!.humidity.toInt()} %',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppStrings.humidity,
                            style: TextStyle(
                              color: AppColors.whiteColor.withOpacity(
                                .6,
                              ),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                            ImageAsset.wind,
                            height: size.height * 0.1,
                            width: size.width * 0.2,
                          ),
                          Text(
                            "${state.currentWeatherByCity!.speed.toInt()} ${AppStrings.kmOnH}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppStrings.wind,
                            style: TextStyle(
                              color: AppColors.whiteColor.withOpacity(
                                .6,
                              ),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                            ImageAsset.uvIndex,
                            height: size.height * 0.1,
                            width: size.width * 0.2,
                          ),
                          Text(
                            AppStrings.low,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppStrings.uv,
                            style: TextStyle(
                              color: AppColors.whiteColor.withOpacity(
                                .6,
                              ),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          case RequestState.error:
            return Center(
              child: Text(
                state.currentMessageByCity,
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
