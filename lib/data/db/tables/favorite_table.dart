import 'package:restaurant_app/data/db/database.dart';
import 'package:restaurant_app/data/models/restaurant.dart';

class FavoriteTable extends BaseDatabase<Restaurant> {
  static const String favoriteTableName = 'favorites';

  FavoriteTable() : super(tableName: favoriteTableName);

  @override
  Future delete(String id) async {
    final db = await database;
    await db!.delete(favoriteTableName, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<List<Restaurant>> getAll() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db!.query(favoriteTableName);
    return result.map((item) => Restaurant.fromJson(item)).toList();
  }

  @override
  Future<Map> getById(String id) async {
    final db = await database;
    List<Map<String, dynamic>> result = await db!.query(
      favoriteTableName,
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
    await db!.insert(favoriteTableName, data.toJsonForFavorite());
  }

  @override
  Future update(String id, Restaurant data) async {
    final db = await database;
    await db!.update(
      favoriteTableName,
      data.toJsonForFavorite(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
