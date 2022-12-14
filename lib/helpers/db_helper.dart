import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabasesHelper {
  static DatabasesHelper? _databasesHelper;
  DatabasesHelper._instance() {
    _databasesHelper = this;
  }

  factory DatabasesHelper() => _databasesHelper ?? DatabasesHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblStore = 'store';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/store.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblStore (
        store_id INTEGER PRIMARY KEY,
        store_code TEXT,
        store_name TEXT,
        address TEXT,
        dc_id TEXT,
        dc_name TEXT,
        account_id TEXT,
        account_name TEXT,
        subchannel_id TEXT,
        subchannel_name TEXT,
        channel_id TEXT,
        channel_name TEXT,
        area_id TEXT,
        area_name TEXT,
        region_id TEXT,
        region_name TEXT,
        latitude TEXT,
        longitude TEXT
      );
    ''');
  }

  /// Movie
  Future<int> insertStores(Store stores) async {
    final db = await database;
    return await db!.insert(
      _tblStore,
      stores.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<dynamic> insertListStores(List<Store> stores) async {
    final db = await database;
    var list = [];
    for (var element in stores) {
      list.add(element.toJson());
    }
    return await db!.rawInsert(
      'INSERT INTO $_tblStore (store_id,store_code,store_name,address,dc_id,dc_name,account_id,account_name,subchannel_id,subchannel_name,channel_id,channel_name,area_id,area_name,region_id,region_name,latitude,longitude) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?)',
      list,
    );
  }

  Future<List<Map<String, dynamic>>> getStoreList() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblStore);

    return results;
  }
}
