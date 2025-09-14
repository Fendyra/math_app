import 'package:flutter/material.dart';
import 'math_operations_page.dart';
import 'odd_even_page.dart';
import 'sum_page.dart';
import 'team_page.dart';

// HomePage adalah StatefulWidget karena state-nya (halaman yang aktif) bisa berubah.
class HomePage extends StatefulWidget {
  final String username; // Menerima data username dari halaman login.
  HomePage({required this.username});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // _currentIndex untuk melacak tab yang sedang aktif di BottomNavigationBar.
  int _currentIndex = 0;
  // List yang berisi semua halaman yang akan ditampilkan.
  late List<Widget> _pages;

  // initState() dipanggil sekali saat widget pertama kali dibuat.
  @override
  void initState() {
    super.initState();
    // Menginisialisasi daftar halaman.
    _pages = [TeamPage(), MathOperationsPage(), OddEvenPage(), SumPage()];
  }

  // Metode build() untuk merender UI.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // Menampilkan sapaan dengan username yang diterima.
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
      ),
      // Body akan menampilkan halaman dari list _pages sesuai dengan _currentIndex.
      // AnimatedSwitcher memberikan efek transisi fade saat berganti halaman.
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _pages[_currentIndex],
      ),
      // BottomNavigationBar untuk navigasi antar halaman.
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
            currentIndex: _currentIndex, // Mengatur item yang aktif.
            selectedItemColor: Colors.indigo,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
            unselectedLabelStyle: TextStyle(fontFamily: 'Poppins'),
            items: [
              // Daftar item navigasi.
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
            // Fungsi onTap akan dipanggil saat item navigasi ditekan.
            onTap: (index) {
              // Mengubah state _currentIndex sesuai dengan item yang dipilih.
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
