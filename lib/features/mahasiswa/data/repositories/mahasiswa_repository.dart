import 'package:dio/dio.dart';
import 'package:tes/core/network/dio_client.dart';
import 'package:tes/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  MahasiswaRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final Response response = await _dioClient.dio.get('/users');

      final List<dynamic> data = response.data;

      return data.map((json) {
        return MahasiswaModel.fromJson({
          ...json,
          // 🔥 inject body dari company.name
          'body': json['company']?['name'] ?? '',
        });
      }).toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data mahasiswa: ${e.response?.statusCode} - ${e.message}',
      );
    }
  }
}