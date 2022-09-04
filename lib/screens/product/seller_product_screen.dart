import 'package:shopping_app/routes/app_pages.dart';
import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../widgets/hosted_image.dart';

class SellerProductsScreen extends StatelessWidget {
  const SellerProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopContentWidget(
                  key: key,
                ),
                UIHelper.verticalSpaceSmall(),
                CategoryWiseProductsWidget(
                  key: key,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TopContentWidget extends StatelessWidget {
  const TopContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.w),
              bottomRight: Radius.circular(20.w))),
      color: AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 50.0.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.sp, right: 10.sp),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50.h,
                    width: 55.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.sp),
                        topRight: Radius.circular(50.sp),
                      ),
                    ),
                    child: Icon(IcoFontIcons.businessMan, size: 32.sp),
                  ),
                  UIHelper.horizontalSpaceSmall(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rajdhani Garments',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          'Siliguri, West Bengal - 734003',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/rating.svg',
                        height: 35.h,
                      ),
                      Positioned(
                        top: 2.h,
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text: sellerProductData['seller_rating'],
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: AppColors.darkOrage,
                                      fontWeight: FontWeight.bold),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                    child: Row(
                      children: [
                        Text(
                          'Brands:  ',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: sellerProductData['brands'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Chip(
                                      onDeleted: null,
                                      label: Text(sellerProductData['brands']
                                          [index]['name'])),
                                  UIHelper.horizontalSpaceExtraSmall()
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Row(
                      children: [
                        Text(
                          'Level:  ',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Expanded(
                          child: Text(
                            sellerProductData['level'],
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SellerHighlightWidget(
              key: key,
            ),
            UIHelper.verticalSpaceSmall(),
          ],
        ),
      ),
    );
  }
}

class SellerHighlightWidget extends StatelessWidget {
  const SellerHighlightWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
      elevation: 0,
      margin: EdgeInsets.all(8.sp),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Row(
          children: [
            _buildHighlights(
                context: context,
                title:
                    'Selling Product Since ${sellerProductData['seller_since']}',
                icon: IcoFontIcons.refresh,
                ontap: () {
                  _buildBottomSheetContent(
                    context: context,
                    title: '2000 Dispached',
                    subtitle: '2000 Dispached',
                  );
                }),
            _buildHighlights(
                context: context,
                title: 'Rated by ${sellerProductData['rated_by']} Customer',
                icon: Icons.star_rate_outlined,
                ontap: () {
                  _buildBottomSheetContent(
                    context: context,
                    title: "Rated 5000",
                    subtitle: "Rated 5000",
                  );
                }),
            _buildHighlights(
                context: context,
                title:
                    '${sellerProductData['total_category']} Various Categories',
                icon: IcoFontIcons.rupee,
                ontap: () {
                  _buildBottomSheetContent(
                    context: context,
                    title: '12 Categories',
                    subtitle: '12 Categories',
                  );
                }),
            _buildHighlights(
                context: context,
                title: '${sellerProductData['total_products']} Unique Products',
                icon: IcoFontIcons.saleDiscount,
                ontap: () {
                  _buildBottomSheetContent(
                    context: context,
                    title: '46 Unique Products',
                    subtitle: '46 Products',
                  );
                }),
          ],
        ),
      ),
    );
  }
}

_buildBottomSheetContent(
    {required String title,
    required String subtitle,
    required BuildContext context}) {
  return showModalBottomSheet(
    context: context,
    builder: ((context) => Container(
          padding: EdgeInsets.all(10.sp),
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Divider(
                thickness: 1,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        )),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: Colors.white,
  );
}

_buildHighlights(
    {required IconData icon,
    required String title,
    required Function() ontap,
    required BuildContext context}) {
  return Expanded(
    child: InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.sp),
                color: AppColors.primaryGreyText4),
            child: Icon(
              icon,
              color: AppColors.darkSky,
              size: 26.sp,
            ),
          ),
          UIHelper.verticalSpaceExtraSmall(),
          Text.rich(
            TextSpan(children: [
              TextSpan(text: title),
              // TextSpan(text: 'Return Policy'),
            ]),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: AppColors.skyBlue),
          )
        ],
      ),
    ),
  );
}

