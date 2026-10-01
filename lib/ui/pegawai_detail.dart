import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _item("NIP", widget.pegawai.nip),
          _item("Nama", widget.pegawai.nama),
          _item("Tanggal Lahir", widget.pegawai.tanggalLahir),
          _item("Nomor Telepon", widget.pegawai.nomorTelepon),
          _item("Email", widget.pegawai.email),
          _item("Password", widget.pegawai.password),
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