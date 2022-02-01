import 'package:get/get.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/data/domain/services/product_service.dart';
import 'package:rv_crud_challenger/app/modules/home/views/update_view.dart';

class HomeController extends GetxController {
  final _service = ProductService();
   bool nameIsValid = false;
   bool detailsIsValid = false;
  // bool? _emailIsValid;

  //bool get isValid =>  _nameIsValid! && _detailsIsValid!;

  var list = Future.value(<Product>[]).obs;
  HomeController() {
    
    refreshList();
  }

  refreshList() {
    list.value = _service.find();
  }

  save(Product product) {
    _service.save(product);
    refreshList();

  }

  remove(int id) {
    _service.remove(id);
    refreshList();
  }

  goToForm([Product? product]) {
    Get.to(const UpdateView(), arguments: product);
  }

   String validateName(String? name) {
    try {
      _service.validateName(name);
      nameIsValid = true;
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  String validateDetails(String? details) {
    try {
      _service.validateDetails(details);
      detailsIsValid = true;
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  validatePhoto() {}
}
