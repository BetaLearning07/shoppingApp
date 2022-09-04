import 'package:shopping_app/routes/app_pages.dart';
import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:shopping_app/widgets/dotted_divider.dart';
import 'package:shopping_app/widgets/local_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

import '../../theme/device_size_helper.dart';

final _paymentOptionsKey = GlobalKey<FormBuilderState>();

List paymentOptionList = [
  {
    "value": 0,
    "title": "Debit Card",
    "payment_type": "DEBIT_CARD",
    "description": "Master Card, Rupay, Visa, Amaerican Express",
    "offer_text": ""
  },
  {
    "value": 0,
    "title": "Credit Card",
    "payment_type": "CREDIT_CARD",
    "description": "Master Card, Rupay, Visa, Amaerican Express",
    "offer_text": ""
  },
  {
    "value": 3,
    "title": "UPI",
    "payment_type": "UPI",
    "description": "GPay, PhonePe, Paytm etc.",
    "offer_text": "Get 3% Instant Discount"
  },
  {
    "value": 0,
    "title": "Wallets",
    "payment_type": "BALANCE",
    "description": "Mobowiki, GPay, PhonePe, Paytm",
    "offer_text": ""
  },
  {
    "value": 0,
    "title": "Net Banking",
    "payment_type": "NET_BANKING",
    "description": "HDFC Bank, ICICI Bank, State Bank of India, Axis",
    "offer_text": ""
  }
];

class OnlinePaymentOptionScreen extends StatelessWidget {
  const OnlinePaymentOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50.h,
        decoration: const BoxDecoration(color: AppColors.white),
        width: getWidth,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0.h, right: 8.0.h),
          child: Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Go Back',
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
                      onPressed: () {
                        _paymentOptionsKey.currentState!.saveAndValidate();

                        Navigator.pushNamed(context, Routes.orderFailed);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.primaryColor)),
                      child: Text(
                        'Make Payment',
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
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
              pinned: false,
              snap: true,
              floating: true,
              title: Text(
                'Payment Option',
              )),
          SliverToBoxAdapter(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopContentWidget(
                key: key,
              ),
              OnlinePaymentOptionWidget(
                key: key,
              ),
              CheckOutOrderSummary(
                key: key,
              ),
              SecurePaymentWidget(
                key: key,
              )
            ],
          )),
        ],
      ),
    );
  }
}

class OnlinePaymentOptionWidget extends StatelessWidget {
  const OnlinePaymentOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Container(
        padding: EdgeInsets.only(top: 12.h, left: 8.w, right: 8.w),
        width: getWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0.0.w, bottom: 5.h),
              child: Text(
                'Suggested Payment Option',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryGreyText3),
              ),
            ),
            FormBuilder(
              key: _paymentOptionsKey,
              child: FormBuilderRadioGroup(
                activeColor: AppColors.primaryColor,
                orientation: OptionsOrientation.vertical,
                decoration: const InputDecoration(border: InputBorder.none),
                initialValue: null,
                name: 'value',
                // onChanged: _onChanged,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'Please select any one payment option')
                ]),
                options: paymentOptionList
                    .map((lang) => FormBuilderFieldOption(
                          value: lang['payment_type'],
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      lang['title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      lang['description'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              height: 1.5,
                                              color:
                                                  AppColors.primaryGreyText2),
                                    ),
                                    Visibility(
                                        visible: lang['offer_text'] == ""
                                            ? false
                                            : true,
                                        child: Text(
                                          lang['offer_text'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1!
                                              .copyWith(
                                                  color: AppColors.red,
                                                  height: 1.5),
                                        )),
                                    UIHelper.verticalSpaceSmall()
                                  ],
                                ),
                              ),
                              lang['title'] == 'UPI'
                                  ? const Expanded(
                                      flex: 2,
                                      child: LocalImage(
                                          imageurl: 'assets/images/payment.gif',
                                          asdpectRatio: 5),
                                    )
                                  : lang['title'] == 'Debit Card'
                                      ? const Expanded(
                                          flex: 2,
                                          child: LocalImage(
                                              imageurl:
                                                  'assets/images/card.gif',
                                              asdpectRatio: 5),
                                        )
                                      : const SizedBox.shrink()
                            ],
                          ),
                        ))
                    .toList(growable: true),
                controlAffinity: ControlAffinity.leading,
              ),
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
      elevation: 0,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTitleSubtitle(
              context: context,
              icon: Icons.thumb_up_off_alt_outlined,
              color: AppColors.black,
              subtitle: 'Quality\nProducts',
            ),
            _buildTitleSubtitle(
              context: context,
              icon: Icons.shield_moon_outlined,
              color: AppColors.black,
              subtitle: 'Secure\nPayment',
            ),
            _buildTitleSubtitle(
              context: context,
              icon: IcoFontIcons.refresh,
              color: AppColors.black,

              subtitle: 'Easy\nReturn',
              // subtitleSpan: ' Pcs',
            ),
            _buildTitleSubtitle(
              context: context,
              icon: Icons.one_k_outlined,
              color: AppColors.black,

              subtitle: '50k Order\nDelivered',
              // subtitleSpan: ' Pcs',
            ),
          ],
        ),
      ),
    );
  }
}

