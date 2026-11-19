import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  // (1) Kunci form, untuk validasi nanti
  final _formKey = GlobalKey<FormState>();

  // (2) Controller untuk menampung input user
  final _namaPoliCtrl = TextEditingController();

  // (3) Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),          // (4) field input
              const SizedBox(height: 20), // jarak
              _tombolSimpan(),            // (5) tombol simpan
            ],
          ),
        ),
      ),
    );
  }

  // (4) Method untuk TextField
  Widget _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,   // pasangkan controller
    );
  }

  // (5) Method untuk tombol simpan
  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        // Buat objek Poli dari input user
        Poli poli = Poli(namaPoli: _namaPoliCtrl.text);

        // Ganti halaman form dengan halaman detail
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
        );
      },
      child: const Text("Simpan"),
    );
  }

  // (6) Bersihkan controller saat widget dihapus
  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }
}