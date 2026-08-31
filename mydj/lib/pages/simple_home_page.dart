import 'package:flutter/material.dart';
// Jangan lupa import file halaman tujuan jika dipisah filenya
// import 'lihat_jurnal_page.dart';
import 'package:mydj/pages/lihat_jurnal_page.dart';
import 'package:mydj/pages/buat_jurnal_page.dart';
import 'package:mydj/pages/akun_page.dart';

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});
  final String title;

  @override
  State<SimpleHomePage> createState() => _SimpleHomePageState();
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  void _openLihatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LihatJurnalPage(title: 'Lihat Jurnal'),
      ),
    );
  }

  void _openBuatJurnalPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BuatJurnalPage(title: 'Buat Jurnal'),
      ),
    );
  }
  
  void _openAkunPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AkunPage(title: 'Akun'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo_kemendikbud.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  // PERBAIKAN: Hapus kurung kurawal { }
                  onPressed: () => _openLihatJurnalPage(context),
                  child: Text('Lihat Jurnal'),
                ),
                ElevatedButton(
                  // PERBAIKAN: Hapus kurung kurawal { }
                  onPressed: () => _openBuatJurnalPage(context),
                  child: Text('Buat Jurnal'),
                ),
                SizedBox(width: 10),

                ElevatedButton(
                  // PERBAIKAN: Hapus kurung kurawal { }
                  onPressed: () => _openAkunPage(context),
                  child: Text('Akun'),
                ),
                SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () => {},
                  child: Text('Tentang aplikasi'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
