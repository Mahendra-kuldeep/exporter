import 'package:exporter/data_model/productModel.dart';
import 'package:exporter/pages/productPage/productDetails.dart';
import 'package:exporter/provider/fevorite/fevoriteProvider.dart';
import 'package:exporter/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsCart extends StatelessWidget {
  final Product product;
  const ProductsCart({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FevoriteProvider.of(context);
    return GestureDetector(
      onTap: () => Get.to(ProductDetailView(product: product)),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: kcontentColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Hero(
                    tag: product.image,
                    child: Image.asset(
                      product.image,
                      height: 130,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    product.title,
                    style: GoogleFonts.prompt(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Row(
                      children: List.generate(
                          product.colors.length,
                          (index) => Container(
                                height: 18,
                                width: 18,
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: product.colors[index]),
                              )),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(10)),
                    color: Colors.deepOrange),
                child: IconButton(
                    onPressed: () {
                      provider.toggleFevorite(product);
                    },
                    icon: Icon(
                      provider.isExist(product)
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: Colors.white,
                    )),
              ))
        ],
      ),
    );
  }
}
