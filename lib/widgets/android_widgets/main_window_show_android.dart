import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_weather/bloc/main_bloc.dart';
import 'package:test_app_weather/bloc/main_events.dart';

class MainWindowShow_Android extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Погода по текущей геолокации',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ButtonTheme(
                minWidth: size.width / 1.6,
                child: MaterialButton(
                  color: Colors.blue[50],
                  child: Text(
                    "ЗАПРОСИТЬ",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  elevation: 4.0,
                  onPressed: () {
                    mainBloc.add(MainLoadDataEvent());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
