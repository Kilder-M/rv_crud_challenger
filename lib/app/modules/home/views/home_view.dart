import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/modules/home/views/product_details_view.dart';
import 'package:rv_crud_challenger/app/modules/home/widgets/dialog.dart';
import 'package:rv_crud_challenger/app/util/widgets/card_for_product_list.dart';
import 'package:rv_crud_challenger/app/util/widgets/views_titles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                viewsTitles(
                    title: 'Lista de Produtos',
                    isButtonAdd: true,
                    onTapAddIcon: () {
                      controller.goToForm();
                    }),
                Expanded(
                  child: SizedBox(
                    child: FutureBuilder<List<Product>>(
                      future: controller.list.value,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var list = snapshot.data;
                          return ListView.builder(
                            itemCount: list!.length,
                            itemBuilder: (context, index) {
                              var product = list[index];
                              return GestureDetector(
                                onTap: () => Get.to(
                                  const ProductDetailsView(),
                                ),
                                child: CardForProductList(
                                  title: product.name,
                                  subTitle: product.details,
                                  onTapIcon: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return alertDialogProduct(
                                          context,
                                          controller,
                                          product,
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
