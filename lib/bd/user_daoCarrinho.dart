import '/bd/db_helper.dart';
import '/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  saveUser(User user) async {
    Database database = await DBHelper().initDB();
    await database.insert('USER', user.toJson());
  }

  autenticar(String username, String password) async {
    Database database = await DBHelper().initDB();

    String sql = 'SELECT * FROM USER WHERE USERNAME = ? AND PASSWORD = ?;';

    var result = await database.rawQuery(sql, [username, password]);
    return result.isNotEmpty;
  }
}
