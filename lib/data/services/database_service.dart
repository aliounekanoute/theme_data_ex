
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:theme_data_ex/data/models/post_model.dart';

class DatabaseService {
  Database? _database;

  DatabaseService._privateConstructor();

  static final DatabaseService instance = DatabaseService._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'post_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE posts(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertPost(Post post) async {
    final db = await database;
    await db.insert(
      'posts',
      post.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(seconds: 2));
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('posts');
    return List.generate(maps.length, (i) {
      return Post(
        id: maps[i]['id'],
        title: maps[i]['title'],
        body: maps[i]['body'],
      );
    });
  }

  Future<void> truncate() async {
    final db = await database;

    db.delete('posts');
  }
}
