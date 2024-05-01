import 'package:exporter/data_model/productModel.dart';
import 'package:exporter/provider/cart/cartProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AddToCartButton extends StatefulWidget {
  final Product product;
  const AddToCartButton({super.key, required this.product});

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      height: 70,
      width: 440,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.black),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: 45,
            width: 140,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      if (currentIndex != 1) {
                        setState(() {
                          currentIndex--;
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
                Text(
                  currentIndex.toString(),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                IconButton(
                    onPressed: () => setState(() {
                          currentIndex++;
                        }),
                    icon: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              provider.toggleFevorite(widget.product);
              Get.snackbar("Add to Cart", "Item Successfully added to cart",
                  duration: Duration(seconds: 1));
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.deepOrange),
              child: Text(
                "Add To Cart",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
