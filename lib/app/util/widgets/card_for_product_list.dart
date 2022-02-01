import 'package:flutter/material.dart';

class CardForProductList extends StatelessWidget {
  final String? photoUrl;
  final String? title;
  final String? subTitle;
  final double? heigth;
  final double? width;
  final double? photoHeight;
  final double? photoWidth;
  final double? borderRadius;
  final String? price;
  final String? ratingNumber;
  final Color? backgroundColor;
  final void Function()? onTapIcon;

  const CardForProductList(
      {Key? key,
      this.heigth,
      this.width,
      this.borderRadius,
      this.backgroundColor,
      this.photoHeight,
      this.photoWidth,
      this.photoUrl,
      this.title,
      this.subTitle,
      this.onTapIcon,
      this.ratingNumber,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        width: width ?? double.infinity,
        height: heigth,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          boxShadow: const [
            BoxShadow(
              blurRadius: 0,
              spreadRadius: 0,
              color: Colors.grey,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: CircleAvatar(
                  radius: 30,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 170,
                    child: Text(
                      title ?? '',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 5),
                    child: SizedBox(
                      width: 170,
                      child: Text(
                        subTitle ?? '',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTapIcon,
                      child: const Icon(
                        Icons.more_horiz_sharp,
                        size: 22,
                      ),
                    ),
                    //  const SizedBox(height: 12,),
                    // Text(
                    //   'R\$ $price',
                    //   style: const TextStyle(fontSize: 16),
                    //   textDirection: TextDirection.rtl,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
