class Warnet {
  final String kodeTransaksi;
  final String namaPelanggan;
  final String jenisPelanggan;
  final String tglMasuk;
  final int jamMasuk;
  final int jamKeluar;

  Warnet({
    required this.kodeTransaksi,
    required this.namaPelanggan,
    required this.jenisPelanggan,
    required this.tglMasuk,
    required this.jamMasuk,
    required this.jamKeluar,
  });

  int get lama => jamKeluar - jamMasuk;

  double totalBayar() {
    double tarifPerJam = 5000.0;
    double diskon = 0.0;
    double totalBiaya = lama * tarifPerJam;

    if (jenisPelanggan == "VIP" && lama > 120) {
      diskon = 0.02 * totalBiaya;
    } else if (jenisPelanggan == "GOLD" && lama > 120) {
      diskon = 0.05 * totalBiaya;
    }

    return totalBiaya - diskon;
  }

  String formatJam(int menit) {
    int jam = menit ~/ 60;
    int menitSisa = menit % 60;
    return "${jam.toString().padLeft(2, '0')}:${menitSisa.toString().padLeft(2, '0')}";
  }
}
