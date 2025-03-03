import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('21102177Septya Andini Putri')),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('We move under cover and we move as one'),
              Text('Through the night, we have one shot to live another day'),
              Text('We cannot let a stray gunshot give us away'),
              Text('We will fight up close, seize the moment and stay in it'),
              Text('It’s either that or meet the business end of a bayonet'),
              Text('The code word is ‘Rochambeau,’ dig me?'),
              Text('Rochambeau!', style: TextStyle(fontSize: 40)),
            ],
          ),
        ),
      ),
    );
  }
}
