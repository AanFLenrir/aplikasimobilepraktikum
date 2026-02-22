import 'dart:io';

void main() {
  // Bagian 1: Demonstrasi List Dasar
  print('=== BAGIAN 1: DEMO LIST DASAR ===');
  List<String> names = ['Alfa', 'beta', 'Charlie'];
  print('Names Awal: $names');

  names.add('Delta');
  print('Setelah ditambahkan: $names');

  print('Elemen pertama: ${names[0]}');

  names[1] = 'Bravo';
  print('Setelah diubah index 1: $names');

  names.remove('Charlie');
  print('Setelah dihapus "Charlie": $names');

  print('Jumlah data: ${names.length}');
  
  print('\nIterasi elemen:');
  for (String item in names) {
    print('- $item');
  }
  
  print('\n=====================================\n');

  // Bagian 2: Input Dinamis dari Pengguna
  print('=== BAGIAN 2: INPUT DATA LIST ===');
  List<String> dataList = [];
  int count = 0;

  // Validasi Input Jumlah List
  while (count <= 0) {
    stdout.write('Masukkan jumlah list yang ingin dibuat: ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Harap masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print('Input tidak valid! Harap masukkan angka.');
    }
  }

  // Mengisi list berdasarkan input pengguna
  for (int i = 0; i < count; i++) {
    stdout.write('Masukkan data ke-${i + 1}: ');
    String? x = stdin.readLineSync();
    dataList.add(x ?? '');
  }

  // Menampilkan hasil akhir input
  print('\n--- Data List yang Anda Input ---');
  print(dataList);
  
  print('\n=====================================\n');

  // Bagian 3: Operasi Berdasarkan Index (PERMINTAAN BAGIAN m)
  print('=== BAGIAN 3: OPERASI BERDASARKAN INDEX ===');
  
  bool lanjut = true;
  
  while (lanjut) {
    print('\n--- MENU OPERASI LIST ---');
    print('1. Tampilkan semua data');
    print('2. Tampil data berdasarkan index');
    print('3. Ubah data berdasarkan index');
    print('4. Hapus data berdasarkan index');
    print('5. Tampilkan hasil akhir');
    print('6. Selesai');
    stdout.write('Pilih menu (1-6): ');
    
    String? pilihan = stdin.readLineSync();
    print('');
    
    switch (pilihan) {
      case '1':
        // Tampilkan semua data
        tampilkanSemuaData(dataList);
        break;
        
      case '2':
        // Tampil berdasarkan index tertentu
        if (dataList.isEmpty) {
          print('List kosong!');
          break;
        }
        
        stdout.write('Masukkan index yang ingin ditampilkan (0-${dataList.length - 1}): ');
        int index = int.parse(stdin.readLineSync()!);
        
        if (index >= 0 && index < dataList.length) {
          print('Data pada index $index: ${dataList[index]}');
        } else {
          print('Index tidak valid!');
        }
        break;
        
      case '3':
        // Ubah berdasarkan index tertentu
        if (dataList.isEmpty) {
          print('List kosong!');
          break;
        }
        
        stdout.write('Masukkan index yang ingin diubah (0-${dataList.length - 1}): ');
        int index = int.parse(stdin.readLineSync()!);
        
        if (index >= 0 && index < dataList.length) {
          stdout.write('Masukkan data baru: ');
          String dataBaru = stdin.readLineSync()!;
          dataList[index] = dataBaru;
          print('Data pada index $index berhasil diubah menjadi "$dataBaru"');
        } else {
          print('Index tidak valid!');
        }
        break;
        
      case '4':
        // Hapus berdasarkan index tertentu
        if (dataList.isEmpty) {
          print('List kosong!');
          break;
        }
        
        stdout.write('Masukkan index yang ingin dihapus (0-${dataList.length - 1}): ');
        int index = int.parse(stdin.readLineSync()!);
        
        if (index >= 0 && index < dataList.length) {
          String dataTerhapus = dataList[index];
          dataList.removeAt(index);
          print('Data "$dataTerhapus" pada index $index berhasil dihapus');
        } else {
          print('Index tidak valid!');
        }
        break;
        
      case '5':
        // Tampilkan hasil akhir (seperti contoh)
        print('\n=== SEMUA DATA ===');
        if (dataList.isEmpty) {
          print('List kosong!');
        } else {
          for (int i = 0; i < dataList.length; i++) {
            print('Index $i: ${dataList[i]}');
          }
        }
        break;
        
      case '6':
        lanjut = false;
        print('Terima kasih!');
        break;
        
      default:
        print('Pilihan tidak valid!');
    }
  }
  
  // Tampilkan hasil akhir sekali lagi (opsional)
  print('\n=== HASIL AKHIR LIST ===');
  if (dataList.isEmpty) {
    print('List kosong!');
  } else {
    for (int i = 0; i < dataList.length; i++) {
      print('Index $i: ${dataList[i]}');
    }
  }
}

// Fungsi bantuan untuk menampilkan semua data
void tampilkanSemuaData(List<String> list) {
  if (list.isEmpty) {
    print('List kosong!');
    return;
  }
  
  print('\n--- SEMUA DATA ---');
  for (int i = 0; i < list.length; i++) {
    print('Index $i: ${list[i]}');
  }
  print('Total data: ${list.length}');
}