import 'package:exporter/data_model/categoryData.dart';
import 'package:exporter/data_model/productModel.dart';
import 'package:exporter/widgets/constants.dart';
import 'package:exporter/widgets/header_row.dart';
import 'package:exporter/widgets/imageSlider.dart';
import 'package:exporter/widgets/productCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int currentSlide = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<List<Product>> selectedCategory = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.8),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              headerRow(),
              Container(
                // margin: const EdgeInsets.symmetric(horizontal: 8),
                // padding: const EdgeInsets.symmetric(horizontal: 8),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xffe7ecf3)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "search products.....",
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.search)),
                      suffixIcon: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: VerticalDivider(
                              width: 2,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.tune)),
                        ],
                      )),
                ),
              ),
              ImageSlider(
                  onChange: (slide) => setState(() {
                        currentSlide = slide;
                      }),
                  currentSlider: currentSlide),
              const SizedBox(
                height: 13,
              ),
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => setState(() {
                      selectedIndex = index;
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectedIndex == index
                              ? Color(0xffced4da)
                              : Colors.transparent),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // clipBehavior: Clip.antiAlias,
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(categories[index].image),
                                    fit: BoxFit.cover)),
                          ),
                          Text(
                            categories[index].title,
                            style: const TextStyle(
                                fontSize: 15.4, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 13,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special for you",
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: kprimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),

              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: selectedCategory.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisExtent: 250,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (_, index) => ProductsCart(
                      product: selectedCategory[selectedIndex][index])),
            ],
          ),
        ),
      ),
    );
  }
}
