import 'dart:io';

class Mahasiswa {
  String nama = "Anang";
  String? namaLengkap;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama default: $nama");
    print("Nama lengkap: ${namaLengkap ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

void main() {
  Mahasiswa mahasiswa = Mahasiswa();
  
  // Menampilkan data awal
  print("Data awal:");
  mahasiswa.tampilkanData();
  
  // Mengubah nama
  stdout.write("\nMasukkan nama baru: ");
  String? namaBaru = stdin.readLineSync();
  if (namaBaru != null && namaBaru.isNotEmpty) {
    mahasiswa.nama = namaBaru;
    print("Nama berhasil diubah.");
  } else {
    print("Nama tidak boleh kosong.");
  }
  
  // Input data lengkap
  print("\n=== Input Data Mahasiswa ===");
  
  print("Masukkan Nama Lengkap:");
  mahasiswa.namaLengkap = stdin.readLineSync();
  
  print("Masukkan NIM Mahasiswa:");
  String? inputNim = stdin.readLineSync();
  mahasiswa.nim = int.tryParse(inputNim ?? '');
  
  print("Masukkan Jurusan Mahasiswa:");
  mahasiswa.jurusan = stdin.readLineSync();
  
  // Menampilkan semua data
  print("\n=== Data Mahasiswa ===");
  mahasiswa.tampilkanData();
}