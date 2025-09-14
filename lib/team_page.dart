import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Model Data untuk Anggota ---
// Kelas ini digunakan untuk menstrukturkan data setiap anggota.
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

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  // List yang berisi data-data anggota tim.
  // Data ini didefinisikan langsung di dalam kode (hardcoded).
  final List<Anggota> groupData = [
    Anggota(
      nama: "Zakinanda Faishal Arifin",
      nim: "124230023",
      peran: "Ketua",
      fotoUrl: "https://placehold.co/150x150/FF7043/FFFFFF?text=ZFA",
    ),
    Anggota(
      nama: "Hanif Afifudin",
      nim: "124230009",
      peran: "Anggota",
      fotoUrl: "https://placehold.co/150x150/7E57C2/FFFFFF?text=HA",
    ),
    Anggota(
      nama: "Fendyra Restu Dewangga",
      nim: "124230010",
      peran: "Anggota",
      fotoUrl: "https://placehold.co/150x150/42A5F5/FFFFFF?text=FRD",
    ),
    Anggota(
      nama: "Muhammad Faza Khayyuna",
      nim: "124230018",
      peran: "Anggota",
      fotoUrl: "https://placehold.co/150x150/66BB6A/FFFFFF?text=MFK",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Biodata Anggota Kelompok',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // ListView.builder digunakan untuk membuat daftar yang bisa di-scroll.
        // Ini lebih efisien daripada Column jika daftarnya panjang.
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          // Jumlah item dalam list sama dengan panjang data groupData.
          itemCount: groupData.length,
          // itemBuilder akan membangun widget untuk setiap item dalam data.
          itemBuilder: (context, index) {
            final anggota = groupData[index];
            // Mengembalikan widget AnggotaCard untuk setiap anggota.
            return AnggotaCard(anggota: anggota);
          },
        ),
      ),
    );
  }
}

// Widget kustom untuk menampilkan kartu data anggota.
class AnggotaCard extends StatelessWidget {
  final Anggota anggota;

  const AnggotaCard({super.key, required this.anggota});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 6,
      shadowColor: Colors.deepPurple.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.account_circle, size: 80, color: Colors.deepPurple),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    anggota.nama,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    anggota.nim,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Chip(
                    label: Text(
                      anggota.peran,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
