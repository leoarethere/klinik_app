import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pasien")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _item("Nomor RM", widget.pasien.nomorRm),
          _item("Nama", widget.pasien.nama),
          _item("Tanggal Lahir", widget.pasien.tanggalLahir),
          _item("Nomor Telepon", widget.pasien.nomorTelepon),
          _item("Alamat", widget.pasien.alamat),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Ubah"),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Hapus"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _item(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}