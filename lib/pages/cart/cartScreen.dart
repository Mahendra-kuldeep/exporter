import 'package:exporter/provider/cart/cartProvider.dart';
import 'package:exporter/provider/cart/checkOut.dart';
import 'package:exporter/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreenView extends StatefulWidget {
  const CartScreenView({super.key});

  @override
  State<CartScreenView> createState() => _CartScreenViewState();
}

class _CartScreenViewState extends State<CartScreenView> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    productQuantity(IconData icon, int index) {
      return GestureDetector(
        onTap: () => setState(() {
          icon == Icons.add
              ? provider.increamentQtn(index)
              : provider.decrementQtn(index);
        }),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffe9ecef),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(.6)),
                    child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios_new_sharp))),
                Text(
                  "Cart List",
                  style: GoogleFonts.prompt(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: kcontentColor,
                  ),
                  child: IconButton(
                      onPressed: () => setState(() {
                            CheckOutBox(context);
                          }),
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.deepOrange,
                        size: 30,
                      )),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: finalList.length,
                    itemBuilder: (_, index) {
                      final cartItems = finalList[index];
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Stack(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          height: 100,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: kcontentColor),
                                          child: Image.asset(cartItems.image),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cartItems.title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  color: Colors.deepOrange),
                                            ),
                                            Text(
                                              cartItems.category,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Text(
                                              "\$${cartItems.price}",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 15,
                                    right: 15,
                                    child: IconButton(
                                        onPressed: () {
                                          finalList.removeAt(index);
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.delete_forever_outlined,
                                          color: Colors.deepOrange,
                                        ))),
                                Positioned(
                                  bottom: 15,
                                  right: 20,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 7),
                                    height: 45,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xffdee2e6)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                            onPressed: () => setState(() {
                                                  provider.decrementQtn(index);
                                                }),
                                            icon: const Icon(Icons.remove)),
                                        Text(
                                          cartItems.quantity.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        IconButton(
                                            onPressed: () => setState(() {
                                                  provider.increamentQtn(index);
                                                }),
                                            icon: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }))
          ],
        ),
      )),
      // bottomSheet: CheckOutBox(),
    );
  }
}
