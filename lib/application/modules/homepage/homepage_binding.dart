import 'package:get/get.dart';
import 'package:get_cli_demo/application/data/source/source_mahasiswa.dart';
import '../homepage/homepage_controller.dart';

class HomepageBinding extends Bindings{
  @override
  void dependecies(){
    Get.lazyPut<HomepageContoller>(
        () => HomepageContoller(),
    );
    Get.lazyPut<source_mahasiswa(() => source_mahasiswa());
  }
}