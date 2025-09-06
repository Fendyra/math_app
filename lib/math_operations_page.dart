import 'package:flutter/material.dart';

class MathOperationsPage extends StatefulWidget {
  @override
  _MathOperationsPageState createState() => _MathOperationsPageState();
}

class _MathOperationsPageState extends State<MathOperationsPage> {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();
  String result = '';

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
      result = res == double.infinity ? "Tidak bisa dibagi 0" : "Hasil: $res";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                  "Operasi Matematika",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
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
                    _buildOperationButton("×", Colors.green),
                    _buildOperationButton("÷", Colors.purple),
                  ],
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
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo.shade900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
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
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
