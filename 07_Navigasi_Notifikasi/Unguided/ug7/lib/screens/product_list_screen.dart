import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: "BaBooChips",
      description: "Keripik pisang lezat manis berbagai rasa....",
      price: 17000,
      imageUrl: "https://img.lazcdn.com/g/p/b98fa845b6f6d57cc6af15bcea984ec3.jpg_720x720q80.jpg",
    ),
    Product(
      id: 2,
      name: "BanaBall",
      description: "Bola-bola pisang olahan dengan isi kejutan yang lumer di mulut...",
      price: 13000,
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSg71gMBU62Ifbg_mOOfM8_gI0xfbJuIaTbsQ&s",
    ),
    Product(
      id: 3,
      name: "Bana Lee",
      description: "Sale pisang creamy yang lezaat jadi teman nyemil kamu...",
      price: 23000,
      imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-ijRrgbLqI_niGeB2vjxrkmpOPcPBq_XY7Q&s0",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
          Image.asset(
          'assets/logo.png',
            height: 60, 
      ),
            SizedBox(width: 8), 
            Text("Banaboom"),
    ],
  ),
),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(product.imageUrl),
              title: Text(product.name),
              subtitle: Text("\Rp${product.price.toStringAsFixed(2)}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
