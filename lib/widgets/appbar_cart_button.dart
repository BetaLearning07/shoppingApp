import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class AppBarShopCartIconButton extends StatelessWidget {
  const AppBarShopCartIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.fromLTRB(6, 6, 8, 6),
      icon: Stack(
        children: <Widget>[
          Center(
            // child: Image.asset('assets/images/home/gouwuche.png',
            //     width: 22, height: 22),
            child: Icon(
              IcoFontIcons.cart,
              size: 20.sp,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: _badgeWidget('12'),
          )
        ],
      ),
      onPressed: null,
    );
  }

  Container _badgeWidget(String count) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(width: 1.5.w, color: Colors.white),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 14),
        child: Container(
          height: 14,
          padding: EdgeInsets.only(
              left: 4.w, right: 4.w, bottom: Platform.isIOS ? 1 : 0),
          decoration: BoxDecoration(
            color: const Color(0xFFB80821),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              count,
              style: const TextStyle(color: Colors.white, fontSize: 9),
            ),
          ),
        ),
      ),
    );
  }
}
