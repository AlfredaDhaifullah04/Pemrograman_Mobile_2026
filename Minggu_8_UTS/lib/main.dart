import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulir Biodata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HalamanSatu(),
    );
  }
}

// ─────────────────────────────────────────────
// HALAMAN 1 — Form Biodata
// ─────────────────────────────────────────────
class HalamanSatu extends StatefulWidget {
  const HalamanSatu({super.key});

  @override
  State<HalamanSatu> createState() => _HalamanSatuState();
}

class _HalamanSatuState extends State<HalamanSatu> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _emailController = TextEditingController();

  String? _jenisKelamin;

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _lanjut() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HalamanDua(
            nama: _namaController.text.trim(),
            nim: _nimController.text.trim(),
            email: _emailController.text.trim(),
            jenisKelamin: _jenisKelamin!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Biodata'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Nama ──
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama lengkap wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ── NIM ──
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NIM wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ── Email ──
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // ── Jenis Kelamin ──
              DropdownButtonFormField<String>(
                value: _jenisKelamin,
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Laki-laki',
                    child: Text('Laki-laki'),
                  ),
                  DropdownMenuItem(
                    value: 'Perempuan',
                    child: Text('Perempuan'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _jenisKelamin = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jenis kelamin wajib dipilih';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 28),

              // ── Tombol Lanjut (satu-satunya tombol di halaman ini) ──
              ElevatedButton(
                onPressed: _lanjut,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Lanjut',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// HALAMAN 2 — Konfirmasi
// ─────────────────────────────────────────────
class HalamanDua extends StatelessWidget {
  final String nama;
  final String nim;
  final String email;
  final String jenisKelamin;

  const HalamanDua({
    super.key,
    required this.nama,
    required this.nim,
    required this.email,
    required this.jenisKelamin,
  });

  void _konfirmasi(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil dikirim'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Tampilan data dari halaman 1 ──
            Text('Nama Lengkap : $nama',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text('NIM          : $nim',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text('Email        : $email',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            Text('Jenis Kelamin: $jenisKelamin',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 32),

            // ── Tombol Konfirmasi ──
            ElevatedButton(
              onPressed: () => _konfirmasi(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Konfirmasi data saya dan kirim',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
