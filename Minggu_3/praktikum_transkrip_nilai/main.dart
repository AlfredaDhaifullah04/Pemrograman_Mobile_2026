import 'dart:io';

import 'mata_kuliah.dart';

void main() {
  final transkrip = <MataKuliah>[
    MataKuliah('IF101', 'Algoritma', 3, 3.5),
    MataKuliah('IF102', 'Basis Data', 3, 4.0),
    MataKuliah('IF103', 'Pemrograman', 4, 3.0),
  ];

  while (true) {
    print('\n=== MENU TRANSKRIP NILAI ===');
    print('1. Hitung IPK');
    print('2. Filter Nilai Bagus (nilai >= 3.5)');
    print('3. Menampilkan Nilai Terformat');
    print('0. Keluar');
    stdout.write('Pilih opsi: ');

    final pilihan = stdin.readLineSync()?.trim();
    switch (pilihan) {
      case '1':
        print('\nIPK: ${hitungIpk(transkrip).toStringAsFixed(2)}');
      case '2':
        tampilkanNilaiBagus(transkrip);
      case '3':
        tampilkanNilaiTerformat(transkrip);
      case '0':
        print('Program selesai.');
        return;
      default:
        print('Opsi tidak valid. Silakan pilih 0, 1, 2, atau 3.');
    }
  }
}

double hitungIpk(List<MataKuliah> transkrip) {
  final totalBobot = transkrip
      .map((mataKuliah) => mataKuliah.nilai * mataKuliah.sks)
      .fold<double>(0, (total, bobot) => total + bobot);
  final totalSks = transkrip
      .map((mataKuliah) => mataKuliah.sks)
      .fold<int>(0, (total, sks) => total + sks);

  return totalSks == 0 ? 0 : totalBobot / totalSks;
}

void tampilkanNilaiBagus(List<MataKuliah> transkrip) {
  final nilaiBagus = transkrip.where((mataKuliah) => mataKuliah.nilai >= 3.5);

  print('\nMata kuliah dengan nilai bagus:');
  if (nilaiBagus.isEmpty) {
    print('Tidak ada mata kuliah dengan nilai bagus.');
    return;
  }

  nilaiBagus
      .map((mataKuliah) =>
          '${mataKuliah.kode} - ${mataKuliah.nama}: ${mataKuliah.nilai.toStringAsFixed(2)}')
      .forEach(print);
}

void tampilkanNilaiTerformat(List<MataKuliah> transkrip) {
  print('\nDaftar Nilai:');
  print('Kode  Nama                 SKS  Nilai');
  print('--------------------------------------');
  transkrip
      .map((mataKuliah) =>
          '${mataKuliah.kode.padRight(6)}'
          '${mataKuliah.nama.padRight(21)}'
          '${mataKuliah.sks.toString().padRight(5)}'
          '${mataKuliah.nilai.toStringAsFixed(2)}')
      .forEach(print);
}
