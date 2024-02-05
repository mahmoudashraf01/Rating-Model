import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_model/methods/navigation.dart';
import 'package:rating_model/models/product_model.dart';
import 'package:rating_model/pages/update_product.dart';
import 'package:rating_model/widgets/colors.dart';
import 'package:rating_model/widgets/icons.dart';
import 'package:rating_model/widgets/text.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.productModle,
  });

  final ProductModle2 productModle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goTo(
          context: context,
          routName: UpdateProductPage.id,
          argument: productModle,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(2, 2),
                  color: grey.withOpacity(0.2),
                )
              ],
            ),
            child: Card(
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productModle.title,
                      style: title1.merge(
                        TextStyle(
                          color: grey,
                        ),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${productModle.price}', style: title1Bold),
                        MyIcon(
                          icon: FontAwesomeIcons.solidHeart,
                          iconColor: ligthRed,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 100,
            child: SizedBox(
              width: 120,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  productModle.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
