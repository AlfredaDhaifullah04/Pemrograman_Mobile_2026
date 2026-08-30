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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo_kemendikbud.png',
              width: 150,
              height: 150,
           ),
            ElevatedButton(onPressed: () => {}, child: Text('Lihat Jurnal')),
            SizedBox(width: 20),
            ElevatedButton(onPressed: () => {}, child: Text('Buat Jurnal')),
            SizedBox(width: 20),
            ElevatedButton(onPressed: () => {}, child: Text('Akun')),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => {},
              child: Text('Tentang aplikasi'),
            ),
          ],
        ),
      ),
    );
  }
}
