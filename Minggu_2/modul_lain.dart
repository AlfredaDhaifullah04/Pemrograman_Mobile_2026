void fungsiPercobaan6()
{
  print('==============');
  print('Ini modul lain');
  print('==============');
}

void fungsiPercobaanList()
{
  List<String> buah = ['Apel', 'Mangga', 'Pisang'];
  buah.add('Jeruk');
  print('Isi List: $buah');
  print('Buah pertama: ${buah[0]}');
  print('Jumlah buah: ${buah.length}');
  print('==============');
}

void fungsiPercobaanMap()
{
  Map<String, String> biodata =
  {
    'nama': 'Alpret',
    'jurusan': 'Teknologi Informasi',
  };
  biodata['asal'] = 'Kedungkandang';
  print('Biodata: $biodata');
  print('Nama: ${biodata['nama']}');
  print('==============');
}

void fungsiPercobaanSet() {
  Set<String> hobi = {'membaca', 'menulis', 'berenang'};
  hobi.add('gaming'); // tidak akan ditambahkan dua kali
  print('Hobi: $hobi');
  print('Jumlah hobi unik: ${hobi.length}');
  print('==============');
}