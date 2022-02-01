import 'package:rv_crud_challenger/app/data/database/sqlite/connection.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/image.dart';
import 'package:rv_crud_challenger/app/data/domain/interfaces/image_dao.dart';
import 'package:sqflite/sqlite_api.dart';

class ProductDAOImplement implements ImageDAO {
  Database? _db;

  @override
  Future<List<Image>> find() async {
    _db = await Connection.getproduct();
    List<Map<String, dynamic>> result = await _db!.query('image');
    List<Image> list = List.generate(result.length, (index) {
      var linha = result[index];
      return Image.fromMap(linha);
    });
    return list;
  }

  @override
  remove(int id) async {
    _db = await Connection.getproduct();
    String sql = 'DELETE FROM image WHERE id = ?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Image image) async {
    _db = await Connection.getproduct();
    String sql;
    if (image.id == null) {
      sql = 'INSERT INTO image (imageName) VALUES (?)';
      _db!.rawInsert(sql,[image.imageName]);

    }else {
      sql = 'UPDATE image SET name = ? WHERE id = ?';
      _db!.rawInsert(sql,[image.imageName,image.id]);
    }
  }
}