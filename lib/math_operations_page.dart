import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MathOperationsPage extends StatefulWidget {
  @override
  _MathOperationsPageState createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String result = '';
  List<String> history = []; // untuk menyimpan riwayat perhitungan

  /// Fungsi untuk format hasil: kalau bulat -> int, kalau desimal -> double
  String formatNumber(double value) {
    return (value % 1 == 0) ? value.toInt().toString() : value.toString();
  }

  void calculate(String operation) {
    double a = double.tryParse(num1Controller.text) ?? 0;
    double b = double.tryParse(num2Controller.text) ?? 0;
    double res = 0;

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
        res = b != 0 ? a / b : double.infinity;
        break;
    }

    setState(() {
      if (res == double.infinity) {
        result = "Tidak bisa dibagi 0";
      } else {
        String displayA = formatNumber(a);
        String displayB = formatNumber(b);
        String displayRes = formatNumber(res);

        result = "Hasil: $displayRes";
        history.insert(0, "$displayA $operation $displayB = $displayRes");
      }
    });
  }

  void clear() {
    setState(() {
      num1Controller.clear();
      num2Controller.clear();
      result = '';
      history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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

  Widget _buildOperationButton(String symbol, Color color) {
    return SizedBox(
      width: 70,
      height: 50,
      child: ElevatedButton(
        onPressed: () => calculate(symbol),
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
