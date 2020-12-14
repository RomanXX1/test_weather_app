import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app_weather/bloc/main_bloc.dart';
import 'package:test_app_weather/bloc/main_events.dart';
import 'package:test_app_weather/bloc/main_state.dart';
import 'package:test_app_weather/utils/forecast_util.dart';
import 'package:test_app_weather/widgets/ios_widgets/forecast_card_ios.dart';

class MainDataShow_iOS extends StatelessWidget {
  MainDataShowState state;
  MainDataShow_iOS({this.state});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);

    var forecastList = state.forecastObject.list;
    var icon = forecastList[0].getIconURL();
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var description = forecastList[0].weather[0].description.toUpperCase();

    var pressure = forecastList[0].pressure * 0.750062;
    var humidity = forecastList[0].humidity;
    var wind = forecastList[0].speed;

    var city = state.forecastObject.city.name;
    var country = state.forecastObject.city.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);

    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$city, $country',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            Text(
              '${Util.getFormattedDate(formattedDate)}',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  icon,
                  scale: 0.6,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  children: [
                    Text(
                      '$temp ℃',
                      style: TextStyle(fontSize: 54.0),
                    ),
                    Text(
                      '$description',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
                    pressure.round(), 'mm Hg'),
                Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
                Util.getItem(FontAwesomeIcons.wind, wind.toInt(), 'm/s'),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 180,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemCount: state.forecastObject.list.length,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160,
                  child: forecastCard_iOS(state.forecastObject, index),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: CupertinoButton(
                child: Text(
                  "ОБНОВИТЬ",
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {
                  mainBloc.add(MainLoadDataEvent());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
