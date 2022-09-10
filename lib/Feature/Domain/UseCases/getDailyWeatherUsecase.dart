import 'package:dartz/dartz.dart';
import 'package:weather_application/Core/Error/failure.dart';
import 'package:weather_application/Core/UseCases/baseUseCase.dart';
import 'package:weather_application/Feature/Domain/Entities/dailyWeather.dart';
import 'package:weather_application/Feature/Domain/Repositories/baseWeatherRepository.dart';

class GetDailyWeatherUseCase
    extends BaseUseCases<List<DailyWeather>, NoParameters> {
  final BaseWeatherRepository baseWeatherRepository;

  GetDailyWeatherUseCase(
    this.baseWeatherRepository,
  );

  @override
  Future<Either<Failure, List<DailyWeather>>> call(
    NoParameters Parameters,
  ) async {
    return await baseWeatherRepository.getDailyWeather();
  }
}
