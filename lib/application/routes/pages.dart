import 'package:get/get.dart';
import '../modules/details/details_content_binding.dart';
import '../modules/details/details_content_view.dart';
import '../modules/homepage/homepage_binding.dart';
import '../modules/homepage/homepage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      nama: _Paths.HOME,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_MAHASISWA,
      page: () => const DetailMahasiswaView(),
      binding: DetailMahasiswaBinding(),
    )
  ];
}
