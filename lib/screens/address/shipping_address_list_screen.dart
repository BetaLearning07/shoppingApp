import 'package:shopping_app/routes/app_pages.dart';
import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../theme/device_size_helper.dart';
import '../../widgets/no_data_found.dart';

GlobalKey<FormState>? _menuKey;

class ShippingAddressListScreen extends StatelessWidget {
  const ShippingAddressListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: AppColors.primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.addShippingAddress);
          },
          child: SizedBox(
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 25.sp,
                ),
                Text(
                  'Create Address',
                  style: Theme.of(context).textTheme.button,
                )
              ],
            ),
          ),
        ),
      ),
      body: const CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Text(
              'Shipping Address',
            ),
          ),
          SliverToBoxAdapter(
            child: AddressList(),
          )
        ],
      ),
    );
  }
}

class AddressList extends StatelessWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return shippingAddressLis['addresses'].length == 0
        ? const NoDataFound(
            title: 'No address found',
          )
        : ListView.builder(
            padding: EdgeInsets.only(top: 5.h),
            shrinkWrap: true,
            itemCount: shippingAddressLis['addresses'].length,
            itemBuilder: (BuildContext context, int index) {
              _menuKey = GlobalKey<FormState>();
              var data = shippingAddressLis['addresses'][index];
              return Stack(
                children: [
                  Card(
                    elevation: .5,
                    margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
                      width: getWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Icon(IcoFontIcons.home, size: 20.sp)),
                          UIHelper.horizontalSpaceSmall(),
                          Expanded(
                            flex: 11,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['ship_to'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryGreyText3),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  data['address'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: AppColors.primaryGreyText2),
                                ),
                                Text(
                                  "${data['locality']}, ${data['city']}, ${data['state']}-${data['pincode']}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: AppColors.primaryGreyText2),
                                ),
                                Text(
                                    data['alt_phone'] == ""
                                        ? "Phone No. ${data['phone']}"
                                        : "Phone No. ${data['phone']}, ${data['alt_phone']}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            color: AppColors.primaryGreyText2))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 3,
                      top: 0,
                      child: PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          size: 15.sp,
                        ),
                        key: _menuKey,
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                          PopupMenuItem(
                            child: const Text('Edit'),
                            onTap: () async {
                              await Future.delayed(Duration.zero);
                              Navigator.pushNamed(
                                  context, Routes.editShippingAddress);
                            },
                          ),
                          const PopupMenuItem<String>(
                            enabled: true,
                            child: Text('Remove'),
                          ),
                        ],
                        // onSelected: (itm) {
                        //   if (itm == 'Edit') {
                        //   } else if (itm == 'Remove') {}
                        // },
                      )),
                  Visibility(
                    visible: data['default_address'],
                    child: Positioned(
                        right: 10,
                        bottom: 10,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 8.w, right: 8.w, top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              border:
                                  Border.all(color: AppColors.primaryColor)),
                          child: Text(
                            '✓ Default',
                            style: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(letterSpacing: .2),
                          ),
                        )),
                  )
                ],
              );
            },
          );
  }
}

Map shippingAddressLis = {
  "status_code": 202,
  "addresses": [
    {
      "id": 3063,
      "ship_to": "Rahul Singha",
      "locality": "Dalkhola",
      "address": "Dalkhola, Near Bus Stand, ",
      "city": "Islampur",
      "state": "West Bengal",
      "pincode": "734009",
      "phone": "8569422535",
      "alt_phone": "9354631445",
      "default_address": true
    },
    {
      "id": 2931,
      "ship_to": "The Man Company ",
      "locality": "nsnskdjd",
      "address": "Gurung Busty, Ganesh More",
      "city": "Siliguri ",
      "state": "West Bengal ",
      "pincode": "734008",
      "phone": "6295135455",
      "alt_phone": "",
      "default_address": false
    },
    {
      "id": 3055,
      "ship_to": "Suman Poudel ",
      "locality": "Pradhan Nagar, Pokhaijote, Agartala",
      "address": "jaiswal mansion ",
      "city": "Siliguri",
      "state": "West Bengal",
      "pincode": "734001",
      "phone": "8016086948",
      "alt_phone": "",
      "default_address": false
    },
    {
      "id": 3062,
      "ship_to": "Suman Dada ",
      "locality": "Gurung Basti ",
      "address": "Jaiswal Mansion ",
      "city": "Siliguri",
      "state": "West Bengal",
      "pincode": "734001",
      "phone": "6295356848",
      "alt_phone": "",
      "default_address": false
    }
  ],
  "total_address": 4,
  "current_page": 1,
  "total_pages": 1
};
