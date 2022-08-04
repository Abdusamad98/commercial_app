import 'package:cached_network_image/cached_network_image.dart';
import 'package:commercial_app/models/products/product_item.dart';
import 'package:commercial_app/utils/utils/colors.dart';
import 'package:commercial_app/utils/utils/icons.dart';
import 'package:commercial_app/utils/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem(
      {Key? key, required this.productItem, required this.onTap})
      : super(key: key);

  final ProductItem productItem;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade400,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(MyIcons.blackLike),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(imageUrl: productItem.image),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MyColors.C_E5E5E5.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      productItem.title,
                      style: MyTextStyle.poppins600.copyWith(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      "\$${productItem.price.toString()}",
                      style: MyTextStyle.poppins800
                          .copyWith(fontSize: 14, letterSpacing: 0.8),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
