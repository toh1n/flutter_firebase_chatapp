import 'package:flutter_firebase_chat_app/common/services/services.dart';
import 'package:get/get.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool("STORAGE_DEVICE_FIRST_OPEN_KEY", true);
  }
}
