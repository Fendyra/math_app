import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MathOperationsPage extends StatefulWidget {
  @override
  _MathOperationsPageState createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  // Controller untuk input angka 1 dan 2.
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  // Variabel untuk menampilkan hasil perhitungan.
  String result = '';
  // List untuk menyimpan riwayat perhitungan.
  List<String> history = [];

  // Fungsi untuk memformat hasil: jika angka bulat, tampilkan sebagai integer,
  // jika desimal, tampilkan sebagai double.
  String formatNumber(double value) {
    // Mengecek apakah sisa bagi dengan 1 adalah 0 (artinya angka bulat).
    return (value % 1 == 0) ? value.toInt().toString() : value.toString();
  }

  // Fungsi utama untuk melakukan kalkulasi.
  void calculate(String operation) {
    // Mengambil dan mengubah teks dari controller menjadi double. Jika kosong, dianggap 0.
    double a = double.tryParse(num1Controller.text) ?? 0;
    double b = double.tryParse(num2Controller.text) ?? 0;
    double res = 0;

    // Switch case untuk menentukan operasi berdasarkan tombol yang ditekan.
    switch (operation) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '*':
        res = a * b;
        break;
      case '/':
        // Pengecekan pembagian dengan nol.
        res = b != 0 ? a / b : double.infinity;
        break;
    }

    // Mengupdate UI dengan hasil perhitungan.
    setState(() {
      // Jika hasil adalah tak terhingga (pembagian dengan nol).
      if (res == double.infinity) {
        result = "Tidak bisa dibagi 0";
      } else {
        // Memformat angka input dan hasil sebelum ditampilkan.
        String displayA = formatNumber(a);
        String displayB = formatNumber(b);
        String displayRes = formatNumber(res);

        // Menampilkan hasil dan menambahkan ke riwayat.
        result = "Hasil: $displayRes";
        history.insert(
          0,
          "$displayA $operation $displayB = $displayRes",
        ); // insert(0, ...) agar riwayat terbaru di atas.
      }
    });
  }

  // Fungsi untuk membersihkan semua input, hasil, dan riwayat.
  void clear() {
    setState(() {
      num1Controller.clear();
      num2Controller.clear();
      result = '';
      history.clear();
    });
  }

  // Metode build() untuk UI.
  @override
  Widget build(BuildContext context) {
    // ... (kode UI tidak diubah) ...
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Operasi Matematika",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Masukkan Angka",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: num1Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Angka 1",
                      prefixIcon: Icon(Icons.looks_one),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Angka 2",
                      prefixIcon: Icon(Icons.looks_two),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      // Membangun tombol-tombol operasi.
                      _buildOperationButton("+", Colors.indigo),
                      _buildOperationButton("-", Colors.deepOrange),
                      _buildOperationButton("*", Colors.green),
                      _buildOperationButton("/", Colors.purple),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: clear,
                    icon: Icon(Icons.clear),
                    label: Text("Clear"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Menampilkan hasil jika tidak kosong.
                  if (result.isNotEmpty)
                    Card(
                      color: Colors.indigo.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          result,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.indigo.shade900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  // Menampilkan riwayat jika tidak kosong.
                  if (history.isNotEmpty) ...[
                    SizedBox(height: 20),
                    Text(
                      "Riwayat Perhitungan",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    // Membangun list riwayat.
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.history, color: Colors.indigo),
                          title: Text(
                            history[index],
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget helper untuk membuat tombol operasi agar kode tidak berulang.
  Widget _buildOperationButton(String symbol, Color color) {
    return SizedBox(
      width: 70,
      height: 50,
      child: ElevatedButton(
        onPressed: () => calculate(
          symbol,
        ), // Memanggil fungsi calculate dengan simbol yang sesuai.
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          symbol,
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
