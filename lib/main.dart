import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trial/home.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('aaa');
  box.put('name', ['hello', 'timing', 'car']);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
