import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';

abstract class ProductDAO {
  save(Product product);

  remove(int id);

  Future<List<Product>> find();

}