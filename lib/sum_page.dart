import 'package:flutter/material.dart';

class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  final numbersController = TextEditingController();
  String result = '';

  void calculateSum() {
    List<String> parts = numbersController.text.split(',');
    int sum = 0;
    for (var p in parts) {
      sum += int.tryParse(p.trim()) ?? 0;
    }
    setState(() {
      result = "Jumlah Total: $sum";
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
                  controller: numbersController,
                  decoration: InputDecoration(
                    labelText: "Masukkan angka (pisahkan dengan koma)",
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: calculateSum, child: Text("Hitung")),
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
