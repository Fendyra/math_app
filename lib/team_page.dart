// import 'package:flutter/material.dart';

// class TeamPage extends StatefulWidget {
//   const TeamPage({super.key});

//   @override
//   State<TeamPage> createState() => _TeamPageState();
// }

// class _TeamPageState extends State<TeamPage> {
//   final List<String> groupData = [
//     'Hanif Afifudin - 124230009',
//     'Fendyra Restu Dewangga - 124230010',
//     'Muhammad Faza Khayyuna - 124230018',
//     'Zakinanda Faishal Arifin - 124230023',
//   ];

import 'package:flutter/material.dart';

// --- Model Data untuk Anggota ---
// Model ini digunakan untuk menstrukturkan data setiap anggota agar lebih rapi.
class Anggota {
  final String nama;
  final String nim;
  final String peran;
  final String fotoUrl;

  Anggota({
    required this.nama,
    required this.nim,
    required this.peran,
    required this.fotoUrl,
  });
}

// --- Halaman Utama Biodata Anggota ---
// Ini adalah widget utama yang akan menampilkan daftar semua anggota.
class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

// --- Daftar Data Anggota ---
// Di sini Anda bisa memasukkan data anggota kelompok Anda.
// URL foto bisa diganti dengan URL gambar online atau path dari asset lokal.
class _TeamPageState extends State<TeamPage> {
  final List<Anggota> groupData = [
    Anggota(
      nama: "Hanif Afifudin",
      nim: "124230009",
      peran: "Anggota",
      fotoUrl: "https://placehold.co/100x100/7E57C2/FFFFFF?text=HA",
    ),
    Anggota(
      nama: "Fendyra Restu Dewangga",
      nim: "124230010",
      peran: "Anggota",
      fotoUrl: "https://placehold.co/100x100/42A5F5/FFFFFF?text=FRD",
    ),
    Anggota(
      nama: "Muhammad Faza Khayyuna",
      nim: "124230018",
      peran: "Anggota",
      fotoUrl: "https://placehold.co/100x100/66BB6A/FFFFFF?text=MFK",
    ),
    Anggota(
      nama: "Zakinanda Faishal Arifin",
      nim: "124230023",
      peran: "Anggota",
      fotoUrl: "https://placehold.co/100x100/FF7043/FFFFFF?text=ZFA",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar ---
      // Memberi judul pada halaman.
      appBar: AppBar(
        title: const Text(
          'Biodata Anggota Kelompok',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // --- Body ---
      // Menggunakan ListView untuk menampilkan daftar yang bisa di-scroll.
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: groupData.length,
          itemBuilder: (context, index) {
            final anggota = groupData[index];
            // Setiap item di daftar akan ditampilkan menggunakan widget AnggotaCard.
            return AnggotaCard(anggota: anggota);
          },
        ),
      ),
    );
  }
}

// --- Widget Kartu Anggota ---
// Widget kustom untuk menampilkan data satu anggota dalam bentuk kartu (Card).
// Desain ini terinspirasi dari UI modern dengan shadow dan sudut membulat.
class AnggotaCard extends StatelessWidget {
  final Anggota anggota;

  const AnggotaCard({super.key, required this.anggota});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 8, // Memberi efek bayangan yang lebih kuat
      shadowColor: Colors.teal.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // --- Foto Profil ---
            // Menggunakan CircleAvatar untuk menampilkan gambar profil.
            Icon(Icons.account_circle, size: 80, color: Colors.indigo),
            // CircleAvatar(
            //   radius: 35,
            //   backgroundImage: NetworkImage(anggota.fotoUrl),
            //   backgroundColor: Colors.teal.shade100,
            // ),
            const SizedBox(width: 15),
            // --- Informasi Teks ---
            // Expanded memastikan teks tidak overflow jika terlalu panjang.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Nama Anggota ---
                  Text(
                    anggota.nama,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // --- NIM Anggota ---
                  Text(
                    anggota.nim,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  // --- Peran Anggota ---
                  // Menggunakan Chip untuk memberi highlight pada peran.
                  Chip(
                    label: Text(
                      anggota.peran,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: Colors.teal.shade400,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
