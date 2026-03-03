import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/model/dashboard_model.dart';
import '../../data/repositories/dashboard_repository.dart';

// Repository Provider
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository();
});

// SIMPLE PROVIDER (untuk counter)
class DashboardSimpleState {
  final int mahasiswa;
  final int dosen;
  final int matakuliah;

  DashboardSimpleState({
    required this.mahasiswa,
    required this.dosen,
    required this.matakuliah,
  });

  DashboardSimpleState copyWith({
    int? mahasiswa,
    int? dosen,
    int? matakuliah,
  }) {
    return DashboardSimpleState(
      mahasiswa: mahasiswa ?? this.mahasiswa,
      dosen: dosen ?? this.dosen,
      matakuliah: matakuliah ?? this.matakuliah,
    );
  }
}

class DashboardSimpleNotifier extends StateNotifier<DashboardSimpleState> {
  DashboardSimpleNotifier()
      : super(
          DashboardSimpleState(
            mahasiswa: 124,
            dosen: 38,
            matakuliah: 45,
          ),
        );

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

final dashboardSimpleProvider =
    StateNotifierProvider<DashboardSimpleNotifier, DashboardSimpleState>(
  (ref) => DashboardSimpleNotifier(),
);

// COMPLEX PROVIDER (untuk statistik - YANG INI YANG ANDA BUTUHKAN)
// Menggunakan FutureProvider untuk async data
final dashboardDataProvider = FutureProvider<DashboardData>((ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  return repository.getDashboardData();
});

// StateNotifier untuk mengelola state dashboard yang lebih kompleks
class DashboardNotifier extends StateNotifier<AsyncValue<DashboardData>> {
  final DashboardRepository _repository;

  DashboardNotifier(this._repository) : super(const AsyncValue.loading()) {
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getDashboardData();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.refreshDashboard();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void updateUserName(String newName) {
    state.whenData((data) {
      state = AsyncValue.data(data.copyWith(userName: newName));
    });
  }
}

// Provider untuk DashboardNotifier (YANG INI!)
final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, AsyncValue<DashboardData>>((ref) {
  final repository = ref.watch(dashboardRepositoryProvider);
  return DashboardNotifier(repository);
});

// Provider untuk stat yang dipilih
final selectedStatIndexProvider = StateProvider<int>((ref) => 0);

// Provider untuk dark/light mode
final themeModeProvider = StateProvider<bool>((ref) => false);