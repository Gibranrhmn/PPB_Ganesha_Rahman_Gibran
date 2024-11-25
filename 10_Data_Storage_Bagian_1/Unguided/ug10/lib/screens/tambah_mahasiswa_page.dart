import 'package:flutter/material.dart';
import '../helpers/db_helper.dart';
import '../models/mahasiswa.dart';

class TambahMahasiswaPage extends StatefulWidget {
  final Function onSaved;
  TambahMahasiswaPage(this.onSaved);

  @override
  _TambahMahasiswaPageState createState() => _TambahMahasiswaPageState();
}

class _TambahMahasiswaPageState extends State<TambahMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _alamatController = TextEditingController();
  final _hobiController = TextEditingController();

  Future<void> saveData() async {
    if (_formKey.currentState!.validate()) {
      Mahasiswa mahasiswa = Mahasiswa(
        nama: _namaController.text,
        nim: _nimController.text,
        alamat: _alamatController.text,
        hobi: _hobiController.text,
      );
      await DBHelper.insertMahasiswa(mahasiswa);
      widget.onSaved();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Biodata Mahasiswa'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama', prefixIcon: Icon(Icons.person)),
                validator: (value) => value!.isEmpty ? 'Nama wajib diisi' : null,
              ),
              TextFormField(
                controller: _nimController,
                decoration: InputDecoration(labelText: 'NIM', prefixIcon: Icon(Icons.numbers)),
                validator: (value) => value!.isEmpty ? 'NIM wajib diisi' : null,
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat', prefixIcon: Icon(Icons.home)),
                validator: (value) => value!.isEmpty ? 'Alamat wajib diisi' : null,
              ),
              TextFormField(
                controller: _hobiController,
                decoration: InputDecoration(labelText: 'Hobi', prefixIcon: Icon(Icons.star)),
                validator: (value) => value!.isEmpty ? 'Hobi wajib diisi' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveData,
                child: Text('Simpan'),
                style: ElevatedButton.styleFrom(backgroundColor:  Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
