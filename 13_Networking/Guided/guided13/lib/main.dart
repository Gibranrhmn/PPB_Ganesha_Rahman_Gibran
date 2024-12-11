import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guided13/view%20model/counter_controller.dart';
import 'package:guided13/view/detail_page.dart';
import 'package:guided13/view/my_home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name:'/', 
          page: ()=> MyHomePage(title: 'Belajar GetX'),
        ),
        GetPage(
          name:'/detail', 
          page: ()=> DetailPage(),
        ),
      ],
    );
  }
}

