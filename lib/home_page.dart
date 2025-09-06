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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Halo, ${widget.username}",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.indigo,
        elevation: 4,
        // shape: RoundedRectangleBorder(
        // borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        // ),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.indigo,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
            unselectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.group_outlined),
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
        ),
      ),
    );
  }
}
