import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_app/common/routes/pages.dart';
import 'package:get/get.dart';

void main(){
  runApp(const ChatApp());
}

class ChatApp extends StatefulWidget {
  const ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // home: HomeScreen(),
    );
  }
}
