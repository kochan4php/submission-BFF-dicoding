import 'package:restaurant_app/data/db/database.dart';
import 'package:restaurant_app/data/models/restaurant.dart';

class BookmarkTable extends BaseDatabase<Restaurant> {
  static const String bookmarkTableName = 'bookmarks';

  BookmarkTable() : super(tableName: bookmarkTableName);

  @override
  Future delete(String id) async {
    final db = await database;
    await db!.delete(bookmarkTableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<Restaurant>> getAll() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db!.query(bookmarkTableName);
    return result.map((item) => Restaurant.fromJson(item)).toList();
  }

  @override
  Future<Map> getById(String id) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db!.query(
      bookmarkTableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return {};
    }
  }

  @override
  Future insert(Restaurant data) async {
    final db = await database;
    await db!.insert(bookmarkTableName, data.toJsonForBookmark());
  }

  @override
  Future update(String id, Restaurant data) async {
    final db = await database;
    await db!.update(
      bookmarkTableName,
      data.toJsonForBookmark(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
