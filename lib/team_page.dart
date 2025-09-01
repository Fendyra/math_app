import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final List<String> groupData = [
    'Hanif Afifudin - 124230009',
    'Fendyra Restu Dewangga - 124230010',
    'Muhammad Faza Khayyuna - 124230018',
    'Zakinanda Faishal Arifin - 124230023',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Kelompok")),
      body: ListView.builder(
        itemCount: groupData.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(child: Text("${index + 1}")),
              title: Text(groupData[index]),
            ),
          );
        },
      ),
    );
  }
}
