import 'package:dartz/dartz.dart';
import 'package:weather_application/Core/Error/failure.dart';
import 'package:weather_application/Core/UseCases/baseUseCase.dart';
import 'package:weather_application/Feature/Domain/Entities/currentWeather.dart';
import 'package:weather_application/Feature/Domain/Repositories/baseWeatherRepository.dart';

class GetCurrentWeatherUseCase
    extends BaseUseCases<CurrentWeather, NoParameters> {
  final BaseWeatherRepository baseWeatherRepository;

  GetCurrentWeatherUseCase(
    this.baseWeatherRepository,
  );

  @override
  Future<Either<Failure, CurrentWeather>> call(
    NoParameters Parameters,
  ) async {
    // TODO: implement call
    return await baseWeatherRepository.getWeather();
  }
}
