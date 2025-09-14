import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  // Controller untuk input angka.
  final numbersController = TextEditingController();
  // Variabel untuk menyimpan hasil penjumlahan.
  String result = '';

  // Fungsi untuk menghitung total penjumlahan.
  void calculateSum() {
    // Memisahkan string input menjadi list berdasarkan koma.
    List<String> parts = numbersController.text.split(',');
    int sum = 0;
    // Melakukan iterasi pada setiap bagian string.
    for (var p in parts) {
      // Menambahkan angka ke total. trim() untuk menghapus spasi.
      // int.tryParse() akan mengembalikan null jika string tidak valid, ?? 0 akan menanganinya.
      sum += int.tryParse(p.trim()) ?? 0;
    }
    // Mengupdate UI dengan hasil.
    setState(() {
      result = "Jumlah Total: $sum";
    });
  }

  // Metode build() untuk UI.
  @override
  Widget build(BuildContext context) {
    // ... (kode UI tidak diubah) ...
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hitung Penjumlahan",
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
                  controller: numbersController,
                  style: GoogleFonts.poppins(),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Pisahkan dengan koma (misal: 2, 4, 6)",
                    prefixIcon: Icon(
                      Icons.format_list_numbered,
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
                      calculateSum, // Memanggil fungsi calculateSum saat ditekan.
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
                    "Hitung",
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
