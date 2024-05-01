import 'package:exporter/data_model/categoryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorieTile extends StatefulWidget {
  CategorieTile({super.key});

  @override
  State<CategorieTile> createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
