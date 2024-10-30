import 'package:flutter/material.dart';
import 'package:guided07/models/product.dart';
import 'package:guided07/pages/detailpage.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final List<Product> products = [
    Product(
      id: 1,
      nama: 'Mouse',
      harga: 300000, 
      gambarUrl: 'https://resource.logitechg.com/w_386,ar_1.0,c_limit,f_auto,q_auto,dpr_2.0/d_transparent.gif/content/dam/gaming/en/products/g502x-plus/gallery/g502x-plus-gallery-1-black.png?v=1', 
      deskripsi: 'Cihuuuy.... Mouse Gaming click! click!',
      ),
      Product(
      id: 2,
      nama: 'Keyboard Mechanical',
      harga: 500000, 
      gambarUrl: 'https://resource.logitech.com/w_1600,c_limit,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/logitech/en/products/keyboards/mx-mechanical/gallery/mx-mechanical-keyboard-top-view-graphite-us.png?v=1&quot', 
      deskripsi: 'Cihuuuy.... Keyboard Mechanical ctak! ctak! ea',
      ),
      Product(
      id: 3,
      nama: 'Headset Gemink',
      harga: 450000, 
      gambarUrl: 'https://m.media-amazon.com/images/I/61CGHv6kmWL.AC_UF894,1000_QL80.jpg', 
      deskripsi: 'Cihuuuy.... Headset Gemink Bang! Bang!',
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Model'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index){
          final Product = products[index];
          return ListTile(
            leading: Image.network(
              Product.gambarUrl,
              width: 70,
              height: 70,
            ),
            title: Text(Product.nama),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Rp${Product.harga}'),
                Text(Product.deskripsi),
              ],
            ),
            onTap: (){
              print('Tap layar berhasil');
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (_) => Detailpage(
                  data: Icon(Icons.notifications_outlined),
                  ),
              ),
              );
            },
          );
        }
        )
      );
  }
}
