import 'package:flutter/material.dart';

class SimpleHomePage extends StatefulWidget {
  const SimpleHomePage({super.key, required this.title});
  final String title;

  @override
  State<SimpleHomePage> createState() => _SimpleHomePageState();
}

class _SimpleHomePageState extends State<SimpleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Gunakan Column sebagai pembungkus utama agar Logo ada di atas tombol
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Logo di bagian atas
            Image.asset(
              'assets/images/logo_kemendikbud.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 30), // Jarak antara logo dan tombol
            
            // 2. Row untuk menderetkan tombol secara horizontal
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => {}, child: Text('Lihat Jurnal')),
                SizedBox(width: 10), // Jarak antar tombol
                
                ElevatedButton(onPressed: () => {}, child: Text('Buat Jurnal')),
                SizedBox(width: 10),
                
                ElevatedButton(onPressed: () => {}, child: Text('Akun')),
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