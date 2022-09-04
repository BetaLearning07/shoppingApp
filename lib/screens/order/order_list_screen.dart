import 'package:ecom_thin_ui/routes/app_pages.dart';
import 'package:ecom_thin_ui/theme/device_size_helper.dart';
import 'package:ecom_thin_ui/widgets/no_data_found.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:ecom_thin_ui/widgets/index.dart';
import 'package:ecom_thin_ui/theme/styles.dart';
import 'package:flutter/material.dart';
import '../../theme/ui_helper.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
        ),
        body: Column(children: [
          Card(
            elevation: .5,
            margin: const EdgeInsets.all(0),
            child: SizedBox(
              height: 50.h,
              width: getWidth,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primaryGreyText5,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadiusDirectional.circular(5)),
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search in orders',
                            prefixIcon: Icon(IcoFontIcons.search2, size: 15.sp),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    UIHelper.horizontalSpaceSmall(),
                    Expanded(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primaryGreyText5,
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadiusDirectional.circular(5)),
                          child: TextButton.icon(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return _BottomSheetContent(
                                      key: key,
                                      context: context,
                                    );
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: Colors.white,
                                );
                              },
                              icon: Icon(
                                IcoFontIcons.settings,
                                size: 15.sp,
                                color: AppColors.primaryGreyText3,
                              ),
                              label: Text(
                                'Filter',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        color: AppColors.primaryGreyText3,
                                        fontWeight: FontWeight.w700),
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
          orderList.isEmpty
              ? const NoDataFound(
                  title: 'No Orders found',
                )
              : Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 5.h),
                    shrinkWrap: true,
                    itemCount: orderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = orderList[index];
                      return InkWell(
                          onTap: () async {
                            Navigator.pushNamed(context, Routes.orderDetail);
                          },
                          child: Card(
                              elevation: 0,
                              margin: EdgeInsets.only(
                                  left: 5.h, right: 5.h, bottom: 5.h),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w,
                                    right: 10.w,
                                    top: 10.h,
                                    bottom: 10.h),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Stack(
                                            children: [
                                              Card(
                                                  elevation: 0,
                                                  margin:
                                                      const EdgeInsets.all(3),
                                                  child: HostedImage(
                                                      imageurl: data['products']
                                                                  .isEmpty !=
                                                              true
                                                          ? data['products']
                                                                  ?.first ??
                                                              ''
                                                          : '',
                                                      asdpectRatio: 1)),
                                              data['products'].length > 1
                                                  ? Positioned(
                                                      child: Container(
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                                  .fromARGB(
                                                              54, 0, 0, 0),
                                                          borderRadius:
                                                              BorderRadiusDirectional
                                                                  .circular(
                                                                      5.sp)),
                                                      child: AspectRatio(
                                                        aspectRatio: 1,
                                                        child: Center(
                                                            child: Text(
                                                                '+ ${data['products'].length - 1}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                textScaleFactor:
                                                                    1.5,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelMedium!
                                                                    .copyWith(
                                                                        color: AppColors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold))),
                                                      ),
                                                    ))
                                                  : const SizedBox.shrink()
                                            ],
                                          ),
                                        ),
                                        UIHelper.horizontalSpaceSmall(),
                                        Expanded(
                                          flex: 9,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 6,
                                                    child: Text(
                                                      data['order_number'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .primaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 8.w,
                                                                right: 8.w,
                                                                top: 3.h,
                                                                bottom: 3.h),
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .primaryGreyText4,
                                                            borderRadius:
                                                                BorderRadiusDirectional
                                                                    .circular(
                                                                        50.sp)),
                                                        child: FittedBox(
                                                          child: Text(
                                                            data['current_status']
                                                                [
                                                                'status_title'],
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(
                                                                    color: AppColors
                                                                        .primaryText,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                data['created_at'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        color: AppColors
                                                            .primaryText,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              ),
                                              UIHelper.verticalSpaceSmall(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  _buildTitileSubtitle(
                                                      total:
                                                          '₹ ${data['grand_total']}',
                                                      items: data['total_items'] ==
                                                              1
                                                          ? '${data['total_items']}  Item'
                                                          : '${data['total_items']}  Items',
                                                      context: context),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${data['payment_method']}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                color: AppColors
                                                                    .primaryGreyText3),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )));
                    },
                  ),
                ),
        ]));
  }
}

