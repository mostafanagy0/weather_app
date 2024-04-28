// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

// creat cubit
class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(InitialState());

  //object to access date from cubit
  WeatherModel? weatherModel;

  // function
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await weatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLodedState(weatherModel!));
    } catch (e) {
      emit(WeatherFiler(e.toString()));
    }
  }
}
