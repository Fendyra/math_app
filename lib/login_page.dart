import 'package:flutter/material.dart';
import 'home_page.dart';

// LoginPage adalah StatefulWidget karena state-nya (seperti pesan error) bisa berubah.
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk mengambil teks dari input field username dan password.
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  // Variabel untuk menyimpan pesan error jika login gagal.
  String errorMessage = '';

  // Data dummy untuk username dan password.
  final Map<String, String> userData = {'Admin': '12345', 'Zakinanda': '12345'};

  // Fungsi untuk mengecek apakah username dan password valid.
  bool checkLogin(String username, String password) {
    // Mengecek apakah username ada di dalam map dan password-nya cocok.
    return userData.containsKey(username) && userData[username] == password;
  }

  // Fungsi yang dipanggil saat tombol login ditekan.
  void _login() {
    // Memanggil fungsi checkLogin dengan input dari controller.
    bool isLoginIn = checkLogin(
      _usernameController.text,
      _passwordController.text,
    );

    // Jika login berhasil
    if (isLoginIn) {
      // Navigasi ke HomePage dan mengganti halaman saat ini (agar tidak bisa kembali ke login).
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          // Mengirim username ke HomePage.
          builder: (context) => HomePage(username: _usernameController.text),
        ),
      );
    } else {
      // Jika login gagal, update state untuk menampilkan pesan error.
      setState(() {
        errorMessage = 'Username atau Password salah!';
      });
    }
  }

  // Metode build() untuk merender UI halaman login.
  @override
  Widget build(BuildContext context) {
    // ... (kode UI tidak diubah, hanya logika yang diberi komentar) ...
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Padding(
                padding: EdgeInsets.all(28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.school, size: 80, color: Colors.indigo),
                    SizedBox(height: 16),
                    Text(
                      "Math App",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.indigo.shade700,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Silakan login untuk melanjutkan",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 26),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(fontFamily: 'Poppins'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontFamily: 'Poppins'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    // Menampilkan pesan error jika tidak kosong.
                    if (errorMessage.isNotEmpty) ...[
                      SizedBox(height: 12),
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed:
                            _login, // Memanggil fungsi _login saat ditekan.
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