_buildTitileSubtitle<Widget>(
    {required total, required items, required BuildContext context}) {
  return Text.rich(TextSpan(children: [
    TextSpan(
      text: total.toString(),
      style: Theme.of(context).textTheme.headline6!.copyWith(
          fontWeight: FontWeight.w500, color: AppColors.primaryGreyText3),
    ),
    TextSpan(
      text: ' ($items)',
      style: Theme.of(context).textTheme.bodyText2!.copyWith(
          fontWeight: FontWeight.normal, color: AppColors.primaryGreyText3),
    )
  ]));
}

class _BottomSheetContent extends StatelessWidget {
  final BuildContext context;
  const _BottomSheetContent({Key? key, required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                width: getWidth,
                decoration: const BoxDecoration(
                    color: AppColors.primaryGreyText4,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(10),
                        topStart: Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter Orders',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          IcoFontIcons.close,
                          size: 20.sp,
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 8.0.w, right: 8.0.w, top: 8.0.h, bottom: 30.h),
                child: FormBuilderRadioGroup(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  orientation: OptionsOrientation.vertical,
                  name: 'my_language',
                  validator: FormBuilderValidators.required(),
                  options: [
                    'Ordered',
                    'Packed',
                    'Shipped',
                    'Delivered',
                    'Return Initiated',
                    'Return Approved',
                    'Return Completed',
                    'Refunded',
                  ]
                      .map((lang) => FormBuilderFieldOption(
                            value: lang,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 50.h,
            decoration: const BoxDecoration(color: AppColors.white),
            width: getWidth,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0.h, right: 8.0.h),
              child: Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: null,
                          child: Text(
                            'CLEAR FILTERS',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: AppColors.primaryGreyText3,
                                    fontWeight: FontWeight.w700),
                          ))),
                  UIHelper.horizontalSpaceSmall(),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.primaryColor)),
                          child: Text(
                            'APPLY',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: AppColors.primaryGreyText3,
                                    fontWeight: FontWeight.w700),
                          ))),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

