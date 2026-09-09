import 'package:flutter/material.dart';
import 'package:mydj/components/password_field.dart';
import 'package:mydj/pages/simple_home_page.dart';

class LoginPage extends StatefulWidget {
  final String title = 'MyDJ - Welcome';
  const LoginPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String namaPengguna = ''; // <-- Nantinya digunakan untuk menyimpan username
  String sandi = '';

  void login(BuildContext context) {
    if (namaPengguna == '' && sandi == '') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SimpleHomePage(title: 'Dashboard'),
        ),
      );
    }
  } // <-- Yang ini digunakan untuk menyimpan password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/login.png',
                  width: 250,
                ), // <-- Menampilkan gambar login
                SizedBox(height: 30),
                Text('Nama pengguna'),
                SizedBox(height: 10),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Masukkan nama pengguna',
                  ),
                ),
                SizedBox(height: 10),
                Text('Sandi'),
                PasswordField(),
                SizedBox(height: 10),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      login(context); // <-- Fungsi dipanggil di sini
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
