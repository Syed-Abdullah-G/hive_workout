import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box('aaa');
  int sum = 0;
  void counter() {
    setState(() {
      sum++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<List<String>>(
                future: Future.value(Hive.box('aaa').get('name')),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  // display a loading indicator while waiting
                  return const CircularProgressIndicator();
                },
              ),
              SizedBox(
                width: 100,
              ),
              FloatingActionButton(
                tooltip: 'Increment',
                onPressed: counter,
                child: Icon(Icons.add),
              ),
              SizedBox(
                width: 100,
              ),
              Text("${sum.toString()}"),
              SizedBox(
                width: 100,
              ),
              Text(
                box.get('name') != null && sum < box.get('name').length
                    ? box.get('name')[sum].toString()
                    : 'Error',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
