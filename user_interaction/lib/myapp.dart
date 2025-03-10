// Nama : Septya Andini Putri
// NIM  : 21102177
//Lanjutan Project dengan membuat route
//navigation untuk halaman baru
import 'package:flutter/material.dart';
import 'package:user_interaction/main.dart';
import 'package:user_interaction/myapp2.dart';

void main() {
  runApp(const MyApp3());
}

class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABP Minggu 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp3HomePage(title: 'ABP Minggu 3'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp3HomePage extends StatefulWidget {
  MyApp3HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyApp3HomePageState createState() => _MyApp3HomePageState();
}

class _MyApp3HomePageState extends State<MyApp3HomePage> {
  int selected = 0;
  PageController pc = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: pc,
          onPageChanged: (index) {
            setState(() {
              selected = index;
            });
          },
          children: [
            Center(
              child: InkWell(
                child: Text('Kembali Ke Halaman Utama',
                    style: TextStyle(
                        fontSize: 30, backgroundColor: Colors.blueAccent)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
              ),
            ),
            MyApp3_2(), //awalnya menampilkan email page, namun diubah menjadi myapp3_2 agar memanggil pagevie dari file myapp2
            Center(
              child: Text('Profile Page', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        currentIndex: selected,
        onTap: (index) {
          setState(() {
            selected = index;
          });
          pc.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            label: 'Email',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
