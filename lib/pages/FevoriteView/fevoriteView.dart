import 'package:exporter/provider/fevorite/fevoriteProvider.dart';
import 'package:exporter/widgets/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FevoriteScreenView extends StatefulWidget {
  const FevoriteScreenView({super.key});

  @override
  State<FevoriteScreenView> createState() => _FevoriteScreenViewState();
}

class _FevoriteScreenViewState extends State<FevoriteScreenView> {
  @override
  Widget build(BuildContext context) {
    final provider = FevoriteProvider.of(context);
    final finalList = provider.fevorite;
    return Scaffold(
      backgroundColor: const Color(0xffdee2e6),
      appBar: AppBar(
        title: Text(
          "Fevorite",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffdee2e6),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    final fevoriteItems = finalList[index];
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(fevoriteItems.image),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fevoriteItems.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.deepOrange),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    fevoriteItems.category,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "\$${fevoriteItems.price}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 60,
                          right: 20,
                          child: IconButton(
                              onPressed: () {
                                finalList.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete_forever_outlined,
                                size: 26,
                                color: Colors.deepOrange,
                              )),
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
