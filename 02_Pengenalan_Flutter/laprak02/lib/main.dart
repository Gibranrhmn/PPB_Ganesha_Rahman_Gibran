import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    debugShowCheckedModeBanner: false, // matikan ikon debug
  ));
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text('Profil', style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // lengkungan
            Stack(
              children: [
                ClipPath(
                  clipper: ProfileClipper(), // customclipper efek melengkung
                  child: Container(
                    height: 300.0, // tinggi header
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.lightBlueAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 120.0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('assets/GGP.jpeg'), // foto profil
                        backgroundColor: Colors.white, // border foto
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Ganesha Rahman Gibran', // nama
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          letterSpacing: 1.0, // jarak antar huruf
                        ),
                      ),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20.0),

            // card profil
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ProfileInfoCard(
                    label: 'NIM',
                    info: '2211104058', // nim
                    icon: Icons.account_box,
                  ),
                  ProfileInfoCard(
                    label: 'Email',
                    info: 'gibranworkspace@gmail.com', // email
                    icon: Icons.email,
                  ),
                  ProfileInfoCard(
                    label: 'Tempat / Tanggal Lahir',
                    info: 'Pekalongan, 11 Oktober 2003', // ttl
                    icon: Icons.cake,
                  ),
                  ProfileInfoCard(
                    label: 'Alamat',
                    info: 'Purwokerto', // alamat
                    icon: Icons.home,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// custommclipper melengkung
class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // melengkung bawah
    path.lineTo(0, size.height - 100);
    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 100);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// widget card
class ProfileInfoCard extends StatelessWidget {
  final String label;
  final String info;
  final IconData icon;

  ProfileInfoCard({required this.label, required this.info, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, //bayangan lembut
              blurRadius: 8.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blueAccent,
            size: 30.0,
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          subtitle: Text(
            info,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
