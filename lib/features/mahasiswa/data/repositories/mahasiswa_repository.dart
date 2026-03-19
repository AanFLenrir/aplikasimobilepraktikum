import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tes/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // Debug
      print(data);

      return data
          .map((json) => MahasiswaModel.fromJson(json))
          .toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Gagal memuat data mahasiswa');
    }
  }
}