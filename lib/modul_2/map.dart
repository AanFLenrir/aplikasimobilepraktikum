import 'dart:io';

void main() {
  // Bagian 1: Demo Map sederhana
  demoMapSederhana();
  
  // Bagian 2: Operasi Map lengkap
  demoOperasiMap();
  
  // Bagian 3: Input data mahasiswa
  inputDataMahasiswa();
}

void demoMapSederhana() {
  print('=== DEMO MAP SEDERHANA ===');
  
  Map<String, String> data = {
    'Anang': '081234567890',
    'Arman': '082345678901',
    'Doni': '083456789012',
  };

  print('Data awal: $data');

  // Menambahkan data ke Map
  data['Rio'] = '084567890123';
  print('Data setelah ditambahkan: $data');

  // Mengakses data berdasarkan key
  print('Nomor Anang: ${data['Anang']}');
  print('');
}

void demoOperasiMap() {
  print('=== DEMO OPERASI MAP ===');
  
  Map<String, String> data = {
    'Anang': '081234567890',
    'Arman': '082345678901',
    'Doni': '083456789012',
  };
  
  print('Data awal: $data');
  
  // 1. UBAH DATA (UPDATE)
  data['Anang'] = '087654321098';
  print('1. Setelah diubah (Anang): $data');
  
  // 2. HAPUS DATA
  data.remove('Arman');
  print('2. Setelah dihapus (Arman): $data');
  
  // 3. CEK DATA BERDASARKAN KEY
  print('3. Cek key "Doni": ${data.containsKey('Doni')}');
  print('   Cek key "Budi": ${data.containsKey('Budi')}');
  
  // 4. HITUNG JUMLAH DATA
  print('4. Jumlah data: ${data.length}');
  
  // 5. TAMPILKAN SEMUA KEY
  print('5. Semua key: ${data.keys}');
  
  // 6. TAMPILKAN SEMUA VALUE
  print('6. Semua value: ${data.values}');
  
  print('');
}

void inputDataMahasiswa() {
  print('=== INPUT DATA MAHASISWA (SINGLE) ===');
  
  // INPUT SINGLE
  stdout.write('Masukkan NIM: ');
  String nim = stdin.readLineSync()!;
  
  stdout.write('Masukkan Nama: ');
  String nama = stdin.readLineSync()!;
  
  stdout.write('Masukkan Jurusan: ');
  String jurusan = stdin.readLineSync()!;
  
  stdout.write('Masukkan IPK: ');
  double ipk = double.parse(stdin.readLineSync()!);
  
  Map<String, dynamic> mahasiswa = {
    'nim': nim,
    'nama': nama,
    'jurusan': jurusan,
    'ipk': ipk,
  };
  
  print('\nData Mahasiswa: $mahasiswa');
  print('');
  
  // INPUT MULTIPLE
  print('=== INPUT MULTIPLE MAHASISWA ===');
  
  stdout.write('Masukkan jumlah mahasiswa: ');
  int jumlah = int.parse(stdin.readLineSync()!);
  
  List<Map<String, dynamic>> daftarMahasiswa = [];
  
  for (int i = 0; i < jumlah; i++) {
    print('\n--- Mahasiswa ke-${i + 1} ---');
    
    stdout.write('Masukkan NIM: ');
    String nimMhs = stdin.readLineSync()!;
    
    stdout.write('Masukkan Nama: ');
    String namaMhs = stdin.readLineSync()!;
    
    stdout.write('Masukkan Jurusan: ');
    String jurusanMhs = stdin.readLineSync()!;
    
    stdout.write('Masukkan IPK: ');
    double ipkMhs = double.parse(stdin.readLineSync()!);
    
    daftarMahasiswa.add({
      'nim': nimMhs,
      'nama': namaMhs,
      'jurusan': jurusanMhs,
      'ipk': ipkMhs,
    });
  }
  
  // TAMPILKAN SEMUA DATA
  print('\n=== DAFTAR MAHASISWA ===');
  for (var i = 0; i < daftarMahasiswa.length; i++) {
    print('\nMahasiswa ke-${i + 1}:');
    print('NIM     : ${daftarMahasiswa[i]['nim']}');
    print('Nama    : ${daftarMahasiswa[i]['nama']}');
    print('Jurusan : ${daftarMahasiswa[i]['jurusan']}');
    print('IPK     : ${daftarMahasiswa[i]['ipk']}');
  }
}