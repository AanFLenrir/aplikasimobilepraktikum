// Import tidak perlu karena tidak menggunakan stdin/stdout
// import 'dart:io';

// Class dasar (Parent Class)
class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;
  
  Mahasiswa({this.nama, this.nim, this.jurusan});
  
  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
  
  void perkenalan() {
    print("Halo, saya seorang mahasiswa.");
  }
}

// Child Class - MahasiswaAktif (extends Mahasiswa)
class MahasiswaAktif extends Mahasiswa {
  int? semester;
  double? ipk;
  List<String> mataKuliah = [];
  
  MahasiswaAktif({
    String? nama,
    int? nim,
    String? jurusan,
    this.semester,
    this.ipk,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);
  
  void tambahMataKuliah(String mk) {
    mataKuliah.add(mk);
    print("Mata kuliah '$mk' berhasil ditambahkan.");
  }
  
  void tampilkanKRS() {
    print("\n=== KRS Mahasiswa Aktif ===");
    print("Semester: ${semester ?? 'Belum diisi'}");
    print("IPK: ${ipk ?? 'Belum diisi'}");
    print("Mata Kuliah yang diambil:");
    if (mataKuliah.isEmpty) {
      print("- Belum ada mata kuliah");
    } else {
      for (var mk in mataKuliah) {
        print("- $mk");
      }
    }
  }
  
  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Semester: ${semester ?? 'Belum diisi'}");
    print("IPK: ${ipk ?? 'Belum diisi'}");
  }
  
  @override
  void perkenalan() {
    print("Halo, saya mahasiswa aktif semester ${semester ?? '?'}.");
  }
}

// Child Class - MahasiswaAlumni (extends Mahasiswa)
class MahasiswaAlumni extends Mahasiswa {
  int? tahunLulus;
  String? pekerjaan;
  String? perusahaan;
  
  MahasiswaAlumni({
    String? nama,
    int? nim,
    String? jurusan,
    this.tahunLulus,
    this.pekerjaan,
    this.perusahaan,
  }) : super(nama: nama, nim: nim, jurusan: jurusan);
  
  void cariKerja() {
    String namaMahasiswa = nama ?? 'Mahasiswa';
    String pekerjaanDicari = pekerjaan ?? 'pekerjaan';
    print("$namaMahasiswa sedang mencari pekerjaan sebagai $pekerjaanDicari.");
  }
  
  void tampilkanInfoAlumni() {
    print("\n=== Info Alumni ===");
    print("Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}");
    print("Pekerjaan: ${pekerjaan ?? 'Belum bekerja'}");
    print("Perusahaan: ${perusahaan ?? 'Belum ada'}");
  }
  
  @override
  void tampilkanData() {
    super.tampilkanData();
    print("Tahun Lulus: ${tahunLulus ?? 'Belum diisi'}");
    print("Pekerjaan: ${pekerjaan ?? 'Belum diisi'}");
    print("Perusahaan: ${perusahaan ?? 'Belum diisi'}");
  }
  
  @override
  void perkenalan() {
    print("Halo, saya alumni tahun ${tahunLulus ?? '?'}.");
  }
}

void main() {
  // Membuat object MahasiswaAktif
  print("=== MAHASISWA AKTIF ===");
  MahasiswaAktif aktif = MahasiswaAktif(
    nama: "Budi Santoso",
    nim: 123456,
    jurusan: "Informatika",
    semester: 5,
    ipk: 3.75,
  );
  
  aktif.perkenalan();
  aktif.tampilkanData();
  aktif.tambahMataKuliah("Pemrograman Mobile");
  aktif.tambahMataKuliah("Basis Data");
  aktif.tampilkanKRS();
  
  print("\n${"="*30}\n");
  
  // Membuat object MahasiswaAlumni
  print("=== MAHASISWA ALUMNI ===");
  MahasiswaAlumni alumni = MahasiswaAlumni(
    nama: "Siti Aminah",
    nim: 654321,
    jurusan: "Sistem Informasi",
    tahunLulus: 2023,
    pekerjaan: "Web Developer",
    perusahaan: "PT Teknologi Maju",
  );
  
  alumni.perkenalan();
  alumni.tampilkanData();
  alumni.tampilkanInfoAlumni();
  alumni.cariKerja();
  
  print("\n${"="*30}\n");
  
  // Demo dengan data kosong
  print("=== DEMO DATA KOSONG ===");
  MahasiswaAlumni alumniKosong = MahasiswaAlumni(
    nama: "Test User",
    nim: 999999,
    jurusan: "Testing",
  );
  
  alumniKosong.perkenalan();
  alumniKosong.tampilkanData();
  alumniKosong.cariKerja();
}