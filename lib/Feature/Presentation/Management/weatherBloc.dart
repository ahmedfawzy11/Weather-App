import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Core/UseCases/baseUseCase.dart';
import 'package:weather_application/Core/Utils/enums.dart';
import 'package:weather_application/Feature/Domain/UseCases/getCurrentWeatherUseCase.dart';
import 'package:weather_application/Feature/Domain/UseCases/getDailyWeatherUseCase.dart';
import 'package:weather_application/Feature/Domain/UseCases/getHourlyWeatherUseCase.dart';
import 'package:weather_application/Feature/Domain/UseCases/getWeatherByCityUseCase.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherEvent.dart';
import 'package:weather_application/Feature/Presentation/Management/weatherState.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  final GetWeatherByCityUserCase getWeatherByCityUserCase;
  final GetDailyWeatherUseCase getDailyWeatherUseCase;
  final GetHourlyWeatherUseCase getHourlyWeatherUseCase;

  WeatherBloc(
    this.getCurrentWeatherUseCase,
    this.getWeatherByCityUserCase,
    this.getDailyWeatherUseCase,
    this.getHourlyWeatherUseCase,
  ) : super(
          WeatherState(),
        ) {
    on<GetCurrentWeatherEvent>(
      _getCurrentWeather,
    );
    on<GetCurrentWeatherByCityEvent>(
      _getWeatherByCity,
    );
    on<GetDailyWeatherEvent>(
      _getDailyWeather,
    );
    on<GetHourlyWeatherEvent>(
      _getHourlyWeather,
    );
  }

  Future<void> _getCurrentWeather(
    GetCurrentWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await getCurrentWeatherUseCase.call(
      const NoParameters(),
    );
    result.fold(
      (
        l,
      ) =>
          emit(
        state.copyWith(
          currentRequestState: RequestState.error,
          currentMessage: l.message,
        ),
      ),
      (
        r,
      ) =>
          emit(
        state.copyWith(
          currentWeather: r,
          currentRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getWeatherByCity(
    GetCurrentWeatherByCityEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await getWeatherByCityUserCase.call(
      event.city,
    );
    result.fold(
      (
        l,
      ) =>
          emit(
        state.copyWith(
          currentRequestStateByCity: RequestState.error,
          currentMessageByCity: l.message,
        ),
      ),
      (
        r,
      ) =>
          emit(
        state.copyWith(
          currentWeatherByCity: r,
          currentRequestStateByCity: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getDailyWeather(
    GetDailyWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await getDailyWeatherUseCase.call(
      const NoParameters(),
    );
    result.fold(
      (
        l,
      ) =>
          emit(
        state.copyWith(
          dailyRequestState: RequestState.error,
          dailyMessage: l.message,
        ),
      ),
      (
        r,
      ) =>
          emit(
        state.copyWith(
          dailyWeather: r,
          dailyRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> _getHourlyWeather(
    GetHourlyWeatherEvent event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await getHourlyWeatherUseCase.call(
      const NoParameters(),
    );
    result.fold(
      (
        l,
      ) =>
          emit(
        state.copyWith(
          hourlyRequestState: RequestState.error,
          hourlyMessage: l.message,
        ),
      ),
      (
        r,
      ) =>
          emit(
        state.copyWith(
          hourlyWeather: r,
          hourlyRequestState: RequestState.loaded,
        ),
      ),
    );
  }
}
