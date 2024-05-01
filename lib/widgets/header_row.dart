import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class headerRow extends StatelessWidget {
  const headerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: 50.h,
              width: 50.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffe7ecf3)),
              child: const Icon(
                Icons.menu_open,
                size: 30,
              )),
          Container(
              height: 50.h,
              width: 50.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffe7ecf3)),
              child: const Icon(
                Icons.notification_add_outlined,
                size: 30,
              )),
        ],
      ),
    );
  }
}
