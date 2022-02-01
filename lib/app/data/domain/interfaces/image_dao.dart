
import 'package:rv_crud_challenger/app/data/domain/entities/image.dart';

abstract class ImageDAO {
  save(Image product);

  remove(int id);

  Future<List<Image>> find();

}