List orderList = [
  {
    "id": 10459,
    "reff": "ASEZ8168U71",
    "order_number": "ORD-A3E833FB46C74",
    "message": "No stock",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0216-2551-15100214-0fd0-49a1-bd03-4971a4bba83a2022-02-25-Jul-1656759351.png"
    ],
    "total_items": 1,
    "item_total_amount": "597.95",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "697.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "06 Jul 2022",
    "payment_method": "Online",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 07 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10360,
    "reff": "ASEZ8083U71",
    "order_number": "ORD-D62911B122144",
    "message": "No stock",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/60000d05a46bf-thumbnail.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "2501.60",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "2601.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "01 Jul 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Return Initiated",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 06 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10344,
    "reff": "ASEZ8071U71",
    "order_number": "ORD-F5DDEE15390C4",
    "message": "I have changed my mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/6202615044b83_961505499-thumbnail.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "1753.10",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "1852.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "30 Jun 2022",
    "payment_method": "Online",
    "current_status": {
      "status_id": 980,
      "status_title": "Ordered",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 01 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10335,
    "reff": "ASEZ8063U71",
    "order_number": "ORD-1890F039B4304",
    "message": "I have changed my mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/620261503019c_55228510-thumbnail.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/6202615044b83_961505499-thumbnail.jpg"
    ],
    "total_items": 2,
    "item_total_amount": "3506.20",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "3605.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "30 Jun 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 01 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10324,
    "reff": "ASEZ8053U71",
    "order_number": "ORD-6D813EE7F3644",
    "message": "I have changed my mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0116-5907-38c80469-7583-43a3-acbd-215557d7624f2022-01-59-Jul-1656674947.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "3525.30",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "3624.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "29 Jun 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "June 29 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10323,
    "reff": "ASEZ8053U71",
    "order_number": "ORD-874BF92A4FF04",
    "message": "price high hai bohot",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202206-2712-5830-dcc43b85-a684-464c-b057-c788691c1ca32022-27-58-Jun-1656314910.png"
    ],
    "total_items": 1,
    "item_total_amount": "9216.48",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "9315.00",
    "invoice": "ASEZ-1",
    "delivery_expected": "",
    "created_at": "29 Jun 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Return Completed",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "June 29 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10312,
    "reff": "ASEZ8042U71",
    "order_number": "ORD-3F8158E79AC74",
    "message": "not picking call",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/61fbee4fa8b5a_542565645-thumbnail.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/61fbee4fa8b5a_542565645-thumbnail.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0116-1055-e87e352b-81ba-4532-9b68-955c576628512022-01-10-Jul-1656672055.jpg"
    ],
    "total_items": 3,
    "item_total_amount": "5827.84",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "5927.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "28 Jun 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 02 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10242,
    "reff": "ASEZ7983U71",
    "order_number": "ORD-66AD6471745B4",
    "message": "I have changed my mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/60000cfa888a1-thumbnail.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "1250.80",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "1350.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "24 Jun 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "June 28 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10234,
    "reff": "ASEZ7976U71",
    "order_number": "ORD-8E984579D4784",
    "message": "I have changed my mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202206-1412-4642-482696c2-4019-45ac-a7ef-5e4365e8a9342022-14-46-Jun-1655191002.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "886.56",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "986.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "24 Jun 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "June 24 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10613,
    "reff": "ASEZ8301U71",
    "order_number": "ORD-117196D91CA84",
    "message": "",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0912-2416-81372215-d28c-4beb-8db6-507b373cac1b2022-09-24-Jul-1657349656.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "1250.80",
    "delivery_charge": "0.00",
    "discount": "0.00",
    "grand_total": "1251.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "15 Jul 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 0,
      "status_title": "Ordered",
      "message": "Order has been placed",
      "visible": true,
      "created_at": "July 15 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10578,
    "reff": "ASEZ8270U71",
    "order_number": "ORD-8EC37CDA38B64",
    "message": "ordered by mistake",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/5fedd3e675b35_IMG_20200809_112312_compress70-thumbnail.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "800.04",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "899.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "13 Jul 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 14 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10544,
    "reff": "ASEZ8243U71",
    "order_number": "ORD-475F53FCAE574",
    "message": "I have changed my mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0118-3428-8f9fa0a5-ef1a-4154-ac76-68a85aa24df32022-01-34-Jul-1656680668.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0118-3428-8f9fa0a5-ef1a-4154-ac76-68a85aa24df32022-01-34-Jul-1656680668.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0212-1313-18e83bf4-b999-4620-9fd1-6e2678ba76f62022-02-13-Jul-1656744193.jpg"
    ],
    "total_items": 3,
    "item_total_amount": "5633.14",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "5732.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "11 Jul 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 13 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10495,
    "reff": "ASEZ8199U71",
    "order_number": "ORD-DED1268EE46E4",
    "message": "I have changed my mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/610d327f22925_481051321-thumbnail.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "1236.80",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "1336.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "08 Jul 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 09 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10479,
    "reff": "ASEZ8185U71",
    "order_number": "ORD-D6C7D66648504",
    "message": "I Have Changed my Mind",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0114-4519-36ea3394-4759-4a84-8ae7-4fe70780a5a42022-01-45-Jul-1656666919.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "2890.02",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "2989.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "07 Jul 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 08 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
  {
    "id": 10461,
    "reff": "ASEZ8170U71",
    "order_number": "ORD-5FAB57A52B484",
    "message": "I want to convert my order prepaid",
    "image": "",
    "products": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/610d327f22925_481051321-thumbnail.jpg"
    ],
    "total_items": 1,
    "item_total_amount": "1236.80",
    "delivery_charge": "99.00",
    "discount": "0.00",
    "grand_total": "1336.00",
    "invoice": "NULL",
    "delivery_expected": "",
    "created_at": "06 Jul 2022",
    "payment_method": "COD",
    "current_status": {
      "status_id": 980,
      "status_title": "Cancelled",
      "message": "Order has been Cancelled",
      "visible": true,
      "created_at": "July 08 2022"
    },
    "return_period": "",
    "order_refund_message": "",
    "proof": {"rejected": false, "text": ""}
  },
];
