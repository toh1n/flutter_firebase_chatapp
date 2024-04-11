import 'package:flutter_firebase_chat_app/common/routes/names.dart';
import 'package:flutter_firebase_chat_app/common/store/config.dart';
import 'package:flutter_firebase_chat_app/pages/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController{
  final state = WelcomeState();
  changePage(int index) async {
    state.index.value = index;
  }

  handleSignIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}