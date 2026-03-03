// HAPUS import 'dart:io'; karena tidak digunakan

// Mixin 1: Penelitian
mixin Penelitian {
  String? bidangPenelitian;
  int? jumlahPenelitian = 0;
  
  void melakukanPenelitian() {
    String bidang = bidangPenelitian ?? 'bidang penelitian';
    print("Sedang melakukan penelitian di bidang $bidang");
  }
  
  void tambahPenelitian() {
    jumlahPenelitian = (jumlahPenelitian ?? 0) + 1;
    print("Jumlah penelitian sekarang: $jumlahPenelitian");
  }
}

// Mixin 2: Pengajaran
mixin Pengajaran {
  String? mataKuliahDiajar;
  int? jumlahJamMengajar = 0;
  
  void mengajar() {
    String mk = mataKuliahDiajar ?? 'mata kuliah';
    print("Sedang mengajar mata kuliah $mk");
  }
  
  void tambahJamMengajar(int jam) {
    jumlahJamMengajar = (jumlahJamMengajar ?? 0) + jam;
    print("Total jam mengajar: $jumlahJamMengajar jam");
  }
}

// Mixin 3: Organisasi
mixin Organisasi {
  String? namaOrganisasi;
  String? jabatanOrganisasi;
  
  void rapatOrganisasi() {
    String organisasi = namaOrganisasi ?? 'organisasi';
    String jabatan = jabatanOrganisasi ?? 'jabatan';
    print("Sedang rapat organisasi $organisasi sebagai $jabatan");
  }
  
  void tampilkanJabatan() {
    String organisasi = namaOrganisasi ?? 'organisasi';
    String jabatan = jabatanOrganisasi ?? 'jabatan';
    print("Jabatan di $organisasi: $jabatan");
  }
}

// Class Dasar Mahasiswa
class Mahasiswa {
  String? nama;
  int? nim;
  
  Mahasiswa({this.nama, this.nim});
  
  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
  }
}

// Class Dosen dengan Mixin
class Dosen extends Mahasiswa with Penelitian, Pengajaran, Organisasi {
  String? nidn;
  String? pangkat;
  
  Dosen({
    String? nama,
    int? nim,
    this.nidn,
    this.pangkat,
  }) : super(nama: nama, nim: nim);
  
  void tampilkanDataDosen() {
    print("\n=== DATA DOSEN ===");
    super.tampilkanData();
    print("NIDN: ${nidn ?? 'Belum diisi'}");
    print("Pangkat: ${pangkat ?? 'Belum diisi'}");
    print("Bidang Penelitian: ${bidangPenelitian ?? 'Belum diisi'}");
    print("Mata Kuliah Diajar: ${mataKuliahDiajar ?? 'Belum diisi'}");
    print("Organisasi: ${namaOrganisasi ?? 'Belum diisi'}");
    print("Jabatan: ${jabatanOrganisasi ?? 'Belum diisi'}");
    print("Jumlah Penelitian: ${jumlahPenelitian ?? 0}");
    print("Total Jam Mengajar: ${jumlahJamMengajar ?? 0} jam");
  }
}

// Class Fakultas dengan Mixin
class Fakultas extends Mahasiswa with Penelitian, Pengajaran, Organisasi {
  String? namaFakultas;
  String? dekan;
  
  Fakultas({
    String? nama,
    int? nim,
    this.namaFakultas,
    this.dekan,
  }) : super(nama: nama, nim: nim);
  
  void tampilkanDataFakultas() {
    print("\n=== DATA FAKULTAS ===");
    print("Nama Fakultas: ${namaFakultas ?? 'Belum diisi'}");
    print("Dekan: ${dekan ?? 'Belum diisi'}");
    print("Nama Mahasiswa: ${super.nama ?? 'Belum diisi'}");
    print("NIM: ${super.nim ?? 'Belum diisi'}");
    print("Bidang Penelitian Fakultas: ${bidangPenelitian ?? 'Belum diisi'}");
    print("Mata Kuliah Unggulan: ${mataKuliahDiajar ?? 'Belum diisi'}");
    print("Organisasi Fakultas: ${namaOrganisasi ?? 'Belum diisi'}");
  }
}

void main() {
  print("=== IMPLEMENTASI MIXIN ===");
  print("=" * 30);
  
  // Membuat object Dosen dengan Mixin
  print("\n--- DOSEN ---");
  Dosen dosen = Dosen(
    nama: "Prof. Ahmad Fauzi",
    nim: 98765,
    nidn: "123456789",
    pangkat: "Guru Besar",
  );
  
  // Menggunakan mixin pada Dosen
  dosen.bidangPenelitian = "Kecerdasan Buatan";
  dosen.mataKuliahDiajar = "Machine Learning";
  dosen.namaOrganisasi = "Asosiasi AI Indonesia";
  dosen.jabatanOrganisasi = "Ketua Bidang Penelitian";
  
  dosen.melakukanPenelitian();
  dosen.tambahPenelitian();
  dosen.tambahPenelitian();
  dosen.mengajar();
  dosen.tambahJamMengajar(4);
  dosen.rapatOrganisasi();
  dosen.tampilkanJabatan();
  dosen.tampilkanDataDosen();
  
  print("\n" + "=" * 30);
  
  // Membuat object Fakultas dengan Mixin
  print("\n--- FAKULTAS ---");
  Fakultas fakultas = Fakultas(
    nama: "Budi Prasetyo",
    nim: 112233,
    namaFakultas: "Fakultas Ilmu Komputer",
    dekan: "Dr. Siti Nurhaliza",
  );
  
  // Menggunakan mixin pada Fakultas
  fakultas.bidangPenelitian = "Pengembangan Sistem Informasi";
  fakultas.mataKuliahDiajar = "Rekayasa Perangkat Lunak";
  fakultas.namaOrganisasi = "BEM Fakultas Ilmu Komputer";
  
  fakultas.melakukanPenelitian();
  fakultas.tambahPenelitian();
  fakultas.mengajar();
  fakultas.rapatOrganisasi();
  fakultas.tampilkanDataFakultas();
  
  print("\n" + "=" * 30);
  
  // Demonstrasi perbedaan penggunaan Mixin
  print("\n=== DEMONSTRASI MIXIN ===");
  print("1. Dosen menggunakan mixin untuk:");
  print("   - Penelitian (sesuai tupoksi dosen)");
  print("   - Pengajaran (aktivitas utama dosen)");
  print("   - Organisasi (dosen aktif berorganisasi)");
  
  print("\n2. Fakultas menggunakan mixin untuk:");
  print("   - Penelitian (fakultas memiliki bidang penelitian)");
  print("   - Pengajaran (fakultas memiliki mata kuliah unggulan)");
  print("   - Organisasi (fakultas memiliki organisasi kemahasiswaan)");
}