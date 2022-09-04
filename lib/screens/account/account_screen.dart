import 'package:shopping_app/routes/app_pages.dart';
import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:shopping_app/widgets/left_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryBackground,
        child: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              children: <Widget>[
                _buildTop(context),
                _buildFunc(context),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: _buildMoreFunc(context),
          ),
          SliverToBoxAdapter(
            child: _buildPerformance(
              context,
            ),
          ),
          SliverToBoxAdapter(
            child: _buildPages(
              context,
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 20.w,
          top: MediaQuery.of(context).padding.top + 20.w,
          bottom: 90.h),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primaryColor, AppColors.primaryColor],
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            // height: 100.sp,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.circular(50),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.sp),
                      topRight: Radius.circular(50.sp),
                      // bottomRight: Radius.circular(50)
                    ),
                  ),
                  child: Icon(IcoFontIcons.businessMan, size: 36.sp),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Buyer Name',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Divider(height: 1),
                      Text('Buyer Address',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 120.w,
            height: 70.h,
            margin: EdgeInsets.only(right: 8.h),
            child: Center(
              child: Container(
                height: 30.h,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.splashColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.sp),
                    topRight: Radius.circular(20.sp),
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(IcoFontIcons.ecoEnergy,
                        color: AppColors.buyNow2, size: 18.sp),
                    Text('Daily check-in',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.normal))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFunc(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 100.h,
          left: 10.w,
          right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: const LeftTitle(
              title: 'My function',
            ),
          ),
          // MyDivider(),
          Container(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(context, IcoFontIcons.brandIcofont, 'Coupon',
                    const Color(0xFF4A4A4A), AppColors.primaryText, () {}),
                _buildIconItem(context, IcoFontIcons.card, 'Wallet',
                    const Color(0xFF4A4A4A), AppColors.primaryText, () {}),
                _buildIconItem(context, IcoFontIcons.saleDiscount, 'Offers',
                    const Color(0xFF4A4A4A), AppColors.primaryText, () {}),
                _buildIconItem(context, IcoFontIcons.support, 'Help',
                    const Color(0xFF4A4A4A), AppColors.primaryText, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreFunc(BuildContext context) {
    Color iconColor = const Color(0xFF505257);
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: const LeftTitle(
              title: 'Tools',
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(context, IcoFontIcons.numbered, 'Orders',
                    iconColor, AppColors.primaryText, () {
                  Navigator.pushNamed(context, Routes.orderList);
                }),
                _buildIconItem(context, IcoFontIcons.basket, 'My Cart',
                    iconColor, AppColors.primaryText, () {
                  Navigator.pushNamed(context, Routes.cart);
                }),
                _buildIconItem(context, IcoFontIcons.list, 'Saved Items',
                    iconColor, AppColors.primaryText, () {
                  Navigator.pushNamed(context, Routes.savedCart);
                }),
                _buildIconItem(context, IcoFontIcons.love, 'Wishlist',
                    iconColor, AppColors.primaryText, () {
                  Navigator.pushNamed(context, Routes.wishlist);
                }),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildIconItem(context, IcoFontIcons.supportFaq, 'FAQs',
                    iconColor, AppColors.primaryText, () {
                  Navigator.pushNamed(context, Routes.faq);
                }),
                _buildIconItem(context, IcoFontIcons.rupeePlus, 'Bank Detail',
                    iconColor, AppColors.primaryText, () {
                  Navigator.pushNamed(context, Routes.bankDetail);
                }),
                _buildIconItem(context, IcoFontIcons.uiMap, 'Address',
                    iconColor, AppColors.primaryText, () {
                  Navigator.pushNamed(context, Routes.shippingAddressList);
                }),
                _buildIconItem(context, Icons.ac_unit, 'History', iconColor,
                    AppColors.primaryText, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

///// Performance Widget
  Widget _buildPerformance(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: LeftTitle(
              title: 'Performance',
              trailing: Text(
                '10 Orders',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryGreyText2),
              ),
            ),
          ),
          // MyDivider(),
          Container(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: perFormanceData.length,
              itemBuilder: (BuildContext context, int index) {
                var data = perFormanceData[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      data['icon'],
                      UIHelper.horizontalSpaceSmall(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['title']),
                          UIHelper.verticalSpaceExtraSmall(),
                          LineChart(
                            percentage: data['value'],
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

///// Pages us Widget
  Widget _buildPages(
    BuildContext context,
  ) {
    return Container(
      margin: EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            child: const LeftTitle(
              title: 'Userful Links',
            ),
          ),
          // MyDivider(),
          Container(
            padding: EdgeInsets.only(
                left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: useFulLinks.length,
              itemBuilder: (BuildContext context, int index) {
                var data = useFulLinks[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // data['icon'],
                          // UIHelper.horizontalSpaceMedium(),
                          Text(
                            data['title'],
                          )
                        ],
                      ),
                      UIHelper.verticalSpaceSmall(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconItem(BuildContext context, IconData iconData, String title,
      Color iconColor, Color textColor, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            color: iconColor,
            size: 28.sp,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: AppColors.primaryGreyText2),
          )
        ],
      ),
    );
  }
}

/////////Performance Data
List perFormanceData = [
  {
    "title": "Under Process",
    "value": 40,
    'icon': Icon(
      IcoFontIcons.settings,
      size: 22.sp,
    )
  },
  {
    "title": "Delivered",
    "value": 60,
    'icon': Icon(
      IcoFontIcons.truck,
      size: 22.sp,
    )
  },
  {
    "title": "Returned",
    "value": 25,
    'icon': Icon(
      IcoFontIcons.recycle,
      size: 22.sp,
    )
  },
  {
    "title": "Cancelled",
    "value": 5,
    'icon': Icon(
      IcoFontIcons.closeCircled,
      size: 22.sp,
    )
  }
];

/// Line Chart maker
class LineChart extends StatelessWidget {
  final int? percentage;
  const LineChart({Key? key, this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor,
          ),
          height: 8.h,
          width: getWidth / 1.25 * percentage! / 100,
        ),
        UIHelper.horizontalSpaceExtraSmall(),
        Text(
          '$percentage%',
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}

////// UseFul Links data
List useFulLinks = [
  {
    'title': 'About Us',
    'icon': Icon(
      IcoFontIcons.qrCode,
      size: 20.sp,
    )
  },
  {
    'title': 'Privacy Policy',
    'icon': Icon(
      IcoFontIcons.shield,
      size: 20.sp,
    )
  },
  {
    'title': 'Terms & Condition',
    'icon': Icon(
      IcoFontIcons.list,
      size: 20.sp,
    )
  },
  {
    'title': 'Refund Policy',
    'icon': Icon(
      IcoFontIcons.rupee,
      size: 20.sp,
    )
  },
  {
    'title': 'Cancellation & Returns',
    'icon': Icon(
      IcoFontIcons.closeCircled,
      size: 20.sp,
    )
  },
  {
    'title': 'Shipping Policy',
    'icon': Icon(
      IcoFontIcons.truckLoaded,
      size: 20.sp,
    )
  }
];
