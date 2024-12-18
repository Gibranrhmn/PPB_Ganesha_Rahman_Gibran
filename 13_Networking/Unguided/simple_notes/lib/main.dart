import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/note_controller.dart';
import 'views/home_page.dart';
import 'views/add_note_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Notes App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/add', page: () => AddNotePage()),
      ],
    );
  }
}