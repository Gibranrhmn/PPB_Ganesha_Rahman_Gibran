import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WisataScreen(),
    );
  }
}

class WisataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( 
          child: Text(
            'Rekomendasi Wisata',
            style: TextStyle(color: Colors.white),
            ),
        ),
        backgroundColor: const Color.fromARGB(255, 103, 59, 183),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Curug Gomblang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Image.network(
              'https://asset.kompas.com/crops/JU1-auJOFFWK0Lc7qytSGqHtaAU=/0x199:564x575/750x500/data/photo/2022/06/02/629808c5b746d.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              'Curug Gomblang merupakan salah satu curug yang terdapat di wilayah Kabupaten Banyumas. Wisata alam Curug Gomblang dapat digunakan untuk mengisi liburan untuk merehatkan diri dari aktivitas keseharian. Sesampai di area curug, tampat keindahan curug atau ar terjun dengan ketinggian sekitar 50 meter. Aliran airnya meluncur deras ke kolam di bawahnya. Pemandangan alam tersebut dapat digunakan sebagai spot foto yang indah.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('Kunjungi Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
