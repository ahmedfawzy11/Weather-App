import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/Core/Utils/colors.dart';
import 'package:weather_application/Core/Utils/enums.dart';
import 'package:weather_application/Core/Utils/images.dart';
import 'package:weather_application/Core/Utils/mediaQuery.dart';
import 'package:weather_application/Core/Utils/strings.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherState.dart';

class SunsetSunrise extends StatelessWidget {
  const SunsetSunrise({
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
        switch (state.currentRequestState) {
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
                          Text(
                            AppStrings.sunrise,
                            style: TextStyle(
                              fontSize: context.height20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: context.height10 / 2,
                          ),
                          Text(
                            DateFormat(
                              'h:mm a',
                            ).format(
                              DateTime.fromMillisecondsSinceEpoch(
                                state.currentWeather!.sunrise.toInt() * 1000,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: context.height20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          LottieBuilder.asset(
                            ImageAsset.sunrise,
                            height: context.height30 * 3,
                            width: context.height30 * 5,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            AppStrings.sunset,
                            style: TextStyle(
                              fontSize: context.height20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: context.height10 / 2,
                          ),
                          Text(
                            DateFormat(
                              'h:mm a',
                            ).format(
                              DateTime.fromMillisecondsSinceEpoch(
                                state.currentWeather!.sunset.toInt() * 1000,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: context.height20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          LottieBuilder.asset(
                            ImageAsset.sunset,
                            height: context.height30 * 3,
                            width: context.height30 * 5,
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
