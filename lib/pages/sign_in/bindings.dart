import 'package:flutter_firebase_chat_app/pages/sign_in/controller.dart';
import 'package:get/get.dart';

class SignInBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingInController>(() => SingInController());
  }
}
