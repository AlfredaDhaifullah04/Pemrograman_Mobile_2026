import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});
  final String title;
  @override
  State<AkunPage> createState() {
    return _AkunPageState(); // Seperti biasa, baris ini masih error.
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text(title)),
  //     body: const Center(child: Text('Ini adalah halaman akun')),
  //   );
  // }
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ganti Sandi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2),
            SizedBox(height: 10),
            Text('Sandi Saat Ini'),
            SizedBox(height: 10),
            PasswordField(),
            Text('Sandi Baru'),
            SizedBox(height: 10),
            PasswordField(),
            Text('Konfirmasi Sandi BAru'),
            SizedBox(height: 10),
            PasswordField(),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity, // Lebar SizedBox akan maksimal.
              child: ElevatedButton(
                // ElevatedButton sebagai child dari SizedBox. Lebarnya akan mengikuti lebar parent-nya.
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 95, 44, 104), // Mengubah warna tombol menjadi ungu
                  foregroundColor: Colors
                      .white, // Mengubah warna teks menjadi putih agar terlihat jelas
                ),
                onPressed: () => {(context)},
                child: const Text('Simpan'),
              ),
            ),

            Text(
              'keluar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(thickness: 2),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity, // Lebar SizedBox akan maksimal.
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 95, 44, 104), // Mengubah warna tombol menjadi ungu
                  foregroundColor: Colors
                      .white, // Mengubah warna teks menjadi putih agar terlihat jelas
                ), // ElevatedButton sebagai child dari SizedBox. Lebarnya akan mengikuti lebar parent-nya.
                onPressed: () => {()},
                child: const Text('Keluar dari Aplikasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
