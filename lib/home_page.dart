import 'package:flutter/material.dart';
import 'math_operations_page.dart';
import 'odd_even_page.dart';
import 'sum_page.dart';
import 'team_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  HomePage({required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [TeamPage(), MathOperationsPage(), OddEvenPage(), SumPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang, ${widget.username}!"),
        centerTitle: true,
        elevation: 0,
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: "Team",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: "Hitung",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1_outlined),
            label: "Ganjil/Genap",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_outlined),
            label: "Jumlah",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
