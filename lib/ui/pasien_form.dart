import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();

  // 5 controller sesuai 5 field Pasien
  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNomorRm(),
              _fieldNama(),
              _fieldTanggalLahir(),
              _fieldTelepon(),
              _fieldAlamat(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldNomorRm() => TextField(
        decoration: const InputDecoration(labelText: "Nomor RM"),
        controller: _nomorRmCtrl,
      );

  Widget _fieldNama() => TextField(
        decoration: const InputDecoration(labelText: "Nama"),
        controller: _namaCtrl,
      );

  Widget _fieldTanggalLahir() => TextField(
        decoration: const InputDecoration(labelText: "Tanggal Lahir (YYYY-MM-DD)"),
        controller: _tglLahirCtrl,
      );

  Widget _fieldTelepon() => TextField(
        decoration: const InputDecoration(labelText: "Nomor Telepon"),
        controller: _teleponCtrl,
        keyboardType: TextInputType.phone,
      );

  Widget _fieldAlamat() => TextField(
        decoration: const InputDecoration(labelText: "Alamat"),
        controller: _alamatCtrl,
        maxLines: 3,
      );

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pasien pasien = Pasien(
          nomorRm: _nomorRmCtrl.text,
          nama: _namaCtrl.text,
          tanggalLahir: _tglLahirCtrl.text,
          nomorTelepon: _teleponCtrl.text,
          alamat: _alamatCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PasienDetail(pasien: pasien),
          ),
        );
      },
      child: const Text("Simpan"),
    );
  }

  @override
  void dispose() {
    _nomorRmCtrl.dispose();
    _namaCtrl.dispose();
    _tglLahirCtrl.dispose();
    _teleponCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }
}