import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/services/my_api.dart';

class HomeController extends GetxController {
  var imageDog = Rxn<String>();

  Future<void> onTapStart() async {
    final result = await MyAPI().getDogsRandom();
    if (result.$1) {
      imageDog.value = result.$2;
    } else {
      Get.snackbar(
        'Error',
        result.$2,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 10,
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
