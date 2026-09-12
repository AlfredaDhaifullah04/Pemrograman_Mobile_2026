import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/data/login_info.dart';
import 'package:mydj/pages/login_page.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key, required this.title});
  final String title;
  @override
  State<AkunPage> createState() {
    return _AkunPageState();
  }
}

class _AkunPageState extends State<AkunPage> {
  void _openLoginPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  Future<void> _logout(BuildContext context) async {
    await LoginInfo.deleteFromSharedPreferences();
    if (context.mounted) {
      _openLoginPage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ganti Sandi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            const Text('Sandi Saat Ini'),
            const SizedBox(height: 10),
            const PasswordField(),
            const Text('Sandi Baru'),
            const SizedBox(height: 10),
            const PasswordField(),
            const Text('Konfirmasi Sandi Baru'),
            const SizedBox(height: 10),
            const PasswordField(),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity, // Lebar SizedBox akan maksimal.
              child: ElevatedButton(
                // ElevatedButton sebagai child dari SizedBox. Lebarnya akan mengikuti lebar parent-nya.
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    95,
                    44,
                    104,
                  ), // Mengubah warna tombol menjadi ungu
                  foregroundColor: Colors
                      .white, // Mengubah warna teks menjadi putih agar terlihat jelas
                ),
                onPressed: () {},
                child: const Text('Simpan'),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              'Keluar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity, // Lebar SizedBox akan maksimal.
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                    255,
                    95,
                    44,
                    104,
                  ), // Mengubah warna tombol menjadi ungu
                  foregroundColor: Colors
                      .white, // Mengubah warna teks menjadi putih agar terlihat jelas
                ),
                onPressed: () {
                  _logout(context); // untuk buat method logout
                },
                child: const Text('Keluar dari Aplikasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
