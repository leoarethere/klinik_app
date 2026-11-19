import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();

  // 6 controller sesuai 6 field Pegawai
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNIP(),
              _fieldNama(),
              _fieldTanggalLahir(),
              _fieldTelepon(),
              _fieldEmail(),
              _fieldPassword(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldNIP() => TextField(
        decoration: const InputDecoration(labelText: "NIP"),
        controller: _nipCtrl,
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

  Widget _fieldEmail() => TextField(
        decoration: const InputDecoration(labelText: "Email"),
        controller: _emailCtrl,
        keyboardType: TextInputType.emailAddress,
      );

  Widget _fieldPassword() => TextField(
        decoration: const InputDecoration(labelText: "Password"),
        controller: _passwordCtrl,
        obscureText: true,
      );

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pegawai pegawai = Pegawai(
          nip: _nipCtrl.text,
          nama: _namaCtrl.text,
          tanggalLahir: _tglLahirCtrl.text,
          nomorTelepon: _teleponCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PegawaiDetail(pegawai: pegawai),
          ),
        );
      },
      child: const Text("Simpan"),
    );
  }

  @override
  void dispose() {
    _nipCtrl.dispose();
    _namaCtrl.dispose();
    _tglLahirCtrl.dispose();
    _teleponCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }
}