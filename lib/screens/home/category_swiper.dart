import 'package:ecom_thin_ui/theme/device_size_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/categories_model.dart';
import '../../theme/styles.dart';
import '../../widgets/index.dart';

class CategorSwiper extends StatelessWidget {
  final List<Categories>? categories;
  const CategorSwiper({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(15),
      color: AppColors.primaryColor,
      padding: const EdgeInsets.only(top: 8.0, right: 0, bottom: 2.0, left: 0),
      child: Column(
        children: <Widget>[
          const LeftTitle(
            title: 'Top Categories',
          ),
          Container(
            height: 85.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories!.length,
              itemBuilder: (context, index) {
                Categories category = categories![index];
                return _buildBrandItem(context, category);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBrandItem(BuildContext context, Categories category) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: EdgeInsets.only(right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 45.0.h,
              width: 45.0.w,
              padding: const EdgeInsets.all(8),
              child: SvgImage(
                imageurl: category.image!,
              ),
            ),
            Text(
              "${category.name}",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.normal, letterSpacing: -.5),
            ),
          ],
        ),
      ),
    );
  }
}
