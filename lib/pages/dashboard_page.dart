import 'package:flutter_riverpod/flutter_riverpod.dart';

/// provider untuk state dashboard
final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
  (ref) => DashboardNotifier(),
);

class DashboardState {
  final int mahasiswa;
  final int dosen;
  final int matakuliah;

  const DashboardState({
    this.mahasiswa = 0,
    this.dosen = 0,
    this.matakuliah = 0,
  });

  DashboardState copyWith({
    int? mahasiswa,
    int? dosen,
    int? matakuliah,
  }) {
    return DashboardState(
      mahasiswa: mahasiswa ?? this.mahasiswa,
      dosen: dosen ?? this.dosen,
      matakuliah: matakuliah ?? this.matakuliah,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(const DashboardState());

  void tambahMahasiswa() {
    state = state.copyWith(mahasiswa: state.mahasiswa + 1);
  }

  void tambahDosen() {
    state = state.copyWith(dosen: state.dosen + 1);
  }

  void tambahMatakuliah() {
    state = state.copyWith(matakuliah: state.matakuliah + 1);
  }
}