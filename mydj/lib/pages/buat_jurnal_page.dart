import 'package:flutter/material.dart';
import 'package:mydj/jurnal/jurnal.dart';
import 'package:provider/provider.dart';
import 'package:mydj/data/data_provider.dart';
import 'package:mydj/components/media_selector.dart';

class BuatJurnalPage extends StatefulWidget {
  final String title;
  const BuatJurnalPage({super.key, this.title = 'Buat Jurnal'});

  @override
  State<BuatJurnalPage> createState() => _BuatJurnalPageState();
}

class _BuatJurnalPageState extends State<BuatJurnalPage> {
  String kelas = '';
  String mapel = '';
  int jamKe = 0;
  String tujuanPembelajaran = '';
  String materiTopikPembelajaran = '';
  String kegiatanPembelajaran = '';
  String dimensiProfilPelajarPancasila = '';

  Future<void> _saveJurnal(BuildContext context) async {
    Jurnal jurnal = Jurnal(
      kelas: kelas,
      mapel: mapel,
      jam: jamKe,
      tujuanPembelajaran: tujuanPembelajaran,
      materiTopikPembelajaran: materiTopikPembelajaran,
      kegiatanPembelajaran: kegiatanPembelajaran,
      dimensiProfilPelajarPancasila: dimensiProfilPelajarPancasila,
    );
    DataProvider provider = context.read<DataProvider>();
    // Simpan ke SQLite lewat Provider
    await provider.tambahJurnal(jurnal);
    // BuildContext dipakai setelah operasi async, jadi harus dicek dulu
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Jurnal berhasil disimpan')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Kelas:'),
              const SizedBox(height: 10), // Jeda 10 jarak
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Kelas',
                ),
                onChanged: (value) => {
                  setState(() {
                    kelas = value;
                  }),
                },
              ),
              const SizedBox(height: 10),
              const Text('Nama Mapel:'),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Nama Mapel',
                ),
                onChanged: (value) => {
                  setState(() {
                    mapel = value;
                  }),
                },
              ),
              const SizedBox(height: 10),
              const Text('Jam ke-'),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(), // garis tepi
                  labelText: 'Pilih Jam',
                ),
                items: const [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(value: '3', child: Text('3')),
                  DropdownMenuItem(value: '4', child: Text('4')),
                  DropdownMenuItem(value: '5', child: Text('5')),
                  DropdownMenuItem(value: '6', child: Text('6')),
                  DropdownMenuItem(value: '7', child: Text('7')),
                  DropdownMenuItem(value: '8', child: Text('8')),
                ],
                onChanged: (value) => {
                  setState(() {
                    if (value != null) {
                      jamKe = int.parse(
                        value,
                      ); // Konversi String dari dropdown menjadi int
                    }
                  }),
                },
              ),
              const SizedBox(height: 10),
              _textArea('Tujuan Pembelajaran', 'Masukkan Tujuan Pembelajaran', (
                text,
              ) {
                tujuanPembelajaran = text;
              }),
              _textArea(
                'Materi/Topik Pembelajaran',
                'Masukkan Materi/Topik Pembelajaran',
                (text) {
                  materiTopikPembelajaran = text;
                },
              ),
              const SizedBox(height: 10),
              _textArea(
                'Kegiatan Pembelajaran',
                'Masukkan Kegiatan Pembelajaran',
                (text) {
                  kegiatanPembelajaran = text;
                },
              ),
              const SizedBox(height: 10),
              _textArea(
                'Dimensi Profil Pelajar Pancasila',
                'Tuliskan Dimensi Profil Pelajar Pancasila',
                (text) {
                  dimensiProfilPelajarPancasila = text;
                },
              ),
              SizedBox(height: 10),
              Text('Foto Kegiatan'),
              SizedBox(height: 10),
              MediaSelector(
                mediaType: MediaType.photo,
              ), // <-- MediaSelector untuk foto.
              SizedBox(height: 10),
              Text('Video Kegiatan'),
              SizedBox(height: 10),
              MediaSelector(
                mediaType: MediaType.video,
              ), // <-- MediaSelector untuk video.

              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity, // Lebar SizedBox akan maksimal.
                child: ElevatedButton(
                  // ElevatedButton sebagai child dari SizedBox. Lebarnya akan mengikuti lebar parent-nya.
                  onPressed: () => {_saveJurnal(context)},
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textArea(
    String label,
    String hint, [
    void Function(String text)? onChanged,
  ]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: hint,
          ),
          maxLines: 4,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
