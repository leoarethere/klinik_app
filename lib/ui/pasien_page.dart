import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  final List<Pasien> _listPasien = [
    Pasien(
      id: "1",
      nomorRm: "RM001",
      nama: "Rina Marlina",
      tanggalLahir: "1995-03-10",
      nomorTelepon: "081211112222",
      alamat: "Jakarta Selatan",
    ),
    Pasien(
      id: "2",
      nomorRm: "RM002",
      nama: "Dedi Kurniawan",
      tanggalLahir: "1987-08-22",
      nomorTelepon: "081233334444",
      alamat: "Depok",
    ),
    Pasien(
      id: "3",
      nomorRm: "RM003",
      nama: "Maya Sari",
      tanggalLahir: "2000-12-01",
      nomorTelepon: "081255556666",
      alamat: "Bogor",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pasien")),
      body: ListView.builder(
        itemCount: _listPasien.length,
        itemBuilder: (context, index) {
          final pasien = _listPasien[index];
          return GestureDetector(
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.people),
                title: Text(pasien.nama),
                subtitle: Text("RM: ${pasien.nomorRm}"),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien),
                ),
              );
            },
          );
        },
      ),
    );
  }
}