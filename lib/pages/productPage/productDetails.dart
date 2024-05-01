import 'package:exporter/data_model/productModel.dart';
import 'package:exporter/provider/cart/cartProvider.dart';
import 'package:exporter/provider/fevorite/fevoriteProvider.dart';
import 'package:exporter/widgets/addToCartButton.dart';
import 'package:exporter/widgets/constants.dart';
import 'package:exporter/widgets/detailImageSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailView extends StatefulWidget {
  final Product? product;
  ProductDetailView({super.key, required this.product});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  int currentImage = 0;
  int currentSlider = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final provider = CartProvider.of(context);
    final fevProvider = FevoriteProvider.of(context);
    return Scaffold(
      backgroundColor: const Color(0xfff8f9fa),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(.6)),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_sharp))),
                      Row(
                        children: [
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(.6)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share))),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(.6)),
                              child: IconButton(
                                  onPressed: () {
                                    fevProvider.toggleFevorite(widget.product!);
                                  },
                                  icon: Icon(
                                    fevProvider.isExist(widget.product!)
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
                DetailImageSlider(
                    onChange: (index) => setState(() {
                          currentImage = index;
                        }),
                    image: widget.product!.image),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                      (index) => AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: currentImage == index ? 15 : 8,
                            height: 8,
                            margin: const EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: currentImage == index
                                  ? kprimaryColor
                                  : Colors.grey,
                              // border: Border.all(color: Colors.black)
                            ),
                          )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Container(
                      // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      // height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: Color(0xffdee2e6)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.product!.title,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.5,
                              ),
                            ),
                            Text(
                              "\$${widget.product!.price}",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 18.5,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.deepOrangeAccent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        widget.product!.rate.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  widget.product!.review,
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Colors",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: List.generate(
                                  widget.product!.colors.length,
                                  (index) => GestureDetector(
                                        onTap: () => setState(() {
                                          currentColor = index;
                                        }),
                                        child: AnimatedContainer(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          duration: Duration(milliseconds: 300),
                                          width: 35,
                                          height: 35,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: currentColor == index
                                                  ? Colors.white
                                                  : all.first.colors[index],
                                              border: currentColor == index
                                                  ? Border.all(
                                                      color: all
                                                          .first.colors[index])
                                                  : null),
                                        ),
                                      )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.deepOrangeAccent),
                                    child: Text(
                                      "Description",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.6),
                                    )),
                                Text(
                                  "Specifications",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.6),
                                ),
                                Text(
                                  "Reviews",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.6),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(widget.product!.description),
                            const SizedBox(
                              height: 80,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Seller:",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          Text(
                            "CodeWithMaxx",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              bottom: 12,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AddToCartButton(
                  product: widget.product!,
                ),
              ))
        ],
      ),
    );
  }
}
