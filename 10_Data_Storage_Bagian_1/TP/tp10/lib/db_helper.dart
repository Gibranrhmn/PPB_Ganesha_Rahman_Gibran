import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  // Fungsi untuk inisialisasi database
  static Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'users.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            email TEXT NOT NULL,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
          )
        ''');
      },
      version: 1,
    );
  }

  // Fungsi untuk membaca semua data
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await SQLHelper.db();
    return db.query('users');
  }

  // Fungsi untuk menambahkan data contoh
  static Future<void> insertUser(String name, String email) async {
    final db = await SQLHelper.db();
    await db.insert(
      'users',
      {'name': name, 'email': email},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
