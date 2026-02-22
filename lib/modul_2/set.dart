import 'dart:io';

void main() {
  // DEMO SET AWAL (Burung)
  print('=== DEMO SET BURUNG ===');
  Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
  print('Burung awal: $burung');
  
  // Tambah data
  burung.add('Gagak');
  print('✓ Setelah ditambah Gagak: $burung');
  
  // Tambah data duplicate (tidak akan masuk)
  bool berhasil = burung.add('Merpati');
  if (!berhasil) {
    print('⚠ Data "Merpati" sudah ada (duplicate tidak diterima)');
  }
  
  // Hapus data
  burung.remove('Elang');
  print('✓ Setelah dihapus Elang: $burung');
  
  // Cek data tertentu
  print('✓ Cek "Kakatua": ${burung.contains('Kakatua') ? 'Ada' : 'Tidak ada'}');
  print('✓ Cek "Elang": ${burung.contains('Elang') ? 'Ada' : 'Tidak ada'}');
  
  // Hitung jumlah data
  print('✓ Jumlah data: ${burung.length}');
  
  print('\n=====================================\n');
  
  // PROGRAM INTERAKTIF SESUAI CONTOH
  print('=== PROGRAM SET INTERAKTIF ===');
  
  // Data awal sesuai contoh
  Set<String> dataSet = {'a', 'b', 'c', 'd', 'e'};
  
  // Tampilkan semua data
  print('\n=== SEMUA DATA ===');
  int index = 1;
  for (String item in dataSet) {
    print('$index. $item');
    index++;
  }
  print('Total data: ${dataSet.length}');
  
  // Tambah data baru
  stdout.write('\nMasukkan data baru: ');
  String dataBaru = stdin.readLineSync()!;
  
  if (dataSet.add(dataBaru)) {
    print('Data "$dataBaru" berhasil ditambahkan!');
  } else {
    print('Data "$dataBaru" sudah ada di Set!');
  }
  
  // Hapus data
  stdout.write('Masukkan data yang ingin dihapus: ');
  String hapusData = stdin.readLineSync()!;
  
  if (dataSet.remove(hapusData)) {
    print('Data "$hapusData" berhasil dihapus!');
  } else {
    print('Data "$hapusData" tidak ditemukan!');
  }
  
  // Cek data
  stdout.write('Masukkan data yang ingin dicek: ');
  String cekData = stdin.readLineSync()!;
  
  if (dataSet.contains(cekData)) {
    print('Data "$cekData" ada di Set!');
  } else {
    print('Data "$cekData" tidak ada di Set!');
  }
  
  // Tampilkan data akhir
  print('\n=== DATA AKHIR ===');
  index = 1;
  for (String item in dataSet) {
    print('$index. $item');
    index++;
  }
  print('Total data: ${dataSet.length}');
}