import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

class OrderSucessScreen extends StatelessWidget {
  const OrderSucessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: getWidth,
                      height: getHeight / 1.5,
                      child: Image.asset(
                        'assets/images/order-success-bg.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UIHelper.verticalSpace(
                          getHeight / 2.5,
                        ),
                        ElevatedButton(
                            onPressed: null,
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(AppColors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ))),
                            child: Text(
                              'WoooHooo!',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: AppColors.darkPrimaryColor,
                                      fontWeight: FontWeight.w700),
                            )),
                        UIHelper.verticalSpaceMedium(),
                        Text(
                          'Congratulations',
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                          textAlign: TextAlign.center,
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Text(
                          'Order Placed Successfully!',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                UIHelper.verticalSpaceLarge(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Order Will be dispatch within 5-6 days',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                UIHelper.verticalSpaceMedium(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ))),
                        child: Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: AppColors.black,
                              size: 22.sp,
                            ),
                            UIHelper.horizontalSpaceExtraSmall(),
                            Text(
                              'Go to Home',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ))),
                        child: Row(
                          children: [
                            Icon(
                              IcoFontIcons.cube,
                              color: AppColors.black,
                              size: 22.sp,
                            ),
                            UIHelper.horizontalSpaceExtraSmall(),
                            Text(
                              'Manage Orders',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                  ],
                )
              ])),
        ],
      ),
    );
  }
}
