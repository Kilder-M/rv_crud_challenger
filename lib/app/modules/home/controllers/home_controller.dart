import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/data/domain/services/product_service.dart';
import 'package:rv_crud_challenger/app/modules/home/views/update_view.dart';

class HomeController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final _service = ProductService();
  bool nameIsValid = false;
  bool detailsIsValid = false;
  

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

  Future<String?> pickImageStringFromGallery() async {
    try {
      var file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        Uint8List imageBytes = await file.readAsBytes();
        String imageString = base64.encode(imageBytes);
        return imageString;
      } else {
        return null;
      }
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
