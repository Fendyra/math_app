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
        res = b != 0 ? a / b : 0;
        break;
    }

    setState(() {
      result = "Hasil: $res";
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: num1Controller,
                  decoration: InputDecoration(labelText: "Angka 1"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),
                TextField(
                  controller: num2Controller,
                  decoration: InputDecoration(labelText: "Angka 2"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () => calculate('+'),
                      child: Text("+"),
                    ),
                    ElevatedButton(
                      onPressed: () => calculate('-'),
                      child: Text("-"),
                    ),
                    ElevatedButton(
                      onPressed: () => calculate('*'),
                      child: Text("×"),
                    ),
                    ElevatedButton(
                      onPressed: () => calculate('/'),
                      child: Text("÷"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  result,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
