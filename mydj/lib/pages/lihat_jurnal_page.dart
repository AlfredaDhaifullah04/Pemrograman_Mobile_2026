import 'package:flutter/material.dart';
import 'package:mydj/jurnal/jurnal.dart';

class LihatJurnalPage extends StatefulWidget {
  const LihatJurnalPage({super.key});
  final String title = 'Lihat Jurnal';
  @override
  State<LihatJurnalPage> createState() {
    return _LihatJurnalPageState();
  }
}

class _LihatJurnalPageState extends State<LihatJurnalPage> {
  @override
  Widget build(BuildContext context) {
    final List<Jurnal> daftarJurnal = [
      Jurnal(kelas: '3A', mapel: 'Bahasa Indonesia'),
      Jurnal(kelas: '2A', mapel: 'IPA'),
      Jurnal(kelas: '4B', mapel: 'IPS'),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Text(daftarJurnal[index].kelas),
                  subtitle: Text(daftarJurnal[index].mapel),
                  trailing: Text(daftarJurnal[index].createdAt.toString()),
                  onTap: () {},
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: daftarJurnal.length, // Jumlah baris kita set manual dulu..
              ),
            ),
          ],
        ),
      ),
    );
  }
}
