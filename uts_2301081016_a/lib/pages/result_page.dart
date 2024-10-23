import 'package:flutter/material.dart';
import '../models/warnet.dart';

class ResultPage extends StatelessWidget {
  final Warnet warnet;

  ResultPage({required this.warnet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Perhitungan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kode Transaksi: ${warnet.kodeTransaksi}"),
            SizedBox(height: 8),
            Text("Nama Pelanggan: ${warnet.namaPelanggan}"),
            SizedBox(height: 8),
            Text("Jenis Pelanggan: ${warnet.jenisPelanggan}"),
            SizedBox(height: 8),
            Text("Tanggal Masuk: ${warnet.tglMasuk}"),
            SizedBox(height: 8),
            Text(
                "Jam Masuk: ${warnet.formatJam(warnet.jamMasuk)}"), // Jam Masuk
            SizedBox(height: 8),
            Text(
                "Jam Keluar: ${warnet.formatJam(warnet.jamKeluar)}"), // Jam Keluar
            SizedBox(height: 8),

            Text("Total Bayar: Rp ${warnet.totalBayar().toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
