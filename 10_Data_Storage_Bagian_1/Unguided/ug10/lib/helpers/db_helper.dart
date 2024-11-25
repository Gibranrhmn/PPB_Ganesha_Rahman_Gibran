import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/mahasiswa.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> _getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'mahasiswa.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE mahasiswa (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT,
            nim TEXT,
            alamat TEXT,
            hobi TEXT
          )
          ''',
        );
      },
    );
  }

  static Future<void> insertMahasiswa(Mahasiswa mahasiswa) async {
    final db = await _getDatabase();
    await db.insert('mahasiswa', mahasiswa.toMap());
  }

  static Future<List<Mahasiswa>> getAllMahasiswa() async {
    final db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('mahasiswa');

    return List.generate(
      maps.length,
      (i) => Mahasiswa.fromMap(maps[i]),
    );
  }
}
