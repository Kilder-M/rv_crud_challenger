import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/modules/home/views/update_view.dart';
import 'package:rv_crud_challenger/app/modules/home/widgets/card_product_details.dart';

class ProductDetailsView extends GetView {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = (Get.arguments == null) ? Product() : Get.arguments;
    var photoUrl = (product.urlPhoto == null || product.urlPhoto == '')
        ? ''.obs
        : product.urlPhoto.obs;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 135, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.chevron_left,
                            size: 28,
                          ),
                        ),
                        Text(
                          'DETALHES',
                          //style: titleTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: CardProductDetails(
                      onTapButton: (){
                        Get.to(const UpdateView(), arguments: product);
                      },
                      product: product,
                      photoUrl: product.urlPhoto,
                      width: double.infinity,
                      photoWidth: 100,
                      photoHeight: 100,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
