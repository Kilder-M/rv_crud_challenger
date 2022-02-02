import 'dart:convert';

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
    var title = (Get.arguments == null) ? 'Novo Produto' : 'Editar Produto';
    var photoUrl = (product.urlPhoto == null || product.urlPhoto == '')
        ? ''.obs
        : product.urlPhoto.obs;
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
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    viewsTitles(
                      title: title,
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
                              SizedBox(
                                width: 80,
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: photoUrl.value != ''
                                      ? Image.memory(
                                          base64.decode(photoUrl.value ?? ''),
                                          fit: BoxFit.cover)
                                      : const CircleAvatar(
                                          child: Icon(
                                              Icons.production_quantity_limits),
                                        ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    photoUrl.value = await controller
                                            .pickImageStringFromGallery() ??
                                        '';
                                    product.urlPhoto = photoUrl.value;
                                  },
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
                              form.currentState!.validate();
                              form.currentState!.save();
                              if (controller.nameIsValid &&
                                  controller.detailsIsValid) {
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
        ),
      ),
    );
  }
}
