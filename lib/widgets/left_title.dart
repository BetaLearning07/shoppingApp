import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/styles.dart';

class LeftTitle extends StatelessWidget {
  final Color? tipColor;
  final String title;
  final String? subtitile;
  final Widget? trailing;
  const LeftTitle({
    Key? key,
    this.tipColor,
    required this.title,
    this.subtitile,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  color: tipColor ?? AppColors.black,
                  width: 5.w,
                  height: 20.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    subtitile == null || subtitile == ""
                        ? const SizedBox.shrink()
                        : Text(
                            subtitile!,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryGreyText2),
                          )
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(right: 4.0),
              decoration: const BoxDecoration(
                // color: AppColors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                    bottomLeft: Radius.circular(40.0)),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(
                      right: 0.0, left: 8.0, top: 4, bottom: 4),
                  child: trailing ?? const SizedBox.shrink()),
            ),
          ],
        ),
      ),
    );
  }
}
