import 'package:ecom_thin_ui/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFilterWidget extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10.h, right: 10.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Container(
                height: 30.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    child: DropdownButton<String>(
                      hint: Text('Categories',
                          style: Theme.of(context).textTheme.subtitle2),
                      iconEnabledColor: Colors.black,
                      // value: "Mens", //Initial Value

                      /// Initial Value
                      items: <String>['Mens', 'Womens', 'Kids', 'Appliances']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: Theme.of(context).textTheme.subtitle2));
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Container(
                  height: 30.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 10.h),
                      child: Center(
                        child: Row(
                          children: [
                            Text('Filter',
                                style: Theme.of(context).textTheme.subtitle2),
                            UIHelper.horizontalSpaceExtraSmall(),
                            Icon(
                              Icons.filter_list_rounded,
                              size: 20.sp,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Container(
                height: 30.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.h, right: 10.h),
                    child: DropdownButton<String>(
                      hint: Text('Sort by',
                          style: Theme.of(context).textTheme.subtitle2),
                      icon: Icon(
                        Icons.trending_down,
                        size: 20.sp,
                        color: Colors.black,
                      ),
                      // value: "Mens", //Initial Value

                      /// Initial Value
                      items: <String>[
                        'Low to high',
                        'High to low',
                        'Popularity'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: Theme.of(context).textTheme.subtitle2));
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Container(
                  height: 30.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 10.h),
                      child: Center(
                        child: Row(
                          children: [
                            Text('View all',
                                style: Theme.of(context).textTheme.subtitle2),
                            // UIHelper.horizontalSpaceExtraSmall(),
                            // Icon(
                            //   Icons.trending_down,
                            //   size: 20.sp,
                            // )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50.h;

  @override
  double get minExtent => 50.h;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
