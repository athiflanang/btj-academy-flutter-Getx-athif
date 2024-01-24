import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../homepage/homepage_controller.dart';

class HomepageView extends GetView<HomepageContoller> {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<HomepageContoller>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('data mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Obx(
          () => controller.loading.value
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Center(
            child: Container(
              child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                    onTap: () => {
                      Get.toNamed(
                      "/detail-mahasiswa",
                      arguments: {
                        'nama' : controller.data[index].nama,
                        'nim' : controller.data[index].nim,
                        'prodi' : controller.data[index].prodi,
                        'ipk' : controller.data[index].ipk,
                        'angkatan' : controller.data[index].angkatan,
                        },
                      ),
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
    border: Border.all(width: 1),
    borderRadius: BorderRadius.circular(10),
    color: Colors.white),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(controller.data[index].nama ?? "-",
    style: const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16)),
    Row(
    children: [
      Text(controller.data[index].prodi ?? "-"),
    const Text(' - '),
      Text(controller.data[index].angkatan ?? "-"),
    ],
    ),
    ],
    ),
    const Icon(Icons.navigate_next,)
    ]),
    ),
                    );
    }))),
          ),
    floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.grey[400],
    child: const Icon(Icons.add),
    onPressed: (){
      Get.defaultDialog(
      onCancel: () => {
        controller.namacontroller.text = " ",
        controller.nimcontroller.text = " ",
        controller.ipkcontroller.text = " ",
        controller.prodicontroller.text = " ",
        controller.angkatancontroller.text = " "
    },
    title: 'add mahasiswa',
    titlePadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
    contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
    content: Column(
    children: [
      SizedBox(
    height: 50,
    child: TextField(
    controller: controller.namacontroller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5)),
    labelText: 'nama',
    ),
    ),
    ),
    const SizedBox(height: 10),
    ),
    SizedBox(
    height: 50,
    child: TextField(
    controller: controller.nimcontroller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5)),
    labelText: 'nim',
    ),
    ),
    ),
    const SizedBox(height: 10),
    SizedBox(
    height: 50,
    child: TextField(
    controller: controller.prodicontroller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5)),
    labelText: 'prodi',
    ),
    ),
    ),
    const SizedBox(height: 10),
    SizedBox(
    height: 50,
    child: TextField(
    controller: controller.angkatancontroller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5)),
    labelText: 'angkatan',
    ),
    ),
    ),
    const SizedBox(height: 10),
    SizedBox(
    height: 50,
    child: TextField(
    controller: controller.ipkcontroller,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5)),
    labelText: 'ipk',
    ),
    ),
    ),
    ],
    ),
    actions: [
      Container(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: ElevatedButton(
    onPressed: () {
      if controller.namacontroller.text == "") {
      Get.defaultDialog(
      title: "error", content: Text('lengkapi input'));
    } else if (controller.nimController.text == "") {
    Get.defaultDialog(
    title: "Error", content: Text('Lengkapi input!'));
    } else if (controller.prodiController.text == "") {
    Get.defaultDialog(
    title: "Error", content: Text('Lengkapi input!'));
    } else if (controller.ipkController.text == "") {
    Get.defaultDialog(
    title: "Error", content: Text('Lengkapi input!'));
    } else if (controller.angkatanController.text == "") {
    Get.defaultDialog(
    title: "Error", content: Text('Lengkapi input!'));
    } else {
    controller.addData();
    }
    },
    child: Text('simpan'),
    ),
    )
    ]
      )
    },
    ),

  }
}