class CategoryWiseProductsWidget extends StatelessWidget {
  const CategoryWiseProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      itemCount: sellerProductData['products'].length,
      itemBuilder: (BuildContext context, int index) {
        var data = sellerProductData['products'][index];
        return Card(
          elevation: 0,
          margin: EdgeInsets.all(1.sp),
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 8.0.h, left: 8.0.w, right: 8.0.w),
                child: Row(
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      color: AppColors.black,
                    ),
                    UIHelper.horizontalSpaceSmall(),
                    Expanded(
                        child: Text(
                      data['category']['title'],
                      style: Theme.of(context).textTheme.subtitle2,
                    )),
                    Visibility(
                      // visible: data['productlist'].length < 3
                      //     ? false
                      //     : true,
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'More',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              UIHelper.horizontalSpace(3.w),
                              Container(
                                height: 18.h,
                                width: 18.w,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryColor),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 12.sp,
                                    color: AppColors.black,
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 150.h,
                width: getWidth,
                child: ListView.builder(
                  shrinkWrap: false,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data['productlist'].length,
                  itemBuilder: (BuildContext context, int index2) {
                    var data2 = data['productlist'][index2];

                    return InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, Routes.productDetail,
                            arguments: data2['id']);
                      },
                      child: SizedBox(
                        width: 130.w,
                        child: Card(
                          elevation: .5,
                          margin: EdgeInsets.only(
                              top: 3.h, left: 3.w, right: 3.w, bottom: 5.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 9,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: HostedImage(
                                      imageurl: data2['image'],
                                      asdpectRatio: 1.0),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Text(
                                        data2['title'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                fontWeight: FontWeight.normal,
                                                color:
                                                    AppColors.primaryGreyText2),
                                      ),
                                    ),
                                    // UIHelper.verticalSpaceSmall(),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.0.w, right: 8.0.w),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text.rich(TextSpan(children: [
                                              TextSpan(
                                                text: '\u20B9 ',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .primaryGreyText2,
                                                    ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${data2['pricing']['price'] ?? 0}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        letterSpacing: -.5),
                                              ),
                                              TextSpan(
                                                text:
                                                    '/${data2['pricing']['unit']}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: AppColors
                                                          .primaryGreyText2,
                                                    ),
                                              ),
                                            ])),
                                            Text(
                                              'New',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline!
                                                  .copyWith(
                                                      letterSpacing: .2,
                                                      color: AppColors.blue,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(
                thickness: 2,
              )
            ],
          ),
        );
      },
    );
  }
}

