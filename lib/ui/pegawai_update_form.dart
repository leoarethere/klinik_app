import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();

  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Isi form dengan data lama
    _nipCtrl.text = widget.pegawai.nip;
    _namaCtrl.text = widget.pegawai.nama;
    _tglLahirCtrl.text = widget.pegawai.tanggalLahir;
    _teleponCtrl.text = widget.pegawai.nomorTelepon;
    _emailCtrl.text = widget.pegawai.email;
    _passwordCtrl.text = widget.pegawai.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("NIP", _nipCtrl),
              _field("Nama", _namaCtrl),
              _field("Tanggal Lahir (YYYY-MM-DD)", _tglLahirCtrl),
              _field("Nomor Telepon", _teleponCtrl,
                  keyboard: TextInputType.phone),
              _field("Email", _emailCtrl,
                  keyboard: TextInputType.emailAddress),
              _field("Password", _passwordCtrl, obscure: true),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController ctrl,
      {bool obscure = false, TextInputType? keyboard}) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: ctrl,
      obscureText: obscure,
      keyboardType: keyboard,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pegawai pegawaiBaru = Pegawai(
          id: widget.pegawai.id,
          nip: _nipCtrl.text,
          nama: _namaCtrl.text,
          tanggalLahir: _tglLahirCtrl.text,
          nomorTelepon: _teleponCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );

        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PegawaiDetail(pegawai: pegawaiBaru),
          ),
        );
      },
      child: const Text("Simpan Perubahan"),
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