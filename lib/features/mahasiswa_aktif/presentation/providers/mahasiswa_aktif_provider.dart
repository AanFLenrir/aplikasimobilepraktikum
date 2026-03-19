import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tes/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';
import 'package:tes/features/mahasiswa_aktif/data/repositories/mahasiswa_aktif_repository.dart';

final mahasiswaAktifNotifierProvider =
AsyncNotifierProvider<MahasiswaAktifNotifier, List<MahasiswaAktifModel>>(
  MahasiswaAktifNotifier.new,
);

class MahasiswaAktifNotifier
    extends AsyncNotifier<List<MahasiswaAktifModel>> {

  @override
  Future<List<MahasiswaAktifModel>> build() async {
    return _fetchData();
  }

  Future<List<MahasiswaAktifModel>> _fetchData() async {
    final repo = MahasiswaAktifRepository();
    return await repo.getMahasiswaAktifList();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchData());
  }
}