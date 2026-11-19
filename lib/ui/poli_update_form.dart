import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Isi form dengan data lama
    _namaPoliCtrl.text = widget.poli.namaPoli;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        // Buat objek Poli dengan data baru
        Poli poliBaru = Poli(
          id: widget.poli.id,                // pertahankan id
          namaPoli: _namaPoliCtrl.text,
        );

        // Tutup form ubah
        Navigator.pop(context);

        // Ganti Detail Poli lama dengan yang baru
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poliBaru)),
        );
      },
      child: const Text("Simpan Perubahan"),
    );
  }

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    super.dispose();
  }
}