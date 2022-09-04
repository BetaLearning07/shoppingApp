import 'dart:io';

import 'package:ecom_thin_ui/theme/styles.dart';
import 'package:ecom_thin_ui/theme/ui_helper.dart';
import 'package:ecom_thin_ui/widgets/local_image.dart';
import 'package:flutter/material.dart';

class InformativeBanner extends StatelessWidget {
  const InformativeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Delivery',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                    ),
                    UIHelper.verticalSpaceSmall(),
                    Text(
                      'Anything you need, deliverd.\nPick-up, Drop or Buy anything,\nfrom anywhere in your city',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: Colors.grey),
                    )
                  ],
                ),
              ),
              UIHelper.horizontalSpaceMedium(),
              const LimitedBox(
                  maxWidth: 150.0,
                  child: LocalImage(
                    asdpectRatio: 1.2,
                    imageurl: 'assets/images/quickdelivery.png',
                  )),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          DottedSeperatorView(),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _GenieCardView(
                title: 'Quick\nDelivery',
                desc: 'Get your\nOrders with\nLightning-fast\nDelivery',
                image: 'assets/images/delivery.png',
                onTap: () async {
                  // PagesController.to.getPageData(pageSlug: '/shipping');
                  // await Get.toNamed(Routes.PAGES);
                },
              ),
              UIHelper.horizontalSpaceSmall(),
              _GenieCardView(
                onTap: () async {
                  // PagesController.to.getPageData(pageSlug: '/refund');
                  // await Get.toNamed(Routes.PAGES);
                },
                title: 'Easy \nReturns',
                desc: 'Easily\nReturn your\nOrders on a\nClick',
                image: 'assets/images/easyreturn .png',
              )
            ],
          )
        ],
      ),
    );
  }
}

class _GenieCardView extends StatelessWidget {
  const _GenieCardView({
    Key? key,
    required this.title,
    required this.desc,
    required this.image,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String desc;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 2.0,
                offset: const Offset(1.0, 3.0),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.black),
              ),
              UIHelper.verticalSpaceMedium(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        desc,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(color: Colors.grey),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          color: AppColors.primaryColor,
                          height: 25.0,
                          width: 25.0,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceMedium(),
                    ],
                  ),
                  UIHelper.horizontalSpaceMedium(),
                  Flexible(
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  UIHelper.horizontalSpaceExtraSmall(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DottedSeperatorView extends StatelessWidget {
  const DottedSeperatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 400,
        itemBuilder: (context, index) => ClipOval(
          child: Container(
            margin: const EdgeInsets.all(3.0),
            width: 2.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
