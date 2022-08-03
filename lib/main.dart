
import 'package:commercial_app/screens/tab/tab_box.dart';
import 'package:flutter/material.dart';

void main() async{
// await StorageRepository.getInstance();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabBox(),
    );
  }
}

//flutter packages pub run build_runner build --delete-conflicting-outputs
