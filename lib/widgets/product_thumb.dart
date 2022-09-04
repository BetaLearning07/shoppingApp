import 'package:ecom_thin_ui/data/home_model.dart';
import 'package:ecom_thin_ui/routes/app_pages.dart';
import 'package:ecom_thin_ui/theme/device_size_helper.dart';
import 'package:ecom_thin_ui/theme/styles.dart';
import 'package:ecom_thin_ui/theme/ui_helper.dart';
import 'package:ecom_thin_ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductThumbnail extends StatelessWidget {
  final Products? data;
  const ProductThumbnail({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.pushNamed(context, Routes.productDetail);
      },
      onLongPress: () {
        // _rotateDialog(context);
        showModalBottomSheet(
          context: context,
          builder: ((context) => BottomSheetContent(
                key: key,
                productData: data!,
              )),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.white,
        );
      },
      child: Card(
        margin: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: HostedImage(imageurl: data!.image!, asdpectRatio: 1.0),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      data!.brand == "" ? data!.categoryName! : data!.brand!,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      data!.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryGreyText2),
                    ),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '\u20B9 ',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryGreyText2,
                                    ),
                              ),
                              TextSpan(
                                text: '${data!.pricing!.price ?? 0}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -.5),
                              )
                            ]))),
                      ),
                      const Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: HostedImage(
                                imageurl:
                                    'https://aseztak.ap-south-1.linodeobjects.com/notification/92fbab5f-ec07-421e-a010-ef65bc6887f5.png',
                                asdpectRatio: 7)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final Products productData;

  const BottomSheetContent({Key? key, required this.productData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ////thumb data required
    List imageList = [
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-1334-c294ea64-2f7b-450b-8870-dab82c6aeb6e2022-05-13-Jul-1657025014.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0518-0216-c0f28b92-20fa-43a9-ad18-6781e3121b902022-05-02-Jul-1657024336.jpg",
      "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0517-5110-c6d31b2d-8381-4bad-b212-98ed917fd52a2022-05-51-Jul-1657023670.jpg",
    ];

    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250.h,
                  child: ListView(
                      padding: const EdgeInsets.all(0),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: HostedImage(
                                    imageurl: imageList[index],
                                    asdpectRatio: 1),
                              ))),
                ),
                UIHelper.verticalSpaceLarge(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productData.title!,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.normal,
                                color: AppColors.primaryGreyText2),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          horizontalTitleSubtitle(
                              title: 'Price: ',
                              subtitle:
                                  '\u20B9${productData.pricing!.price}/${productData.pricing!.unit}',
                              context: context),
                          horizontalTitleSubtitle(
                              title: 'MOQ: ',
                              subtitle:
                                  '${productData.pricing!.moq}/${productData.pricing!.unit}',
                              context: context),
                          Text(
                            'Available',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green),
                          )
                        ],
                      ),
                      Divider(height: 18.h),
                      Center(
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                            text: 'Sold By: ',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryGreyText2,
                                ),
                          ),
                          TextSpan(
                            text: 'Rajdhani Garmnets, West Bengal',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -.3,
                                    color: AppColors.buyNow2,
                                    fontStyle: FontStyle.italic),
                          )
                        ])),
                      ),
                      UIHelper.verticalSpaceMedium(),
                    ],
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: getWidth / 1.5,
                    child: ElevatedButton(
                        onPressed: () async {},
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(3),
                            minimumSize: MaterialStateProperty.all(
                                const Size.fromHeight(40)),
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ))),
                        child: Text(
                          "Add to cart",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

horizontalTitleSubtitle(
    {required String title,
    required String subtitle,
    required BuildContext context}) {
  return Row(
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.normal, color: AppColors.primaryGreyText2),
      ),
      Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.w700, color: AppColors.black),
      )
    ],
  );
}

// void _rotateDialog(context) {
//   showGeneralDialog(
//     barrierDismissible: false,
//     context: context,
//     pageBuilder: (context, a1, a2) {
//       return Container();
//     },
//     transitionBuilder: (context, a1, a2, child) {
//       var curve = Curves.easeInOut.transform(a1.value);
//       return Transform.scale(
//         scale: curve,
//         child: _dialog(context),
//       );
//     },
//     transitionDuration: const Duration(milliseconds: 300),
//   );
// }

// Widget _dialog(BuildContext context) {
//   return AlertDialog(
//     title: const Text("Hi Prem"),
//     content: const Text("This is animated Dialogue"),
//     actions: <Widget>[
//       TextButton(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           child: const Text("Okay"))
//     ],
//   );
// }
