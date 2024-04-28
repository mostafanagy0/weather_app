import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class InitialState extends WeatherStates {}

class WeatherLodedState extends WeatherStates {
  final WeatherModel weatherModel;

  WeatherLodedState(this.weatherModel);
}

class WeatherFiler extends WeatherStates {
  final String errorMessage;

  WeatherFiler(this.errorMessage);
}
