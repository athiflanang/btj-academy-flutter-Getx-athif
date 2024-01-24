import 'package:get/get.dart';
import '../details/details_content__controller.dart';

class DetailMahasiswaBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<DetailMahasiswaController>(
        () => DetailMahasiswaController()
    );
  }
}