import 'package:shopping_app/routes/app_pages.dart';
import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:shopping_app/widgets/hosted_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import '../../widgets/product_detail_image.dart';

ScrollController scrollController = ScrollController();
bool bottomBarVisible = true;

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);
  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    bottomBarVisible = true;
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          bottomBarVisible = false;
        });
      }

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          bottomBarVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.productId,
      child: Scaffold(
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: bottomBarVisible
              ? getWidth <= 375
                  ? 70.h
                  : 45
              : 0.0,
          child: BottomAppBar(
            elevation: 8,
            color: AppColors.white,
            child: Container(
              color: AppColors.primaryColor,
              height: getWidth <= 375 ? 70.h : 45.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                    onTap: () {},
                    child: Container(
                      color: AppColors.white,
                      child: Center(
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                prodDetail['product']['favourite'] == true
                                    ? Icon(Icons.favorite,
                                        size: 24.sp, color: AppColors.pink)
                                    : Icon(Icons.favorite_outline,
                                        size: 24.sp,
                                        color: AppColors.primaryGreyText3),
                                const VerticalDivider(
                                  thickness: 1.2,
                                ),
                                Icon(IcoFontIcons.cart,
                                    size: 24.sp, color: AppColors.black)
                              ],
                            ),
                            Positioned(
                                right: 22,
                                top: 2,
                                child: Container(
                                  height: 15.h,
                                  width: 15.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: AppColors.black),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text('12',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
                  Expanded(
                      child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add to cart',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: AppColors.white,
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: getHeight.h / 2.1,
              flexibleSpace: FlexibleSpaceBar(
                  background: ProductDetailImageWidget(
                imageList: prodDetail['product']['images'],
                showPageChangeBullet: false,
              )),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PriceTitleWidget(),
                  const MrpMoqStockWidget(),
                  const DescriptionWidget(),
                  const SpecificationWidget(),
                  const HighlightdWidgets(),
                  const SellerProductWidget(),
                  Card(
                    elevation: 0,
                    margin: EdgeInsets.all(2.sp),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildHeading(
                          color: AppColors.skyBlue,
                          context: context,
                          icon: IcoFontIcons.grocery,
                          title: 'Similar Products'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_buildHeading({
  required BuildContext context,
  required String title,
  required IconData icon,
  required Color color,
}) {
  return Row(
    children: [
      Icon(
        icon,
        color: color,
        size: 22.sp,
      ),
      UIHelper.horizontalSpaceExtraSmall(),
      Text(
        title,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
      )
    ],
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

_buildTitleSubtitle({
  required BuildContext context,
  required String title,
  required String subtitle,
  String? subtitleSpan,
  required IconData icon,
  required Color color,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
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
      Text(
        title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.primaryGreyText2,
            ),
      ),
      Text.rich(TextSpan(children: [
        TextSpan(
          text: subtitle,
          // '\u20B94999',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontWeight: FontWeight.w500, letterSpacing: -.5),
        ),
        TextSpan(
          text: subtitleSpan ?? '',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.primaryGreyText2,
              ),
        ),
      ]))
    ],
  );
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

class PriceTitleWidget extends StatelessWidget {
  const PriceTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(2.sp),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0.w, right: 8.w, top: 8.0, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              prodDetail['product']['title'],
              style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryGreyText3),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Divider(
              height: 25.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'COD Price',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryGreyText2,
                            ),
                      ),
                      UIHelper.verticalSpace(2.h),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: '\u20B91300',
                          // '\u20B94999',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -.5),
                        ),
                        TextSpan(
                          text: '/pc',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryGreyText2,
                                  ),
                        ),
                      ]))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        color: AppColors.primaryGreyText5,
                        width: 4.w,
                        height: 30.h,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pre-Paid Price',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryGreyText2,
                            ),
                      ),
                      UIHelper.verticalSpace(2.h),
                      Row(
                        children: [
                          Text(
                            '\u20B96000',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                ),
                          ),
                          UIHelper.horizontalSpaceExtraSmall(),
                          Text.rich(TextSpan(children: [
                            TextSpan(
                              text: '\u20B91244',
                              // '\u20B94999',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -.5),
                            ),
                            TextSpan(
                              text: '/pc',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryGreyText2,
                                  ),
                            ),
                          ])),
                          UIHelper.horizontalSpaceSmall(),
                          Container(
                            height: 16.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Center(
                                child: Text(
                              '2% Off',
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                      letterSpacing: .1),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MrpMoqStockWidget extends StatelessWidget {
  const MrpMoqStockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(2.sp),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitleSubtitle(
                context: context,
                icon: IcoFontIcons.price,
                color: AppColors.black,
                title: 'MRP',
                subtitle: '\u20B94999',
                subtitleSpan: '/pc'),
            _buildTitleSubtitle(
              context: context,
              icon: IcoFontIcons.package,
              color: AppColors.black,
              title: 'Min Order',
              subtitle: '10',
              subtitleSpan: ' Pcs',
            ),
            _buildTitleSubtitle(
              context: context,
              icon: Icons.graphic_eq,
              color: AppColors.black,
              title: 'Stock',
              subtitle: 'Available',
              // subtitleSpan: ' Pcs',
            ),
            _buildTitleSubtitle(
              context: context,
              icon: IcoFontIcons.love,
              color: AppColors.black,
              title: 'Wishlist',
              subtitle: '56 Shoppers',
              // subtitleSpan: ' Pcs',
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(2.sp),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0.w, right: 8.w, top: 8.0, bottom: 15),
        child: Column(
          children: [
            _buildHeading(
                color: AppColors.skyBlue,
                context: context,
                icon: Icons.description,
                title: 'Product Description'),
            UIHelper.verticalSpace(5.h),
            Text(
              prodDetail['product']['short_description'],
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGreyText2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpecificationWidget extends StatelessWidget {
  const SpecificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(2.sp),
      child: Padding(
        padding: EdgeInsets.only(left: 8.0.w, right: 8.w, top: 8.0, bottom: 15),
        child: Column(
          children: [
            _buildHeading(
                color: AppColors.skyBlue,
                context: context,
                icon: Icons.pages,
                title: 'Product Specification'),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 12.h),
              shrinkWrap: true,
              itemCount: prodDetail['specification'].length,
              itemBuilder: (BuildContext context, int index) {
                var data = prodDetail['specification'][index];
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            data['name'],
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryGreyText2,
                                    ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data['values'],
                            style:
                                Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryGreyText2,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    index == prodDetail['specification'].length - 1
                        ? const SizedBox.shrink()
                        : const Divider(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HighlightdWidgets extends StatelessWidget {
  const HighlightdWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(2.sp),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _buildHighlights(
                context: context,
                title: prodDetail['product']['return_days']['title'],
                icon: IcoFontIcons.refresh,
                ontap: () {
                  _buildBottomSheetContent(
                      context: context,
                      title: prodDetail['product']['return_days']['title'],
                      subtitle: prodDetail['product']['return_days']['text']);
                }),
            _buildHighlights(
                context: context,
                title: prodDetail['product']['delivery']['title'],
                icon: IcoFontIcons.truck,
                ontap: () {
                  _buildBottomSheetContent(
                      context: context,
                      title: prodDetail['product']['delivery']['title'],
                      subtitle: prodDetail['product']['delivery']['text']);
                }),
            _buildHighlights(
                context: context,
                title: prodDetail['product']['payment']['title'],
                icon: IcoFontIcons.rupee,
                ontap: () {
                  _buildBottomSheetContent(
                      context: context,
                      title: prodDetail['product']['payment']['title'],
                      subtitle: prodDetail['product']['payment']['text']);
                }),
            _buildHighlights(
                context: context,
                title: 'APPLICABLE OFFERS',
                icon: IcoFontIcons.saleDiscount,
                ontap: () {
                  _buildBottomSheetContent(
                      context: context,
                      title: 'APPLICABLE OFFERS',
                      subtitle: prodDetail['product']['discount']['text']);
                }),
          ],
        ),
      ),
    );
  }
}

class SellerProductWidget extends StatelessWidget {
  const SellerProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(2.sp),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  IcoFontIcons.businessMan,
                  color: AppColors.skyBlue,
                  size: 22.sp,
                ),
                UIHelper.horizontalSpaceMedium(),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SOLD BY',
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
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Rajdhani Garments - ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.primaryGreyText2),
                              ),
                              TextSpan(
                                text: 'West Bengal',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.primaryGreyText2,
                                        fontStyle: FontStyle.italic),
                              )
                            ])),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.sellerProducts);
                          },
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
                          ))
                    ],
                  ),
                ),
              ],
            ),
            AspectRatio(
              aspectRatio: 3,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: prodDetail['seller_products'].length,
                itemBuilder: (BuildContext context, int index) {
                  var data = prodDetail['seller_products'][index];
                  return InkWell(
                    onTap: () async {
                      Navigator.pushNamed(context, Routes.productDetail,
                          arguments: data['id']);
                    },
                    child: SizedBox(
                      width: 115.w,
                      child: Card(
                        margin: EdgeInsets.all(2.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 6,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: HostedImage(
                                    imageurl: data['image'], asdpectRatio: 1.0),
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
                                      data['title'],
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
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors
                                                        .primaryGreyText2,
                                                  ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${data['pricing']['price'] ?? 0}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: -.5),
                                            )
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
          ],
        ),
      ),
    );
  }
}

