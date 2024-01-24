import 'package:get/get.dart';
import '../source/source_mahasiswa.dart';

class MahasiswaProvider extends GetConnect {
  Future<Response> getDataMahasiswa() async {
    final response = await get(
        'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json'
    );
    return response;
  }

  Future<Response> postMahasiswa(Mahasiswa mahasiswa) async => await post(
      'https://btj-academy-default-rtdb.asia-southeast1.firebasedatabase.app/mahasiswa.json',
  mahasiswa.toJson());
}