_buildTitleSubtitle({
  required BuildContext context,
  required String subtitle,
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
      Text.rich(
        TextSpan(children: [
          TextSpan(
            text: subtitle,
            // '\u20B94999',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  letterSpacing: -.5,
                  color: AppColors.primaryGreyText3,
                ),
          ),
        ]),
        textAlign: TextAlign.center,
      )
    ],
  );
}

class CheckOutOrderSummary extends StatelessWidget {
  const CheckOutOrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Container(
          width: getWidth,
          padding:
              EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Order Summary',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryGreyText3),
            ),
            const Divider(),
            ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: paymentOption['order_summary'].length,
              itemBuilder: (BuildContext context, int index) {
                var data = paymentOption['order_summary'][index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['name'],
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: AppColors.primaryGreyText2),
                    ),
                    Text(
                      data['value'],
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryGreyText3),
                    )
                  ],
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5.0, bottom: 3.0),
              child: DottedSeperatorView(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryGreyText3),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '₹ 56325',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGreyText3),
                  ),
                  TextSpan(
                    text: '.00',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGreyText3),
                  ),
                ])),
              ],
            )
          ])),
    );
  }
}

class SecurePaymentWidget extends StatelessWidget {
  const SecurePaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
          child: ListTile(
            minLeadingWidth: 10.w,
            contentPadding:
                EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
            leading: const Icon(
              Icons.security_rounded,
              color: AppColors.darkOrage,
            ),
            title: Text(
              'Secure Payment',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            subtitle: Text(
              'We work hard to protect your security and privacy. Our payment security system encrypts your information during transaction',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: AppColors.primaryGreyText2),
            ),
          ),
        ),
        UIHelper.verticalSpaceExtraSmall(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Powered by ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SvgPicture.network(
              'https://upload.wikimedia.org/wikipedia/commons/2/24/Paytm_Logo_%28standalone%29.svg',
              height: 12.h,
            )
          ],
        ),
      ],
    );
  }
}

Map paymentOption = {
  "status_code": 200,
  "message": "Success",
  "title": "Online Payment",
  "online_payment_options": [
    {
      "value": 0,
      "title": "Debit Card",
      "payment_type": "DEBIT_CARD",
      "description": "Master Card, Rupay, Visa, Amaerican Express",
      "offer_text": ""
    },
    {
      "value": 0,
      "title": "Credit Card",
      "payment_type": "CREDIT_CARD",
      "description": "Master Card, Rupay, Visa, Amaerican Express",
      "offer_text": ""
    },
    {
      "value": 3,
      "title": "UPI",
      "payment_type": "UPI",
      "description": "GPay, PhonePe, Paytm etc.",
      "offer_text": "Get 3% Instant Discount"
    },
    {
      "value": 0,
      "title": "Wallets",
      "payment_type": "BALANCE",
      "description": "Mobowiki, GPay, PhonePe, Paytm",
      "offer_text": ""
    },
    {
      "value": 0,
      "title": "Net Banking",
      "payment_type": "NET_BANKING",
      "description": "HDFC Bank, ICICI Bank, State Bank of India, Axis",
      "offer_text": ""
    }
  ],
  "order_summary": [
    {
      "name": "Items",
      "value": "5",
      "currency": false,
      "visible": true,
      "offer_text": ""
    },
    {
      "name": "Total Amount",
      "value": "8156.32",
      "currency": true,
      "visible": true,
      "offer_text": ""
    },
    {
      "name": "Discount",
      "value": "0.00",
      "currency": true,
      "visible": true,
      "offer_text": ""
    },
    {
      "name": "Shipping Charge ",
      "value": "99.00",
      "currency": true,
      "visible": true,
      "offer_text": ""
    }
  ],
  "grand_total": {
    "title": "Grand Total",
    "payment_method": "ONLINE",
    "discount_rate": "0.00",
    "discount_amount": "0.00",
    "round_off": "-0.32",
    "amount": "8255.00",
    "partial": "0.00"
  }
};
