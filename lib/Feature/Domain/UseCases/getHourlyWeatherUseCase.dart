import 'package:dartz/dartz.dart';
import 'package:weather_application/Core/Error/failure.dart';
import 'package:weather_application/Core/UseCases/baseUseCase.dart';
import 'package:weather_application/Feature/Domain/Entities/hourlyWeather.dart';
import 'package:weather_application/Feature/Domain/Repositories/baseWeatherRepository.dart';

class GetHourlyWeatherUseCase
    extends BaseUseCases<List<HourlyWeather>, NoParameters> {
  final BaseWeatherRepository baseWeatherRepository;

  GetHourlyWeatherUseCase(
    this.baseWeatherRepository,
  );
  @override
  Future<Either<Failure, List<HourlyWeather>>> call(
    NoParameters Parameters,
  ) async {
    return await baseWeatherRepository.getHourlyWeather();
  }
}
