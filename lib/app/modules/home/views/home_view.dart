import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              viewsTitles(
                title: 'Lista de Produtos',
                isButtonAdd: true,
              ),
              Expanded(
                child: SizedBox(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () => Get.to(const ProductDetailsView(),),
                      child: CardForProductList(
                        title: 'teste',
                        subTitle: 'asdasdsadasdasdasdasdasdasdasdasdasdasd',
                        price: '50,00',
                        onTapIcon: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return alertDialogProduct(
                                context,
                                controller,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


