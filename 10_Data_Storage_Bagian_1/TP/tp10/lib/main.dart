import 'package:flutter/material.dart';
import 'db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Dibutuhkan untuk inisialisasi
  await SQLHelper.insertUser("John Doe", "john@example.com"); // Menambahkan data contoh
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SQLite Example'),
        ),
        body: Center(
          child: FutureBuilder(
            future: SQLHelper.getUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final users = snapshot.data as List<Map<String, dynamic>>;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(users[index]['name']),
                      subtitle: Text(users[index]['email']),
                    );
                  },
                );
              } else {
                return const Text('No users found.');
              }
            },
          ),
        ),
      ),
    );
  }
}
