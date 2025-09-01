import 'package:flutter/material.dart';

class OddEvenPage extends StatefulWidget {
  @override
  _OddEvenPageState createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  final numberController = TextEditingController();
  String result = '';

  void checkNumber() {
    int num = int.tryParse(numberController.text) ?? 0;
    setState(() {
      result = num % 2 == 0 ? "$num adalah Genap" : "$num adalah Ganjil";
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
                  controller: numberController,
                  decoration: InputDecoration(labelText: "Masukkan Angka"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: checkNumber, child: Text("Cek")),
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
