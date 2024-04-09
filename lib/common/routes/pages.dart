import 'package:flutter_firebase_chat_app/common/routes/names.dart';
import 'package:flutter_firebase_chat_app/pages/welcome/bindings.dart';
import 'package:flutter_firebase_chat_app/pages/welcome/view.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => WelcomePage(),
        binding: WelcomeBinding(),
    ),
  ];
}
