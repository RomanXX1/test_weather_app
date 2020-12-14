import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_weather/bloc/main_bloc.dart';
import 'package:test_app_weather/bloc/main_state.dart';
import 'package:test_app_weather/widgets/android_widgets/main_data_show_android.dart';
import 'package:test_app_weather/widgets/android_widgets/main_error_load_android.dart';
import 'package:test_app_weather/widgets/android_widgets/main_load_data_android.dart';
import 'package:test_app_weather/widgets/android_widgets/main_no_data_android.dart';
import 'package:test_app_weather/widgets/android_widgets/main_window_show_android.dart';
import 'package:test_app_weather/widgets/ios_widgets/main_data_show_ios.dart';
import 'package:test_app_weather/widgets/ios_widgets/main_error_load_ios.dart';
import 'package:test_app_weather/widgets/ios_widgets/main_load_data_ios.dart';
import 'package:test_app_weather/widgets/ios_widgets/main_no_data_ios.dart';
import 'package:test_app_weather/widgets/ios_widgets/main_window_show_ios.dart';

class MainWidget extends StatelessWidget {
  bool isAndroid;
  bool isIOS;
  MainWidget({this.isAndroid, this.isIOS});

  @override
  Widget build(BuildContext context) {
    if (isAndroid) {
      return MainWidgetAndroid();
    } else if (isIOS) {
      return MainWidgetIOS();
    }
  }
}

Widget MainWidgetAndroid() {
  return BlocBuilder<MainBloc, MainStates>(
    builder: (context, state) {
      if (state is MainWindowShowState) {
        return MainWindowShow_Android();
      } else if (state is MainLoadDataState) {
        return MainLoadData_Android();
      } else if (state is MainDataShowState) {
        return MainDataShow_Android(state: state);
      } else if (state is MainErrorLoadState) {
        return MainErrorLoad_Android();
      } else if (state is MainNoDataState) {
        return MainNoData_Android();
      }
      return MainWindowShow_Android();
    },
  );
}

Widget MainWidgetIOS() {
  return BlocBuilder<MainBloc, MainStates>(
    builder: (context, state) {
      if (state is MainWindowShowState) {
        return MainWindowShow_iOS();
      } else if (state is MainLoadDataState) {
        return MainLoadData_iOS();
      } else if (state is MainDataShowState) {
        return MainDataShow_iOS(state: state);
      } else if (state is MainErrorLoadState) {
        return MainErrorLoad_iOS();
      } else if (state is MainNoDataState) {
        return MainNoData_iOS();
      }
      return Text('Error');
    },
  );
}
