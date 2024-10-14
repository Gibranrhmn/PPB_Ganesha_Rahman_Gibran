import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rekomendasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const TouristDestinations(),
      debugShowCheckedModeBanner : false,
    );
  }
}

class TouristDestinations extends StatelessWidget {
  const TouristDestinations({Key? key}) : super(key: key);

  final List<Map<String, String>> destinations = const [
    {
      "name": "Baturraden",
      "description": "Baturraden adalah sebuah kawasan wisata yang terletak sekitar 15 km dari pusat kota Purwokerto di lereng selatan Gunung Slamet",
      "image": "https://asset.kompas.com/crops/0nZi0OzF4llKf6pwzhfeQ9Fa7Xs=/4x0:997x662/750x500/data/photo/2022/06/06/629db5191baf7.jpg"
    },
    {
      "name": "Telaga Sunyi",
      "description": "Telaga Sunyi terletak di Kabupaten Banyumas, Jawa Tengah, dan berada pada ketinggian sekitar 700 meter.",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWxlXQHnRdnq-J6jNkUr_21ervTOcmunPfFw&s"
    },
    {
      "name": "Curug Telu",
      "description": "Curug Telu terletak di Desa Karangsalam, Kecamatan Baturraden, Kabupaten Banyumas,",
      "image": "https://www.banyumasekspres.id/wp-content/uploads/2022/12/curug-telu.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Banyumas'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildWelcomeBanner(),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                return _buildDestinationCard(context, destinations[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selamat Datang di Wisata Banyumas!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Temukan berbagai objek wisata menarik di Banyumas.',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationCard(BuildContext context, Map<String, String> destination) {
  return Card(
    elevation: 8,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Image.network(
            destination['image']!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                height: 200,
                child: const Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10, // Adjust this to move the description up or down
          left: 10,
          right: 10,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black54, // Semi-transparent background
              borderRadius: BorderRadius.circular(10), // Adjusted for better styling
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destination['name']!,
                  style: const TextStyle(
                    fontSize: 24, // Increased font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  constraints: const BoxConstraints(
                    maxHeight: 50, // Set a maximum height for the description
                  ),
                  child: Text(
                    destination['description']!,
                    style: const TextStyle(
                      fontSize: 16, // Adjusted font size
                      color: Colors.white70,
                    ),
                    overflow: TextOverflow.ellipsis, // Ensure long text is truncated
                    maxLines: 2, // Limit the number of lines displayed
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}
