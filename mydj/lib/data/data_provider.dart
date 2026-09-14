import 'package:flutter/cupertino.dart';
import 'package:mydj/jurnal/jurnal.dart';
import 'package:mydj/data/login_info.dart';
import 'package:mydj/data/database_helper.dart';

class DataProvider extends ChangeNotifier {
  List<Jurnal> _jurnalTersimpan = [];
  // READ: ambil semua jurnal dari database
  Future<void> muatJurnal() async {
    final db = await DatabaseHelper.instance.database;
    final rows = await db.query('jurnal', orderBy: 'id DESC');
    _jurnalTersimpan = rows.map((row) => Jurnal.fromMap(row)).toList();
    notifyListeners();
  }

  // CREATE: simpan jurnal baru, lalu muat ulang daftarnya
  Future<void> tambahJurnal(Jurnal jurnal) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('jurnal', jurnal.toMap());
    await muatJurnal();
  }

  // DELETE: hapus jurnal berdasarkan id, lalu muat ulang daftarnya
  Future<void> hapusJurnal(int id) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('jurnal', where: 'id = ?', whereArgs: [id]);
    await muatJurnal();
  }

  List<Jurnal> get jurnalTersimpan {
    return List.unmodifiable(
      _jurnalTersimpan,
    ); // <-- Getter untuk membaca daftar jurnal
  }

  // Cek sudah login atau belum
  Future<bool> isLoggedIn() async {
    LoginInfo loginInfo = await LoginInfo.fromSharedPreferences();
    return loginInfo.isLoggedIn;
  }

  // Simpan informasi sesi ketika login
  Future<void> saveLoginInfo(String username, String password) async {
    LoginInfo loginInfo = await LoginInfo.fromSharedPreferences();
    // Isi
    loginInfo.username = username;
    loginInfo.password = password;
    loginInfo.isLoggedIn = true;
    // Simpan
    loginInfo.saveToSharedPreferences();
  }
}