Map prodDetail = {
  "status_code": 202,
  "product": {
    "id": 11516,
    "title": "Casual Wear Grey PVC Flip-Flops a206",
    "images": [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5947-ea470fb9-89ca-4cca-9f82-4061f58390f02022-01-59-Jul-1656656987.JPG",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5946-c72a3e71-0119-448d-a4bc-efd6f9f475a12022-01-59-Jul-1656656986.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5947-38d96ffc-3398-4465-b4dc-122157ddf49e2022-01-59-Jul-1656656987.JPG",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0111-5947-54c4511e-4b9f-4468-8911-9b8aea05dc072022-01-59-Jul-1656656987.JPG"
    ],
    "slug": "casual-wear-grey-pvc-flip-flops-a206",
    "short_description":
        "Regular and Casual Wear Flip- Flops for both Men and Boys, Launched Wave Call Smart Watch with Bluetooth Calling ( Size- 6, 7, 8, 9, 10, 11)",
    "category": 1414,
    "pricing": {"id": 14994, "price": "150.57", "moq": 8, "unit": "Pair"},
    "created_at": "2022-06-30",
    "stock": true,
    "favourite": false,
    "status": 51,
    "delivery": {
      "title": "PRODUCT DELIVERY",
      "rate": 99,
      "text": "₹99 | Flat Delivery Charge"
    },
    "payment": {
      "title": "PAYMENT OPTIONS",
      "text": "Cash on Delivery & Online Payment Available"
    },
    "return_days": {
      "title": "PRODUCT RETURN",
      "rate": 4,
      "text":
          "4 Days return policy available. If there is any issue with your product, you can raise a return request"
    },
    "discount": {"rate": 2, "text": "2.0% Extra Discount on Online Payment"},
    "seller": {
      "id": 23358,
      "name": "Dagna Sales",
      "city": "New Delhi",
      "region": "Delhi"
    }
  },
  "specification": [
    {"name": "Ideal For", "values": "Men, Boys"},
    {"name": "Footwear Size", "values": "6, 7, 8, 9, 10, 11"},
    {"name": "Color", "values": "Grey"},
    {"name": "Upper Materials", "values": "Rexine"},
    {
      "name": "Occasion",
      "values": "Regular Wear, Casual Wear, Summer Wear, Night/Lounge Wear"
    },
    {"name": "Sole Material", "values": "PVC"},
    {"name": "Packaging Type", "values": "In Loose"},
    {"name": "Product Design/Pattern", "values": "Slipper"},
    {"name": "Product Code", "values": "a206"}
  ],
  "seller_products": [
    {
      "id": 11876,
      "title": "Casual Wear Yellow PVC Flip-Flops a389",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-2111-5338-dcc89465-ae8d-4680-8673-cf8d8b4d0d772022-21-53-Jul-1658384618.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15444, "price": "150.57", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-21",
      "status": 51
    },
    {
      "id": 11626,
      "title": "Casual Wear Black PVC Flip-Flops a562",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0712-2042-5bfa2a74-9cc0-4edc-ac12-8d468239f57b2022-07-20-Jul-1657176642.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15117, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11625,
      "title": "Casual Wear Yellow PVC Flip-Flops a561",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-5605-b60ba7f1-2112-432d-b99f-681f8963ce402022-07-56-Jul-1657175165.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15116, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11624,
      "title": "Casual Wear Grey PVC Flip-Flops a546",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-1423-7242dca6-247f-4908-a0fe-8185e08b71be2022-07-14-Jul-1657172663.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15113, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": true,
      "created_at": "2022-07-07",
      "status": 51
    }
  ],
  "similarproducts": [
    {
      "id": 11876,
      "title": "Casual Wear Yellow PVC Flip-Flops a389",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-2111-5338-dcc89465-ae8d-4680-8673-cf8d8b4d0d772022-21-53-Jul-1658384618.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15444, "price": "150.57", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-21",
      "status": 51
    },
    {
      "id": 11752,
      "title": "Multicolor Comfy Rubber Slippers for Men 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2619-e13e5711-ed4f-45e1-97a9-367a50ce2fec2022-15-26-Jul-1657871779.png",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15296, "price": "139.78", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11751,
      "title": "Multicolor Comfy EVA Slippers for Men 01",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2543-d3f67e57-27d1-431d-8016-01c6fb7ff1cf2022-15-25-Jul-1657871743.jpeg",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15295, "price": "93.19", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11750,
      "title": "Multicolor Comfy EVA Slippers for Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2348-fd9d43a1-52c0-40ea-802c-ff4a168c76d42022-15-23-Jul-1657871628.png",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15294, "price": "93.19", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11749,
      "title": "Multicolor Comfy Rubber Slippers for Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1513-2207-bb225116-5bb5-4423-b1b5-5fc0fe6c5b572022-15-22-Jul-1657871527.jpeg",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15293, "price": "128.14", "moq": 24, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-15",
      "status": 51
    },
    {
      "id": 11704,
      "title": "Multicolor Comfy Slippers for Men- Multicolor",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1312-1258-fc4233e7-fa39-4e47-b5b1-84c6b663e6d32022-13-12-Jul-1657694578.png",
      "short_description": "Regular Wear Slippers for Men and Boys\r\n",
      "category": 1414,
      "pricing": {"id": 15235, "price": "64.07", "moq": 12, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-13",
      "status": 51
    },
    {
      "id": 11626,
      "title": "Casual Wear Black PVC Flip-Flops a562",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0712-2042-5bfa2a74-9cc0-4edc-ac12-8d468239f57b2022-07-20-Jul-1657176642.JPG",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15117, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11625,
      "title": "Casual Wear Yellow PVC Flip-Flops a561",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-5605-b60ba7f1-2112-432d-b99f-681f8963ce402022-07-56-Jul-1657175165.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15116, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11624,
      "title": "Casual Wear Grey PVC Flip-Flops a546",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-1423-7242dca6-247f-4908-a0fe-8185e08b71be2022-07-14-Jul-1657172663.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15113, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-07",
      "status": 51
    },
    {
      "id": 11622,
      "title": "Casual Wear Red PVC Flip-Flops a549",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0711-3607-7b050da8-96af-422e-b113-f267ae1acce32022-07-36-Jul-1657173967.jpg",
      "short_description":
          "Regular and Casual Wear Flip- Flops for both Men and Boys( Size- 6, 7, 8, 9, 10, 11)",
      "category": 1414,
      "pricing": {"id": 15115, "price": "245.58", "moq": 8, "unit": "Pair"},
      "favourite": false,
      "created_at": "2022-07-06",
      "status": 51
    }
  ]
};
