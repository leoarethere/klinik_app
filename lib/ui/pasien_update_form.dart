import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();

  final _nomorRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _teleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nomorRmCtrl.text = widget.pasien.nomorRm;
    _namaCtrl.text = widget.pasien.nama;
    _tglLahirCtrl.text = widget.pasien.tanggalLahir;
    _teleponCtrl.text = widget.pasien.nomorTelepon;
    _alamatCtrl.text = widget.pasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pasien")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("Nomor RM", _nomorRmCtrl),
              _field("Nama", _namaCtrl),
              _field("Tanggal Lahir (YYYY-MM-DD)", _tglLahirCtrl),
              _field("Nomor Telepon", _teleponCtrl,
                  keyboard: TextInputType.phone),
              _field("Alamat", _alamatCtrl, maxLines: 3),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController ctrl,
      {int maxLines = 1, TextInputType? keyboard}) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: ctrl,
      maxLines: maxLines,
      keyboardType: keyboard,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pasien pasienBaru = Pasien(
          id: widget.pasien.id,
          nomorRm: _nomorRmCtrl.text,
          nama: _namaCtrl.text,
          tanggalLahir: _tglLahirCtrl.text,
          nomorTelepon: _teleponCtrl.text,
          alamat: _alamatCtrl.text,
        );

        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PasienDetail(pasien: pasienBaru),
          ),
        );
      },
      child: const Text("Simpan Perubahan"),
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