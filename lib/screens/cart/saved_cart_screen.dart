import 'package:ecom_thin_ui/theme/colors.dart';
import 'package:ecom_thin_ui/theme/ui_helper.dart';
import 'package:ecom_thin_ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/no_data_found.dart';

GlobalKey<FormState>? _menuKey;

class SavedCartScreen extends StatelessWidget {
  const SavedCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: const Text(
              'Saved Items',
            ),
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                key: _menuKey,
                itemBuilder: (_) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    onTap: () async {},
                    child: const Text('Remove All'),
                  ),
                ],
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [CartItems()])),
        ],
      ),
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return cartData['cart_items'].length == 0
        ? const NoDataFound(
            title: 'No saved items found',
          )
        : Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.only(top: 5.h),
                shrinkWrap: true,
                itemCount: cartData['cart_items'].length,
                itemBuilder: (BuildContext context, int index) {
                  var data = cartData['cart_items'][index];

                  return Card(
                    elevation: .5,
                    margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: HostedImage(
                                    imageurl: data['image'], asdpectRatio: 1),
                              ),
                              UIHelper.horizontalSpaceSmall(),
                              Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['product_title'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    AppColors.primaryGreyText3),
                                      ),
                                      ListView.builder(
                                        padding: EdgeInsets.only(
                                            top: 8.h, bottom: 8.h),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: data['attributes'].length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var attData =
                                              data['attributes'][index];
                                          return Row(
                                            children: [
                                              Expanded(
                                                  flex: 4,
                                                  child: Text(attData['name'],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primaryGreyText2,
                                                              letterSpacing:
                                                                  .1))),
                                              UIHelper
                                                  .verticalSpaceExtraSmall(),
                                              Expanded(
                                                  flex: 6,
                                                  child: Text(attData['values'],
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primaryGreyText2,
                                                              letterSpacing:
                                                                  .1)))
                                            ],
                                          );
                                        },
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 5,
                                              child: Text('MOQ: 10',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          color: AppColors
                                                              .primaryGreyText2,
                                                          letterSpacing: .1))),
                                          Expanded(
                                              flex: 5,
                                              child: Text('₹225/Pcs',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          color: AppColors
                                                              .primaryGreyText2,
                                                          letterSpacing: .1))),
                                          Expanded(
                                              flex: 5,
                                              child: Text('Total: ₹9000',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle2!
                                                      .copyWith(
                                                          color:
                                                              AppColors.black,
                                                          letterSpacing: .1))),
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 18.h,
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0.sp),
                                                    side: const BorderSide(
                                                        color: Color.fromARGB(
                                                            255,
                                                            194,
                                                            194,
                                                            194)))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        child: Text(
                                          'Move to cart',
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline!
                                              .copyWith(
                                                  color: AppColors.black,
                                                  letterSpacing: .1),
                                        ),
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceLarge(),
                                    SizedBox(
                                      height: 18.h,
                                      child: ElevatedButton(
                                        onPressed: null,
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0.sp),
                                                    side: const BorderSide(
                                                        color: Color.fromARGB(
                                                            255,
                                                            194,
                                                            194,
                                                            194)))),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.transparent)),
                                        child: Text(
                                          'Remove',
                                          style: Theme.of(context)
                                              .textTheme
                                              .overline!
                                              .copyWith(
                                                  color: AppColors.black,
                                                  letterSpacing: .1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        style: BorderStyle.solid,
                                        width: .7,
                                        color: AppColors.primaryGreyText5),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5.sp)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            // border: Border.all(
                                            //     style: BorderStyle.solid,
                                            //     color: AppColors.primaryGreyText5)
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.h),
                                                bottomLeft:
                                                    Radius.circular(4.h))),
                                        child: Center(
                                          child:
                                              Icon(Icons.remove, size: 20.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        height: 20.h,
                                        width: 35.w,
                                        child: TextFormField(
                                          initialValue: '50',
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          enabled: false,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        )),
                                    InkWell(
                                      onTap: null,
                                      child: Container(
                                        height: 30.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            // border: Border.all(
                                            //     style: BorderStyle.solid,
                                            //     color: AppColors.primaryGreyText5)
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(4.h),
                                                bottomRight:
                                                    Radius.circular(4.h))),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          UIHelper.verticalSpaceSmall(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
  }
}

Map cartData = {
  "status_code": 200,
  "place_order_button": true,
  "message": "Go to checkout page",
  "cart_items": [
    {
      "id": 76937,
      "user_id": 1,
      "product_id": 11682,
      "product_title": "Round Neck Half Sleeves Printed T-Shirts for Men",
      "product_description": "printed half sleeve t-shirt ",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0911-4338-c50ad0b1-8ed5-4aef-9803-bb481e590aa22022-09-43-Jul-1657347218.jpg",
      "quantity": 10,
      "moq": 10,
      "unit": "Pcs",
      "price": "140.44",
      "tax": 5,
      "total": "1404.40",
      "stock": true,
      "total_stock": 10,
      "out_of_quantity": false,
      "message": "",
      "unlimited": false,
      "attributes": [
        {"name": "Color", "values": "Mixed Color"},
        {"name": "Clothing Size", "values": "M"}
      ],
      "uuid": "sku-15192-variable-10",
      "hsn_code": "6109",
      "created_at": "2022-07-18"
    },
    {
      "id": 76936,
      "user_id": 1,
      "product_id": 8881,
      "product_title": "Kids Boys Top and Bottom Sets",
      "product_description": "100% Cotton Fabric\r\nPacking type:- Box packing",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/621f48c51143f_621f0ebde7b5f_713270749-removebg-preview-thumbnail.jpg",
      "quantity": 6,
      "moq": 6,
      "unit": "Pcs",
      "price": "384.02",
      "tax": 5,
      "total": "2304.12",
      "stock": true,
      "total_stock": 0,
      "out_of_quantity": false,
      "message": "",
      "unlimited": true,
      "attributes": [
        {"name": "Color", "values": "Maroon, Mustard"},
        {"name": "Clothing Size", "values": "22, 24, 26"}
      ],
      "uuid": "sku-11528-variable-1",
      "hsn_code": "611120",
      "created_at": "2022-07-18"
    },
    {
      "id": 76935,
      "user_id": 1,
      "product_id": 8881,
      "product_title": "Kids Boys Top and Bottom Sets",
      "product_description": "100% Cotton Fabric\r\nPacking type:- Box packing",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/621f48c51143f_621f0ebde7b5f_713270749-removebg-preview-thumbnail.jpg",
      "quantity": 6,
      "moq": 6,
      "unit": "Pcs",
      "price": "362.08",
      "tax": 5,
      "total": "2172.48",
      "stock": true,
      "total_stock": 0,
      "out_of_quantity": false,
      "message": "",
      "unlimited": true,
      "attributes": [
        {"name": "Color", "values": "Maroon, Mustard"},
        {"name": "Clothing Size", "values": "16, 18, 20"}
      ],
      "uuid": "sku-11522-variable-1",
      "hsn_code": "611120",
      "created_at": "2022-07-18"
    }
  ],
  "total_amount": "5881.00",
  "total_items": 3
};
