import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/styles.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:shopping_app/widgets/hosted_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../widgets/timeline.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              title: Text(
                'Order Detail',
                style: Theme.of(context).textTheme.headline3,
              )),
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceExtraSmall(),
              const AddressWidget(),
              const TrackOrder(),
              const OrderStatusStepper(),
              const ItemDetail(),
              const DownloadInvoice(),
              const OrderSummary(),
            ],
          )),
        ],
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Container(
        padding:
            EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
        width: getWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Icon(IcoFontIcons.home, size: 20.sp)),
            UIHelper.horizontalSpaceSmall(),
            Expanded(
              flex: 11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Address',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGreyText3),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Shop: Rajdhani Garments',
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGreyText2),
                  ),
                  Text(
                    'Bidhan Road, Gauri Shankar, Siliguri - 734001',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: AppColors.primaryGreyText2),
                  ),
                  Text('Phone No. 9354631445',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.primaryGreyText2))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Container(
          width: getWidth,
          padding:
              EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Icon(
                    IcoFontIcons.cube,
                    size: 20.sp,
                  )),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                flex: 11,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ORD-A254AMSKAHSSS',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryGreyText3),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Method',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryGreyText2),
                          ),
                          Text(
                            'Online',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryGreyText3),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryGreyText2),
                          ),
                          Text(
                            '2',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryGreyText3),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item Total Amount',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryGreyText2),
                          ),
                          Text(
                            '1230.00',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryGreyText3),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Charge',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryGreyText2),
                          ),
                          Text(
                            '0.00',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryGreyText3),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Round Off',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryGreyText2),
                          ),
                          Text(
                            '0.44',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryGreyText3),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grand Total',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryGreyText3),
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: '₹ 56325',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryGreyText3),
                            ),
                            TextSpan(
                              text: '.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryGreyText3),
                            ),
                          ])),
                        ],
                      )
                    ]),
              ),
            ],
          )),
    );
  }
}

class OrderStatusStepper extends StatelessWidget {
  const OrderStatusStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var status = orderDetail['order_status'];
    return Card(
        elevation: .5,
        margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: Timeline(
            gutterSpacing: 10.w,
            padding: EdgeInsets.all(8.sp),
            indicators: <Widget>[
              for (int i = 0; i < status!.length; i++)
                Opacity(
                    opacity: status[i]['visible'] == false ? .6 : 1,
                    child: icon[i]),
            ],
            children: <Widget>[
              for (int i = 0; i < orderDetail['order_status'].length; i++)
                Opacity(
                  opacity: status[i]['visible'] == false ? .6 : 1,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  status![i]['status_title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                // UIHelper.horizontalSpaceMedium(),
                              ],
                            ),
                            Text(status[i]['message']),
                            status![i]['visible']
                                ? Text(
                                    status![i]['created_at'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontStyle: FontStyle.italic),
                                  )
                                : Text(
                                    'Processing...',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(fontStyle: FontStyle.italic),
                                  ),
                          ],
                        ),
                      ]),
                ),
            ],
          ),
        ));
  }
}

class ItemDetail extends StatelessWidget {
  const ItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Container(
          padding:
              EdgeInsets.only(top: 0.h, bottom: 0.h, left: 0.w, right: 8.w),
          width: getWidth,
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              initiallyExpanded:
                  orderDetail['order_items'].length == 1 ? true : false,
              iconColor: AppColors.black,
              tilePadding: EdgeInsets.only(left: 8.w),
              title: Row(
                children: [
                  Expanded(
                      flex: 1, child: Icon(IcoFontIcons.package, size: 20.sp)),
                  UIHelper.horizontalSpaceSmall(),
                  Expanded(
                    flex: 11,
                    child: Text(
                      'Item Detail',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryGreyText3),
                    ),
                  ),
                ],
              ),
              children: [
                ListView.builder(
                  padding: EdgeInsets.only(top: 15.h, left: 8.w, right: 8.w),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orderDetail['order_items'].length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = orderDetail['order_items'][index];
                    return Theme(
                      data: Theme.of(context).copyWith(
                          dividerColor:
                              const Color.fromARGB(255, 219, 219, 219)),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: HostedImage(
                                    imageurl: data['product_image'],
                                    asdpectRatio: 1),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    AppColors.primaryGreyText3),
                                      ),
                                      UIHelper.verticalSpaceSmall(),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text("₹${data['price']}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryGreyText2,
                                                        letterSpacing: .1)),
                                          ),
                                          Expanded(
                                            child:
                                                Text.rich(TextSpan(children: [
                                              TextSpan(
                                                  text: data['item_quantity'],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .primaryGreyText2,
                                                          letterSpacing: .1)),
                                            ])),
                                          ),
                                          Expanded(
                                            child:
                                                Text.rich(TextSpan(children: [
                                              TextSpan(
                                                  text: "₹${data['total']}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .primaryGreyText2,
                                                          letterSpacing: .1)),
                                            ])),
                                          ),
                                        ],
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
                                                  flex: 5,
                                                  child: Text(attData['name'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primaryGreyText2,
                                                              letterSpacing:
                                                                  .1))),
                                              Expanded(
                                                  flex: 5,
                                                  child: Text(attData['values'],
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
                                    ],
                                  )),
                            ],
                          ),
                          UIHelper.verticalSpaceExtraSmall(),
                          data['status_title'] == ""
                              ? const SizedBox.shrink()
                              : Row(
                                  children: [
                                    Expanded(
                                        flex: 8,
                                        child: Text(
                                          "${data['message']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        )),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          data['status_title'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(color: AppColors.red),
                                        ))
                                  ],
                                ),
                          index != orderDetail['order_items'].length - 1
                              ? const Divider(
                                  thickness: .7,
                                )
                              : const SizedBox.shrink(),
                          UIHelper.verticalSpaceExtraSmall(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}

