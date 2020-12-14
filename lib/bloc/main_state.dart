import 'package:flutter/material.dart';
import 'package:test_app_weather/server/weather_forecast.dart';

abstract class MainStates {}

class MainWindowShowState extends MainStates {}

class MainLoadDataState extends MainStates {}

class MainDataShowState extends MainStates {
  WeatherForecast forecastObject;
  MainDataShowState({@required this.forecastObject})
      : assert(forecastObject != null);
}

class MainErrorLoadState extends MainStates {}

class MainNoDataState extends MainStates {}
