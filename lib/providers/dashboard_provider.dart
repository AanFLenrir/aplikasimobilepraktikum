import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  // Sesuai dengan foto: 124, 38, 45
  int _mahasiswa = 124;  // Diubah dari 120 → 124
  int _dosen = 38;       // Diubah dari 30 → 38
  int _matakuliah = 45;  // Tetap 45

  int get mahasiswa => _mahasiswa;
  int get dosen => _dosen;
  int get matakuliah => _matakuliah;

  void tambahMahasiswa() {
    _mahasiswa++;
    notifyListeners();
  }

  void tambahDosen() {
    _dosen++;
    notifyListeners();
  }

  void tambahMatakuliah() {
    _matakuliah++;
    notifyListeners();
  }
}