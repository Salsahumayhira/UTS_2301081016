import 'package:flutter/material.dart';
import '../models/warnet.dart';
import 'result_page.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController kodePelangganController = TextEditingController();
  TextEditingController namaPelangganController = TextEditingController();
  TextEditingController tglMasukController = TextEditingController();
  TextEditingController jamMasukController = TextEditingController();
  TextEditingController jamKeluarController = TextEditingController();
  String? jenisPelanggan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entry Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: kodePelangganController,
                decoration: InputDecoration(labelText: 'Kode Transaksi'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Kode pelanggan harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: namaPelangganController,
                decoration: InputDecoration(labelText: 'Nama Pelanggan'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama pelanggan harus diisi';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: jenisPelanggan,
                decoration: InputDecoration(labelText: 'Jenis Pelanggan'),
                items: <String>['VIP', 'GOLD']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    jenisPelanggan = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Jenis pelanggan harus dipilih';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: tglMasukController,
                decoration:
                    InputDecoration(labelText: 'Tanggal Masuk (DD/MM/YYYY)'),
              ),
              TextFormField(
                controller: jamMasukController,
                decoration: InputDecoration(labelText: 'Jam Masuk (HH:MM)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jam masuk harus diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: jamKeluarController,
                decoration: InputDecoration(labelText: 'Jam Keluar (HH:MM)'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Jam keluar harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    List<String> jamMasukParts =
                        jamMasukController.text.split(':');
                    List<String> jamKeluarParts =
                        jamKeluarController.text.split(':');
                    int jamMasuk = int.parse(jamMasukParts[0]) * 60 +
                        int.parse(jamMasukParts[1]);
                    int jamKeluar = int.parse(jamKeluarParts[0]) * 60 +
                        int.parse(jamKeluarParts[1]);

                    Warnet warnet = Warnet(
                      kodeTransaksi: kodePelangganController.text,
                      namaPelanggan: namaPelangganController.text,
                      jenisPelanggan: jenisPelanggan!,
                      tglMasuk: tglMasukController.text,
                      jamMasuk: jamMasuk,
                      jamKeluar: jamKeluar,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(warnet: warnet),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
