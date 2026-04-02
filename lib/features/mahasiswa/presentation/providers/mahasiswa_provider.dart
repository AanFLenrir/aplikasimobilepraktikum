import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tes/core/services/local_storage_service.dart';
import 'package:tes/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:tes/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

// ================= REPOSITORY =================
final mahasiswaRepositoryProvider =
Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

// ================= LOCAL STORAGE =================
final localStorageServiceProvider =
Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

// ================= SAVED USERS =================
final savedMahasiswaProvider =
FutureProvider<List<Map<String, String>>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);
  return storage.getSavedUsers();
});

// ================= SINGLE USER =================
final savedMahasiswaUserProvider =
FutureProvider<Map<String, String?>>((ref) async {
  final storage = ref.watch(localStorageServiceProvider);

  final userId = await storage.getUserId();
  final username = await storage.getUsername();
  final token = await storage.getToken();

  return {
    'userId': userId,
    'username': username,
    'token': token,
  };
});

// ================= NOTIFIER =================
class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;
  final LocalStorageService _storage;

  MahasiswaNotifier(this._repository, this._storage)
      : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswaList();
  }

  /// SIMPAN MAHASISWA
  Future<void> saveSelectedMahasiswa(MahasiswaModel mhs) async {
    await _storage.addUserToSavedList(
      userId: mhs.id.toString(),
      username: mhs.name,
    );
  }

  /// HAPUS 1
  Future<void> removeSavedMahasiswa(String userId) async {
    await _storage.removeSavedUser(userId);
  }

  /// HAPUS SEMUA
  Future<void> clearSavedMahasiswa() async {
    await _storage.clearSavedUsers();
  }
}

// ================= PROVIDER =================
final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<
    MahasiswaNotifier,
    AsyncValue<List<MahasiswaModel>>>((ref) {
  final repo = ref.watch(mahasiswaRepositoryProvider);
  final storage = ref.watch(localStorageServiceProvider);

  return MahasiswaNotifier(repo, storage);
});