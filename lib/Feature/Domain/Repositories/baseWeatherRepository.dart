import 'package:dartz/dartz.dart';
import 'package:weather_application/Core/Error/failure.dart';
import 'package:weather_application/Feature/Domain/Entities/currentWeather.dart';
import 'package:weather_application/Feature/Domain/Entities/dailyWeather.dart';
import 'package:weather_application/Feature/Domain/Entities/hourlyWeather.dart';

abstract class BaseWeatherRepository {
  Future<Either<Failure, CurrentWeather>> getWeather();
  Future<Either<Failure, CurrentWeather>> getWeatherByCity(
    String weatherCity,
  );
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather();
  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather();
}
