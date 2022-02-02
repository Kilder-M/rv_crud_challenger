import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rv_crud_challenger/app/data/domain/entities/product.dart';
import 'package:rv_crud_challenger/app/modules/home/views/update_view.dart';

class CardProductDetails extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final double? height;
  final double? width;
  final double? photoWidth;
  final double? photoHeight;
  final String? photoUrl;
  final String? productName;
  final String? productType;
  final String? productHeight;
  final String? productWidth;
  final String? productPrice;
  final String? productRating;
  final Product product;
  final void Function()? onTapIcon;
  final void Function()? onTapButton;

  const CardProductDetails(
      {Key? key,
      this.height,
      this.width,
      this.productName,
      this.productType,
      this.productHeight,
      this.productWidth,
      this.productPrice,
      this.productRating,
      this.backgroundColor,
      this.borderRadius,
      this.photoUrl,
      this.photoWidth,
      this.photoHeight,
      this.onTapIcon,
      required this.product,
      this.onTapButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Product product = Get.arguments;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 0.5,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: photoUrl != null
                      ? Image.memory(base64.decode(photoUrl ?? ''),
                          fit: BoxFit.cover)
                      : const CircleAvatar(
                          child: Icon(
                            Icons.production_quantity_limits,
                          ),
                        ),
                ),
              ),
            ),
            Text(
              product.name ?? '',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.clip
              ),
            ),
            SizedBox(height: 30,),
            leftText('Descrição:', product.details ?? '', isDescription: true),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ElevatedButton(
                onPressed: onTapButton,
                child: const Text('Editar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget leftText(String definition, String details, {bool? isDescription}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      crossAxisAlignment: isDescription == true
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          definition,
          maxLines: 4,
          style: TextStyle(fontSize: 14, color: Colors.grey[800],fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 8,),
        SizedBox(
            width: 150,
            child: Text(details,
                maxLines: 4,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]))),
      ],
    ),
  );
}
