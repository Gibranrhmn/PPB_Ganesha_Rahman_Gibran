import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Controller untuk mengelola state counter
class CounterController extends GetxController {
  // Variabel reaktif untuk menyimpan nilai counter
  var counter = 0.obs;

  // Fungsi untuk menambah nilai counter
  void increment() {
    counter++;
  }

  // Fungsi untuk mereset nilai counter
  void reset() {
    counter.value = 0;
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Inisialisasi controller menggunakan Get.put() di dalam build
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: const Text("Counter App")),
      body: Center(
        child: Obx(() {
          // Menampilkan nilai counter
          return Text(
            "${controller.counter}", // Mengambil nilai counter reaktif
            style: const TextStyle(fontSize: 48),
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller.increment, // Menambah nilai counter
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: controller.reset, // Mereset nilai counter
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
