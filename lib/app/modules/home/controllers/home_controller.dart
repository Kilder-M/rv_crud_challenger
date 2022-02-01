import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/data/domain/services/product_service.dart';
import 'package:rv_crud_challenger/app/modules/home/views/update_view.dart';

class HomeController extends GetxController {
  final _service = ProductService();

  var list = Future.value(<Product>[]).obs;
  HomeController(){
    refreshList();
  }

  refreshList(){
    list.value = _service.find();
  }

  save(Product product){
    _service.save(product);
  }

  remove(int id){
    _service.remove(id);
    refreshList();
  }
  goToForm(BuildContext context,[Product? product]){
    // Get.to(UpdateView(),arguments: product).then(refreshList);
  }
}
