import 'package:btjacademy_getx_athif/application/data/firebase/firebase_mahasiswa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_demo/application/data/source/source_mahasiswa.dart';
import 'package:get_cli_demo/application/data/firebase/firebase_mahasiswa.dart';

class HomepageContoller extends GetxController {
  MahasiswaProvider _provider = Get.find<MahasiswaProvider>();

  TextEditingController namacontroller = TextEditingController();
  TextEditingController nimcontroller = TextEditingController();
  TextEditingController prodicontroller = TextEditingController();
  TextEditingController ipkcontroller = TextEditingController();
  TextEditingController angkatancontroller = TextEditingController();

  final count = 0.obs;
  RxList<Mahasiswa> data = <Mahasiswa>[].obs;
  RxBool loading = false.obs;

  @override
  void onInit(){
    super.onInit();
    showData();
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    namacontroller.dispose();
    nimcontroller.dispose();
    ipkcontroller.dispose();
    angkatancontroller.dispose();
    prodicontroller.dispose();
    super.onClose();
  }

  void increament() => count.value++;

  showData() async{
    loading(true);
    try {
      await _provider.getDataMahasiswa().then((value) async {
        await value.body.entries.map((element) {
          var temp = Mahasiswa.fromJson(element.value);
          data.add(temp);
      }).toList();
        loading(false);
      });
    } catch (error) {
      print(error);
    }
  }

  addData() async {
    try {
      await _provider
          .postMahasiswa(Mahasiswa(
        ipk: ipkcontroller.text,
        nama: namacontroller.text,
        nim: nimcontroller.text,
        prodi: prodicontroller.text,
        angkatan: angkatancontroller.text)).then((value) {
          data.clear();
          showData();
          Get.back();
          namacontroller.clear();
          nimcontroller.clear();
          prodicontroller.clear();
          ipkcontroller.clear();
          angkatancontroller.clear();
      });
    } catch (e) {
      print(e);
    }
  }
}