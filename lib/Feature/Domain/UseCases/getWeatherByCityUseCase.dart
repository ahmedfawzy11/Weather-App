import 'package:dartz/dartz.dart';
import 'package:weather_application/Core/Error/failure.dart';
import 'package:weather_application/Core/UseCases/baseUseCase.dart';
import 'package:weather_application/Feature/Domain/Entities/currentWeather.dart';
import 'package:weather_application/Feature/Domain/Repositories/baseWeatherRepository.dart';

class GetWeatherByCityUserCase extends BaseUseCases<CurrentWeather, String> {
  final BaseWeatherRepository repository;

  GetWeatherByCityUserCase(
    this.repository,
  );

  @override
  Future<Either<Failure, CurrentWeather>> call(
    String Parameters,
  ) async {
    return await repository.getWeatherByCity(
      Parameters,
    );
  }
}
