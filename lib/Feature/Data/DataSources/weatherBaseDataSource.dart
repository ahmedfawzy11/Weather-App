import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_application/Core/Error/exceptions.dart';
import 'package:weather_application/Core/Network/apiConstance.dart';
import 'package:weather_application/Feature/Data/Models/dailyWeatherModel.dart';
import 'package:weather_application/Feature/Data/Models/errorMessageModel.dart';
import 'package:weather_application/Feature/Data/Models/hourlyWeatherModel.dart';
import 'package:weather_application/Feature/Data/Models/weatherModel.dart';

abstract class BaseWeatherDataSource {
  Future<WeatherModel> getWeather();
  Future<WeatherModel> getWeatherByCity(
    String city,
  );
  Future<List<DailyWeatherModel>> getDailyWeather();
  Future<List<HourlyWeatherModel>> getHourlyWeather();
}

class WeatherRemoteDataSource extends BaseWeatherDataSource {
  @override
  Future<WeatherModel> getWeather() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latitude = position.latitude;
    double longitude = position.longitude;
    print(
      "position: ${position}",
    );
    final response = await Dio().get(
      ApiConstance.currentWeatherByCoordinates(
        latitude,
        longitude,
      ),
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<WeatherModel> getWeatherByCity(
    String city,
  ) async {
    final response = await Dio().get(
      ApiConstance.currentWeather(
        city,
      ),
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(
        response.data,
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<DailyWeatherModel>> getDailyWeather() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;
    final response = await Dio().get(
      ApiConstance.dailyWeather(
        latitude,
        longitude,
      ),
    );
    if (response.statusCode == 200) {
      return List.from(
        (response.data['daily'] as List).map(
          (element) => DailyWeatherModel.fromJson(
            element,
          ),
        ),
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }

  @override
  Future<List<HourlyWeatherModel>> getHourlyWeather() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    double latitude = position.latitude;
    double longitude = position.longitude;

    final response = await Dio().get(
      ApiConstance.hourlyWeather(
        latitude,
        longitude,
      ),
    );
    if (response.statusCode == 200) {
      print(
        "-hourly----------------------------------------- ${response.data['hourly']}",
      );
      return List.from(
        (response.data['hourly'] as List).map(
          (element) => HourlyWeatherModel.fromJson(
            element,
          ),
        ),
      );
    } else {
      throw ServerException(
        ErrorMessageModel.fromJson(
          response.data,
        ),
      );
    }
  }
}
