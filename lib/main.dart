import 'package:exporter/pages/navBarFeatures/NavBar.dart';
import 'package:exporter/provider/cart/cartProvider.dart';
import 'package:exporter/provider/fevorite/fevoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FevoriteProvider())
      ],
      child: ScreenUtilInit(
        child: GetMaterialApp(
          // theme: ThemeData(scaffoldBackgroundColor: const Color(0xfff8f9fa)),
          debugShowCheckedModeBanner: false,
          home: BottomNavBar(),
        ),
      ),
    );
  }
}
