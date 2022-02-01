import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/modules/home/controllers/home_controller.dart';
import 'package:rv_crud_challenger/app/modules/home/views/home_view.dart';
import 'package:rv_crud_challenger/app/util/widgets/text_form_product.dart';
import 'package:rv_crud_challenger/app/util/widgets/views_titles.dart';

class UpdateView extends GetView<HomeController> {
  const UpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = (Get.arguments == null) ? Product() : Get.arguments;
    var form = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Form(
        key: form,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                viewsTitles(
                  title: 'Editar Produto',
                  onBack: () => Get.back(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.camera_enhance_outlined,
                                color: Colors.grey[600],
                              ))
                        ],
                      ),
                      TextFormProduct(
                        title: 'Nome',
                        validator: controller.validateName,
                        initialValue: product.name ?? '',
                        onSaved: (value) {
                          product.name = value;
                        },
                      ),
                      TextFormProduct(
                        title: 'Descrição',
                        validator: controller.validateDetails,
                        initialValue: product.details,
                        onSaved: (value) {
                          product.details = value;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          product.photo = 'teste';
                          form.currentState!.validate();
                          form.currentState!.save();
                          if (controller.nameIsValid && controller.detailsIsValid) {
                            controller.save(product);
                            Get.to(const HomeView());
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: const Text(
                                  'Produto atualizado! ',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('Salvar'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
