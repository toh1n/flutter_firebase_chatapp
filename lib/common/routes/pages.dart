import 'package:flutter_firebase_chat_app/common/routes/names.dart';
import 'package:flutter_firebase_chat_app/pages/sign_in/index.dart';
import 'package:flutter_firebase_chat_app/pages/welcome/index.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => const SignInPage(),
      binding: SignInBindings(),
    ),
  ];
}
