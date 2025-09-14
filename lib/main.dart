import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';

// Fungsi main() adalah fungsi pertama yang dieksekusi saat aplikasi dijalankan.
void main() {
  // runApp() akan menjalankan aplikasi dengan widget yang diberikan, yaitu MyApp.
  runApp(const MyApp());
}

// MyApp adalah widget utama (root widget) dari aplikasi ini.
// Dibuat sebagai StatelessWidget karena kontennya tidak akan berubah seiring waktu.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Metode build() akan dipanggil oleh Flutter untuk merender tampilan.
  @override
  Widget build(BuildContext context) {
    // Menggunakan Google Fonts untuk tema teks dasar.
    final baseTextTheme = GoogleFonts.poppinsTextTheme();

    // MaterialApp adalah widget yang membungkus seluruh aplikasi,
    // menyediakan fungsionalitas dasar seperti routing, tema, dll.
    return MaterialApp(
      title: 'Math App', // Judul aplikasi yang muncul di task manager.
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug.
      theme: ThemeData(
        // Tema keseluruhan aplikasi.
        brightness: Brightness.light, // Menggunakan tema terang.
        primaryColor: Colors.deepPurple, // Warna utama aplikasi.
        scaffoldBackgroundColor:
            Colors.grey[100], // Warna latar belakang default.
        // --- Konfigurasi Tipografi ---
        textTheme: baseTextTheme, // Menggunakan tema teks dari Google Fonts.
        // --- Konfigurasi AppBar ---
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: baseTextTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),

        // --- Konfigurasi Input Field (TextField) ---
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.deepPurple.shade100),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(color: Colors.grey[700]),
        ),

        // --- Konfigurasi ElevatedButton ---
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: baseTextTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),

        // --- Konfigurasi Bottom Navigation ---
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.deepPurple,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: baseTextTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // Halaman pertama yang akan ditampilkan adalah LoginPage.
      home: LoginPage(),
    );
  }
}
