import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_weather/bloc/main_bloc.dart';
import 'package:test_app_weather/server/repository.dart';
import 'package:test_app_weather/widgets/main_widget.dart';

void main() {
  // Определим запускаемую операционную систему
  bool isAndroid = false;
  bool isIOS = false;

  if (Platform.isAndroid) {
    isAndroid = true;
  } else if (Platform.isIOS) {
    isIOS = true;
  }

  if (isAndroid) {
    runApp(MaterialApp(home: MasterApp(isAndroid: isAndroid, isIOS: isIOS)));
  } else if (isIOS) {
    runApp(CupertinoApp(
      home: MasterApp(
        isAndroid: isAndroid,
        isIOS: isIOS,
      ),
    ));
  }
}

class MasterApp extends StatelessWidget {
  bool isAndroid = false;
  bool isIOS = false;
  MasterApp({this.isAndroid, this.isIOS});

  final repository = ObjRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(objRepository: repository),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MainWidget(
          isAndroid: isAndroid,
          isIOS: isIOS,
        ),
      ),
    );
  }
}
