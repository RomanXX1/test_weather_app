import 'package:test_app_weather/server/weather_api.dart';
import 'package:test_app_weather/server/weather_forecast.dart';

class ObjRepository {
  WeatherApi _weatherProvider = WeatherApi();

  Future<WeatherForecast> getWeather() =>
      _weatherProvider.fetchWeatherForecast();
}
