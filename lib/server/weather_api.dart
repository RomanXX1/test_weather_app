import 'package:http/http.dart' as http;
import 'package:test_app_weather/server/weather_forecast.dart';
import 'package:test_app_weather/utils/constans.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:test_app_weather/utils/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String cityName, bool isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parametres;

    if (isCity == true) {
      var queryParameters = {
        'APPID': Constans.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
      parametres = queryParameters;
    } else {
      var queryParameters = {
        'APPID': Constans.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longtitude.toString(),
      };
      parametres = queryParameters;
    }

    var uri = Uri.https(Constans.WEATHER_BASE_URL_DOMAIN,
        Constans.WEATHER_FORECAST_PATH, parametres);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response?.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
