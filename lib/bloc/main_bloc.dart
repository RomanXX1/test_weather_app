import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_weather/bloc/main_events.dart';
import 'package:test_app_weather/bloc/main_state.dart';
import 'package:test_app_weather/server/repository.dart';
import 'package:test_app_weather/server/weather_forecast.dart';

class MainBloc extends Bloc<MainEvent, MainStates> {
  final ObjRepository objRepository;
  MainBloc({this.objRepository}) : assert(objRepository != null);

  @override
  MainStates get initialState => MainWindowShowState();

  @override
  Stream<MainStates> mapEventToState(MainEvent event) async* {
    if (event is MainWindowShowEvent) {
      // Виджет - кнопка для загрузки данных
      yield MainWindowShowState();
    } else if (event is MainLoadDataEvent) {
      // Индикатор загрузки (если ошибка - по исключению виджет ошибка)
      yield MainLoadDataState();
      try {
        final WeatherForecast forecastObject = await objRepository.getWeather();
        if (forecastObject.list.length == 0) {
          yield MainNoDataState();
        } else {
          yield MainDataShowState(forecastObject: forecastObject);
        }
      } catch (_) {
        yield MainErrorLoadState();
      }
    } else if (event is MainErrorLoadEvent) {
      // можно обработать отображение ошибок тут
      yield MainErrorLoadState();
    } else if (event is MainNoDataEvent) {
      // Нет данных для отображения (но ошибки нет)
      yield MainNoDataState();
    }
  }
}