Map sellerProductData = {
  "status_code": 200,
  "seller_name": "Rajdhani Garments",
  "seller_rating": "4.5",
  "rated_by": 506,
  "total_category": 16,
  "seller_since": 2022,
  "level": "🏅 Gold",
  "total_products": 200,
  "brands": [
    {"name": "Ckko", "id": 25},
    {"name": "Adidas", "id": 25},
    {"name": "Nike", "id": 25},
  ],
  "products": [
    {
      "category": {
        "id": 190,
        "title": "Kid Boys Pullovers Kid Boys Pullovers Kid Boys Pullovers"
      },
      "total_products": 4,
      "productlist": [
        {
          "id": 11998,
          "title": "Trendy and Comfy Fleece Pullovers for Boys",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-2814-3159-7a265c5e-587b-430c-9de4-94810052b4d82022-28-31-Jul-1658998919.jpg",
          "pricing": {"id": 15613, "price": "183.23", "moq": 6, "unit": "Pcs"}
        },
        {
          "id": 11999,
          "title": "Trendy and Comfy Fleece Pullovers for Boys 01",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-2814-4220-83d9f21d-8454-450f-b275-57dac2f57f872022-28-42-Jul-1658999540.jpg",
          "pricing": {"id": 15616, "price": "194.20", "moq": 6, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 247, "title": "Kid Girl's Night suits"},
      "total_products": 2,
      "productlist": [
        {
          "id": 10956,
          "title": "Baby Girls Night Suit Set New Arrival",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0114-4302-8e0a12d9-0c6a-4c13-9c47-d9269f7031b72022-01-43-Jul-1656666782.jpg",
          "pricing": {"id": 14282, "price": "330.26", "moq": 6, "unit": "Pcs"}
        },
        {
          "id": 10957,
          "title": "Kid Girls New Latest Night Suits",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0114-4135-ce33f57a-7c76-42be-b416-292dd075676e2022-01-41-Jul-1656666695.jpg",
          "pricing": {"id": 14283, "price": "311.60", "moq": 6, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 2292, "title": "Mens Jersey"},
      "total_products": 3,
      "productlist": [
        {
          "id": 10785,
          "title": " Mixed Color Rice Net Jersey Set for Men",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0213-0958-0cddeb4c-a72b-420b-8f1e-5aa37c0fefc62022-02-09-Jul-1656747598.png",
          "pricing": {"id": 14058, "price": "330.26", "moq": 6, "unit": "Pcs"}
        },
        {
          "id": 12076,
          "title": "Mixed Color 3-Bit Jersey Suits for Men",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202208-0117-2650-c2133318-4823-437a-bfd8-d801216044ab2022-01-26-Aug-1659355010.png",
          "pricing": {"id": 15733, "price": "220.54", "moq": 12, "unit": "Pcs"}
        },
        {
          "id": 12078,
          "title": "Mixed Color Football Jersey Suits for Men",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202208-0117-3456-2662d110-5959-4fda-9466-fdbcbe7038132022-01-34-Aug-1659355496.png",
          "pricing": {"id": 15736, "price": "220.54", "moq": 12, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 1384, "title": "Womens Raincoats"},
      "total_products": 1,
      "productlist": [
        {
          "id": 10746,
          "title": "Women Printed PVC Raincoats",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0213-5118-68260727-02e4-4109-a246-6fa4c89636762022-02-51-Jul-1656750078.jpg",
          "pricing": {"id": 14014, "price": "301.73", "moq": 6, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 35, "title": "Mens Kurtas"},
      "total_products": 1,
      "productlist": [
        {
          "id": 10733,
          "title": "Comfortable and Stylish Kurta Shirts",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202205-2812-1457-7250f16b-6b15-42ea-ba1e-cf547f8ed3dd2022-28-14-May-1653720297.jpg",
          "pricing": {"id": 13999, "price": "421.32", "moq": 6, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 1398, "title": "Kid Boy's Cargos"},
      "total_products": 3,
      "productlist": [
        {
          "id": 10433,
          "title": "Latest Design Cotton Joggers Pants for Boys",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0118-5937-e4e7177e-b32f-4428-bb65-fe6f1e9f88b72022-01-59-Jul-1656682177.png",
          "pricing": {"id": 14897, "price": "271.01", "moq": 12, "unit": "Pcs"}
        },
        {
          "id": 11418,
          "title": "Fashionable Joggers Pants for Kid Boys- Brown",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0613-2028-ba4f2dfa-40e4-44fa-9c3c-a66aa2162dbd2022-06-20-Jul-1657093828.jpg",
          "pricing": {"id": 15101, "price": "271.01", "moq": 12, "unit": "Pcs"}
        },
        {
          "id": 11421,
          "title": "Fashionable Joggers Pants for Kid Boys- Grey",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0612-5524-b7636029-9eca-48ba-8b28-3bbd033cc08c2022-06-55-Jul-1657092324.jpg",
          "pricing": {"id": 14898, "price": "271.01", "moq": 12, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 32, "title": "Cargo"},
      "total_products": 9,
      "productlist": [
        {
          "id": 10372,
          "title": "Mid Rise Fancy Jogger Fit Pant- Blue",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0118-3126-8a8d30a8-f050-48bd-9fc4-c37a5916a5b32022-01-31-Jul-1656680486.jpg",
          "pricing": {"id": 13446, "price": "411.45", "moq": 6, "unit": "Pcs"}
        },
        {
          "id": 10435,
          "title": "Fashionable Cargos for Men in Coffee Color",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0118-5804-7c5d0891-4651-4e16-8bcc-9e1051fcc8ce2022-01-58-Jul-1656682084.jpg",
          "pricing": {"id": 13554, "price": "441.07", "moq": 8, "unit": "Pcs"}
        },
        {
          "id": 10438,
          "title": "Fashionable Cargos for Men in Grey Color",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202205-1817-1937-c0160dd9-e22e-489c-b04d-5b7faf2e813e2022-18-19-May-1652874577.jpg",
          "pricing": {"id": 13557, "price": "441.07", "moq": 8, "unit": "Pcs"}
        },
        {
          "id": 10901,
          "title": "Cream Color Fancy Cargo Pants for Men",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0117-0549-f4ca02ed-76f1-4caf-b9b0-71c40968f17a2022-01-05-Jul-1656675349.jpg",
          "pricing": {"id": 14205, "price": "491.55", "moq": 8, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 2299, "title": "Kid Boys Clothing Set"},
      "total_products": 1,
      "productlist": [
        {
          "id": 10353,
          "title": "Unisex Shirt and Half Pant Set for Kids",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0115-0039-90e14b1c-3bcc-49e7-a293-682611828bda2022-01-00-Jul-1656667839.jpeg",
          "pricing": {"id": 13419, "price": "352.20", "moq": 4, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 230, "title": "Kid Girl's Dresses"},
      "total_products": 4,
      "productlist": [
        {
          "id": 10347,
          "title": "Kid Girls Plain Top and Jeans Set",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0115-0649-6269798f-5211-4e07-8e3e-19f2dac714cd2022-01-06-Jul-1656668209.jpeg",
          "pricing": {"id": 13396, "price": "572.74", "moq": 4, "unit": "Pcs"}
        }
      ]
    },
    {
      "category": {"id": 795, "title": "Mosquito Nets"},
      "total_products": 3,
      "productlist": [
        {
          "id": 10323,
          "title": " Double Bed Good Quality Mosquito Net",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0114-4557-7ef1a8ba-7f3d-440f-b26b-640882430a112022-01-45-Jul-1656666957.jpg",
          "pricing": {"id": 13356, "price": "220.54", "moq": 10, "unit": "Pcs"}
        },
        {
          "id": 10328,
          "title": "Double Bed Floral Printed Mosquito Nets",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0115-1249-a2ca27c2-c443-4506-a05e-ee1763e4e71b2022-01-12-Jul-1656668569.jpg",
          "pricing": {"id": 13361, "price": "552.99", "moq": 5, "unit": "Pcs"}
        },
        {
          "id": 10812,
          "title": "Double Bed Mosquito Nets in Mixed Color",
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0212-4138-68285f2c-5457-4ff7-bb51-46768026a7fb2022-02-41-Jul-1656745898.jpg",
          "pricing": {"id": 14090, "price": "206.27", "moq": 10, "unit": "Pcs"}
        }
      ]
    }
  ],
  "current_page": 1,
  "total_pages": 9
};
