part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const MAHASISWA = _Paths.MAHASISWA;
  static const DETAIL_MAHASISWA = _Paths.DETAIL_MAHASISWA;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const MAHASISWA = '/mahasiswa';
  static const DETAIL_MAHASISWA = '/detail-mahasiswa';
}