import 'package:dartz/dartz.dart';
import 'package:weather_application/Core/Error/exceptions.dart';
import 'package:weather_application/Core/Error/failure.dart';
import 'package:weather_application/Feature/Data/DataSources/weatherBaseDataSource.dart';
import 'package:weather_application/Feature/Domain/Entities/currentWeather.dart';
import 'package:weather_application/Feature/Domain/Entities/dailyWeather.dart';
import 'package:weather_application/Feature/Domain/Entities/hourlyWeather.dart';
import 'package:weather_application/Feature/Domain/Repositories/baseWeatherRepository.dart';

class WeatherRepository extends BaseWeatherRepository {
  final BaseWeatherDataSource weatherDataSource;

  WeatherRepository({
    required this.weatherDataSource,
  });

  @override
  Future<Either<Failure, CurrentWeather>> getWeather() async {
    final result = await weatherDataSource.getWeather();
    try {
      return Right(
        result,
      );
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessage.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, CurrentWeather>> getWeatherByCity(
    String city,
  ) async {
    final result = await weatherDataSource.getWeatherByCity(
      city,
    );
    try {
      return Right(
        result,
      );
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessage.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<DailyWeather>>> getDailyWeather() async {
    final result = await weatherDataSource.getDailyWeather();
    try {
      return Right(
        result,
      );
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessage.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<HourlyWeather>>> getHourlyWeather() async {
    final result = await weatherDataSource.getHourlyWeather();
    try {
      return Right(
        result,
      );
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessage.message,
        ),
      );
    }
  }
}
