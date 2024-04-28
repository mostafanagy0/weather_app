import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class weatherServices {
  final Dio dio;
  final baseUrl = 'https://api.weatherapi.com/v1';
  final apiKey = '10c803c37b8440ee862185027243103';
  //10c803c37b8440ee862185027243103

  weatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weathermodel = WeatherModel.fromjson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error,tray later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops ther was an error, tray later');
    }
  }
}
