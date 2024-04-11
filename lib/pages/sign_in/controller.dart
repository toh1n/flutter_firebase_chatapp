import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_chat_app/common/routes/names.dart';
import 'package:flutter_firebase_chat_app/common/store/store.dart';
import 'package:flutter_firebase_chat_app/pages/sign_in/state.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../common/entities/entities.dart';
import '../../common/widgets/widgets.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class SingInController extends GetxController {
  final state = SingInState();

  final db = FirebaseFirestore.instance;
  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";

        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.email = email;
        userProfile.displayName = displayName;
        userProfile.photoUrl = photoUrl;
        userProfile.accessToken = id;

        UserStore.to.saveProfile(userProfile);
        var userBase = await db
            .collection('users')
            .withConverter(
              fromFirestore: UserData.fromFirestore,
              toFirestore: (UserData userData, options) =>
                  userData.toFirestore(),
            )
            .where('id', isEqualTo: id)
            .get();
        if (userBase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photourl: photoUrl,
              fcmtoken: "",
              location: "",
              addtime: Timestamp.now());
          await db
              .collection('users')
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userData, options) =>
                    userData.toFirestore(),
              )
              .add(data);
        }
      }

      Get.offAndToNamed(AppRoutes.Application);
    } catch (e) {
      toastInfo(msg: "Login Error");
      print(e.toString());
    }
  }
}