class DownloadInvoice extends StatelessWidget {
  const DownloadInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return orderDetail['download_invoice'] == ""
        ? const SizedBox.shrink()
        : Card(
            elevation: .5,
            margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
            child: Container(
              padding: EdgeInsets.only(
                  top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
              width: getWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: Icon(Icons.receipt, size: 20.sp)),
                  UIHelper.horizontalSpaceSmall(),
                  Expanded(
                    flex: 11,
                    child: Text(
                      'Download Invoice',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryGreyText3),
                    ),
                  ),
                  const InkWell(onTap: null, child: Icon(Icons.download))
                ],
              ),
            ),
          );
  }
}

class TrackOrder extends StatelessWidget {
  const TrackOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return orderDetail['order_tracking']['visible']
        ? Card(
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
                      child: Icon(IcoFontIcons.truckLoaded, size: 20.sp)),
                  UIHelper.horizontalSpaceSmall(),
                  Expanded(
                    flex: 11,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Details',
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
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Text('Shipping Partner',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .primaryGreyText3,
                                                      letterSpacing: .1))),
                                      Expanded(
                                          flex: 5,
                                          child: Text('Delhivery Ltd.',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryGreyText2,
                                                      letterSpacing: .1)))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Text('Tracking ID',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .primaryGreyText3,
                                                      letterSpacing: .1))),
                                      Expanded(
                                          flex: 5,
                                          child: SelectableText(
                                              '50195001252149',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      color: AppColors
                                                          .primaryGreyText2,
                                                      letterSpacing: .1)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: InkWell(
                                  onTap: null,
                                  child: Text(
                                    'Track Order',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue),
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

List icon = [
  Icon(
    IcoFontIcons.archive,
    size: 20.sp,
  ),
  Icon(IcoFontIcons.settingsAlt, size: 20.sp),
  Icon(IcoFontIcons.package, size: 20.sp),
  Icon(IcoFontIcons.truckLoaded, size: 20.sp),
  Icon(IcoFontIcons.truck, size: 20.sp),
];

Map orderDetail = {
  "status_code": 200,
  "download_invoice": "sss",
  "order": {
    "id": 10638,
    "reff": "ASEZ8322U1",
    "order_number": "ORD-5A3F2704E58D4",
    "message": "",
    "image": "",
    "invoice": "ASEZ-19",
    "delivery_expected": "",
    "created_at": "15 Jul 2022",
    "current_status": {
      "status_id": 40,
      "status_title": "Packed",
      "message": "Your item has been packed.",
      "visible": true,
      "created_at": "July 15 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  "order_summary": [
    {
      "name": "Payment Method",
      "value": "COD",
      "currency": false,
      "visible": true
    },
    {"name": "No of Items", "value": "4", "currency": false, "visible": true},
    {
      "name": "Item Total Amount",
      "value": "4300.96",
      "currency": true,
      "visible": true
    },
    {
      "name": "Cancel Items (-)",
      "value": "0.00",
      "currency": true,
      "visible": false
    },
    {
      "name": "Return Items (-)",
      "value": "0.00",
      "currency": true,
      "visible": false
    },
    {
      "name": "Discount (-)",
      "value": "0.00",
      "currency": true,
      "visible": false
    },
    {
      "name": "Shipping Charge",
      "value": "0.00",
      "currency": true,
      "visible": true
    },
    {"name": "Round Off", "value": "-0.04", "currency": true, "visible": true}
  ],
  "grand_total": {
    "name": "Grand Total",
    "value": "4301.00",
    "currency": true,
    "visible": true
  },
  "order_items": [
    {
      "id": 16896,
      "status": 10,
      "status_title": "",
      "message": "",
      "return_period": "",
      "checkbox": false,
      "product_id": 11716,
      "product_title": "Casual Wear Cute T-Shirt and Pant Set AON-5",
      "product_description": "Clothing Varieties your customers will like",
      "product_image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1314-0145-07f3d67b-5e67-4c89-b0f6-a1b42457a5f12022-13-01-Jul-1657701105.png",
      "product_deleted": false,
      "price": "268.81",
      "item_quantity": "4 Pcs",
      "total": "1075.24",
      "attributes": [
        {"name": "Color", "values": "Sky"},
        {"name": "Clothing Size", "values": "M, L, XL, XXL"}
      ]
    },
    {
      "id": 16897,
      "status": 10,
      "status_title": "",
      "message": "",
      "return_period": "",
      "checkbox": false,
      "product_id": 11715,
      "product_title": "Casual Wear Cute T-Shirt and Pant Set AON-4",
      "product_description": "Clothing Varieties your customers will like",
      "product_image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1313-5505-df1aec19-f095-4b54-ae49-105d28ee83bb2022-13-55-Jul-1657700705.png",
      "product_deleted": false,
      "price": "268.81",
      "item_quantity": "4 Pcs",
      "total": "1075.24",
      "attributes": [
        {"name": "Color", "values": "Beige"},
        {"name": "Clothing Size", "values": "M, L, XL, XXL"}
      ]
    },
    {
      "id": 16898,
      "status": 10,
      "status_title": "",
      "message": "",
      "return_period": "",
      "checkbox": false,
      "product_id": 11714,
      "product_title": "Casual Wear Cute T-Shirt and Pant Set AON-3",
      "product_description": "Clothing Varieties your customers will like",
      "product_image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1313-5355-98fab7b0-5513-4a6e-8177-702d03c707cc2022-13-53-Jul-1657700635.png",
      "product_deleted": false,
      "price": "268.81",
      "item_quantity": "4 Pcs",
      "total": "1075.24",
      "attributes": [
        {"name": "Color", "values": "Coffee"},
        {"name": "Clothing Size", "values": "M, L, XL, XXL"}
      ]
    },
    {
      "id": 16899,
      "status": 10,
      "status_title": "",
      "message": "",
      "return_period": "",
      "checkbox": false,
      "product_id": 11713,
      "product_title": "Casual Wear Cute T-Shirt and Pant Set AON-2",
      "product_description": "Clothing Varieties your customers will like",
      "product_image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1313-5233-8e068e75-543e-4f70-9642-4c1a6cbda20a2022-13-52-Jul-1657700553.png",
      "product_deleted": false,
      "price": "268.81",
      "item_quantity": "4 Pcs",
      "total": "1075.24",
      "attributes": [
        {"name": "Color", "values": "Sky"},
        {"name": "Clothing Size", "values": "M, L, XL, XXL"}
      ]
    }
  ],
  "shipping_address": {
    "ship_to": "Arun Keshri",
    "address":
        "ARUN KESHRI 3rd floor,N-18 lall market Road, lall bazar ,Gangtok sikkim ,737101, Vishal Gaon",
    "phone": "9641813217",
    "alt_phone": "None",
    "city": "Gangtok",
    "state": "Sikkim",
    "pincode": "737101"
  },
  "action_button": {
    "code": "CANCEL",
    "visible": true,
    "button_text": "Cancel Order"
  },
  "order_tracking": {"visible": true, "link": ""},
  "cancel_reason": [
    {"selected": false, "text": "I want to change address for the order"},
    {"selected": false, "text": "I want to buy different item"},
    {"selected": false, "text": "I have changed my mind"},
    {"selected": false, "text": "I want to convert my order prepaid"},
    {"selected": false, "text": "Other"}
  ],
  "return_reason": [
    {"selected": false, "text": "Wrong items recieved"},
    {"selected": false, "text": "Recieved broken/damage product"},
    {"selected": false, "text": "Product is missing in the packages"},
    {
      "selected": false,
      "text": "Recieved different items from product description"
    },
    {"selected": false, "text": "Other"}
  ],
  "order_status": [
    {
      "status_id": 0,
      "status_title": "Ordered",
      "message": "Order has been placed",
      "visible": true,
      "created_at": "July 15 2022"
    },
    {
      "status_id": 30,
      "status_title": "Processing",
      "message": "Preparing your Order.",
      "visible": true,
      "created_at": "July 15 2022"
    },
    {
      "status_id": 40,
      "status_title": "Packed",
      "message": "Your item has been packed.",
      "visible": true,
      "created_at": "July 15 2022"
    },
    {
      "status_id": 60,
      "status_title": "Shipped",
      "message": "Order has been shipped.",
      "visible": false,
      "created_at": ""
    },
    {
      "status_id": 70,
      "status_title": "Delivered",
      "message": "Order has been delivered",
      "visible": false,
      "created_at": ""
    }
  ]
};
