import 'package:get_it/get_it.dart';
import 'package:weather_application/Feature/Data/DataSources/weatherBaseDataSource.dart';
import 'package:weather_application/Feature/Data/Repositories/weatherRepository.dart';
import 'package:weather_application/Feature/Domain/Repositories/baseWeatherRepository.dart';
import 'package:weather_application/Feature/Domain/UseCases/getCurrentWeatherUseCase.dart';
import 'package:weather_application/Feature/Domain/UseCases/getDailyWeatherUseCase.dart';
import 'package:weather_application/Feature/Domain/UseCases/getHourlyWeatherUseCase.dart';
import 'package:weather_application/Feature/Domain/UseCases/getWeatherByCityUseCase.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherBloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerLazySingleton<BaseWeatherDataSource>(
      () => WeatherRemoteDataSource(),
    );

    sl.registerLazySingleton<BaseWeatherRepository>(
      () => WeatherRepository(
        weatherDataSource: sl(),
      ),
    );

    sl.registerLazySingleton<GetCurrentWeatherUseCase>(
      () => GetCurrentWeatherUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetWeatherByCityUserCase>(
      () => GetWeatherByCityUserCase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetDailyWeatherUseCase>(
      () => GetDailyWeatherUseCase(
        sl(),
      ),
    );
    sl.registerLazySingleton<GetHourlyWeatherUseCase>(
      () => GetHourlyWeatherUseCase(
        sl(),
      ),
    );

    sl.registerFactory<WeatherBloc>(
      () => WeatherBloc(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
  }
}
