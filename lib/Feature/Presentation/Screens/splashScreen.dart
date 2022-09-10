import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/Config/Route/appRoutes.dart';
import 'package:weather_application/Core/Utils/colors.dart';
import 'package:weather_application/Core/Utils/images.dart';
import 'package:weather_application/Core/Utils/strings.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherEvent.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _startDelay() async {
    await Future.delayed(
      const Duration(
        milliseconds: 2500,
      ),
      () {},
    );
    Navigator.pushReplacementNamed(
      context,
      Routes.currentweather,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
    GetCurrentWeatherEvent();
    GetHourlyWeatherEvent();
    GetDailyWeatherEvent();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: AppColors.colorSplash,
      body: Column(
        children: [
          Spacer(),
          Center(
            child: LottieBuilder.asset(
              ImageAsset.splash,
              height: 600,
              width: 500,
            ),
          ),
          Spacer(),
          Text(
            AppStrings.weather,
            style: TextStyle(
              fontSize: 24,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
