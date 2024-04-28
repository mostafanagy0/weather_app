import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/feature/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.yellow;
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light drizzle':
    case 'patchy light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain at times':
    case 'moderate rain':
    case 'heavy rain at times':
    case 'heavy rain':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
    case 'light rain shower':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.lightBlue;
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
    case 'patchy light snow':
    case 'light snow':
    case 'patchy moderate snow':
    case 'moderate snow':
    case 'patchy heavy snow':
    case 'heavy snow':
    case 'light snow showers':
    case 'moderate or heavy snow showers':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
    case 'thundery outbreaks possible':
    case 'patchy light sleet':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'patchy sleet':
    case 'thunderstorm':
      return Colors.amber;
    case 'blowing snow':
    case 'blizzard':
      return Colors.blueGrey;

    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    default:
      return Colors.blue;
  }
}
