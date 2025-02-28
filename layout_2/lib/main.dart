import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Part 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo Layout Part 2'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final data = const [
  {"tgl": "02/03/2022", "nilai": "150"},
  {"tgl": "01/02/2022", "nilai": "180"},
  {"tgl": "12/01/2022", "nilai": "170"},
  {"tgl": "11/12/2021", "nilai": "110"},
  {"tgl": "10/11/2021", "nilai": "190"},
  {"tgl": "09/10/2021", "nilai": "190"},
  {"tgl": "08/09/2021", "nilai": "160"},
  {"tgl": "07/08/2021", "nilai": "155"},
  {"tgl": "06/07/2021", "nilai": "145"},
  {"tgl": "05/06/2021", "nilai": "140"},
];

@override
Widget build (BuildContext context){
  return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Text("Welcome,", style: TextStyle(
                        color: Color(0xFF7367F0),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.25)
                      ),
                      Text(
                        "21102177 - Septya Andini Putri",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF4b4b4b4b)),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person, size: 40),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
              decoration: BoxDecoration(
                gradient:
                const LinearGradient(colors: [Color(0xff4839eb), Color(0xff7367f0)]),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Status tes TOEFL Anda:',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text("LULUS", style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.25)
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          te
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),)),
  )
}
}
