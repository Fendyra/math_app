import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OddEvenPage extends StatefulWidget {
  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  // Controller untuk input angka.
  final numberController = TextEditingController();
  // Variabel untuk menyimpan hasil pengecekan.
  String result = '';

  // Fungsi untuk mengecek angka ganjil/genap.
  void checkNumber() {
    // Mengambil teks dari controller dan mengubahnya menjadi integer.
    int num = int.tryParse(numberController.text) ?? 0;
    // Mengupdate UI.
    setState(() {
      // Logika utama: menggunakan operator modulus (%) untuk mengecek sisa bagi.
      // Jika sisa bagi 2 adalah 0, maka genap. Selain itu, ganjil.
      result = num % 2 == 0 ? "$num adalah Genap" : "$num adalah Ganjil";
    });
  }

  // Metode build() untuk UI.
  @override
  Widget build(BuildContext context) {
    // ... (kode UI tidak diubah) ...
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cek Ganjil Genap",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Card(
          elevation: 8,
          shadowColor: Colors.deepPurple.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Masukkan Angka",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    labelText: "Angka",
                    prefixIcon: Icon(
                      Icons.calculate_outlined,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed:
                      checkNumber, // Memanggil fungsi checkNumber saat ditekan.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    "Cek",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Menampilkan hasil jika tidak kosong.
                if (result.isNotEmpty)
                  Text(
                    result,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
