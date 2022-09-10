import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_application/Core/Network/dioHelper.dart';
import 'package:weather_application/Feature/Data/Models/weatherModel.dart';
import 'package:weather_application/Feature/Presentation/Management/Cubit/state.dart';

class WeatherAppCubit extends Cubit<WeatherAppStates> {
  WeatherAppCubit()
      : super(
          InitializeWeatherAppState(),
        );

  static WeatherAppCubit get(
    context,
  ) =>
      BlocProvider.of(
        context,
      );
  WeatherModel? weatherModel;

  void getWeatherData({
    required String city,
  }) {
    emit(
      LoadingWeatherAppState(),
    );

    DioHelper.getData(query: {
      'q': city,
      'appid': 'd0d253c5dca7fb4ab6caf8ec961238f2',
    }).then((
      value,
    ) {
      weatherModel = WeatherModel.fromJson(
        value.data,
      );
      emit(
        WeatherSuccessDataAppState(),
      );
    }).catchError(
      (
        error,
      ) {
        emit(
          WeatherErrorDataAppState(
            error.toString(),
          ),
        );
      },
    );
  }
}
