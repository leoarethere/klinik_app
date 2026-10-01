import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  // Data dummy, sementara. Nanti diganti dari API.
  final List<Pegawai> _listPegawai = [
    Pegawai(
      id: "1",
      nip: "P001",
      nama: "Budi Santoso",
      tanggalLahir: "1990-01-15",
      nomorTelepon: "081234567890",
      email: "budi@klinik.com",
      password: "12345",
    ),
    Pegawai(
      id: "2",
      nip: "P002",
      nama: "Siti Aminah",
      tanggalLahir: "1992-05-20",
      nomorTelepon: "081298765432",
      email: "siti@klinik.com",
      password: "12345",
    ),
    Pegawai(
      id: "3",
      nip: "P003",
      nama: "Andi Wijaya",
      tanggalLahir: "1988-11-02",
      nomorTelepon: "081377788899",
      email: "andi@klinik.com",
      password: "12345",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pegawai")),
      body: ListView.builder(
        itemCount: _listPegawai.length,
        itemBuilder: (context, index) {
          final pegawai = _listPegawai[index];
          return GestureDetector(
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(pegawai.nama),
                subtitle: Text("NIP: ${pegawai.nip}"),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai),
                ),
              );
            },
          );
        },
      ),
    );
  }
}