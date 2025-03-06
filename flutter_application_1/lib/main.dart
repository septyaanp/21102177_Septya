import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TOKOPEDIA"), backgroundColor: Colors.blue,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            Text("APLIKASI"),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(10.0),
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                crossAxisCount: 5,
                children: List.generate(20, (index){
                  return Card(
                    color: Colors.teal,
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                }),
              ))
          )
        ),
      ),
    );
  }
}
