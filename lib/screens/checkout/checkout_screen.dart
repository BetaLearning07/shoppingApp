import 'package:shopping_app/routes/app_pages.dart';
import 'package:shopping_app/screens/checkout/online_payment_option_screen.dart';
import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:shopping_app/widgets/dotted_divider.dart';
import 'package:shopping_app/widgets/hosted_image.dart';
import 'package:shopping_app/widgets/local_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

GlobalKey<FormState>? _menuKey;

final _formKey = GlobalKey<FormBuilderState>();
final _paymentOptionFormKey = GlobalKey<FormBuilderState>();

//: TODO add default address to selectedAddress very first when checkout api calling and update it whenever new address create
Map selectedAddress = {
  "phone": "5996877488",
  "id": 3062,
  "user_id": 1,
  "pincode": "734001",
  "locality": "Gurung Basti ",
  "default_address": true,
  "country": "India",
  "created_at": "2022-07-19T13:57:15",
  "deleted_at": null,
  "alt_phone": "",
  "ship_to": "Suman Dada ",
  "address": "Jaiswal Mansion ",
  "city": "Siliguri",
  "state": "West Bengal",
  "updated_at": "2022-07-26T19:00:30"
};

List paymentOption = [
  {
    "value": "ONLINE",
    "title": "Pay Online",
    "description": "Use Netbanking, Debit Card or Credit Card",
    "visible": true,
    "disabled": false,
    "discount": 0,
    "discount_text": "",
    "offer": ""
  },
  {
    "value": "COD",
    "title": "Remaining COD limit",
    "description": "₹0 out of ₹10000",
    "visible": true,
    "disabled": false,
    "discount": 0,
    "discount_text": "",
    "offer": ""
  }
];

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  onNewAddressSelectCallBack(Map data) {
    setState(() {
      selectedAddress.addAll(data);
    });
  }

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
                        if (_paymentOptionFormKey.currentState!
                            .saveAndValidate()) {
                          if (_paymentOptionFormKey
                                  .currentState!.value['value'] ==
                              'ONLINE') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const OnlinePaymentOptionScreen()));
                          } else if (_paymentOptionFormKey
                                  .currentState!.value['value'] ==
                              'COD') {
                            Navigator.pushNamed(context, Routes.orderFailed);
                          }
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.primaryColor)),
                      child: Text(
                        'Proceed',
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
              'Checkout',
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                TopContentWidget(
                  key: widget.key,
                ),
                CheckOutAddressWidget(
                  key: widget.key,
                  onAddressSelect: onNewAddressSelectCallBack,
                ),
                CheckOutOrderSummary(
                  key: widget.key,
                ),
                PaymentOptionWidget(
                  key: widget.key,
                ),
                ItemsWidget(
                  key: widget.key,
                )
              ])),
        ],
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

class CheckOutAddressWidget extends StatelessWidget {
  final Function onAddressSelect;

  const CheckOutAddressWidget({Key? key, required this.onAddressSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return chackOutData['shipping_address'].isNotEmpty
        ? Stack(
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
                          child: Icon(
                            IcoFontIcons.home,
                            size: 20.sp,
                            color: AppColors.darkSky,
                          )),
                      UIHelper.horizontalSpaceSmall(),
                      Expanded(
                        flex: 11,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deliver to:',
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
                              'Shop: ${selectedAddress['ship_to']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primaryGreyText2),
                            ),
                            Text(
                              "${selectedAddress['address']}, ${selectedAddress['locality']}, ${selectedAddress['city']}, ${selectedAddress['state']}-${selectedAddress['pincode']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: AppColors.primaryGreyText2),
                            ),
                            selectedAddress['alt_phone'] == ""
                                ? Text('Phone No. ${selectedAddress['phone']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            color: AppColors.primaryGreyText2))
                                : Text(
                                    'Phone No. ${selectedAddress['phone']}, ${selectedAddress['alt_phone']}',
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
                right: 0,
                top: 0,
                child: PopupMenuButton(
                  icon: const Icon(Icons.more_vert),
                  key: _menuKey,
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      onTap: () async {
                        await Future.delayed(Duration.zero);
                        _changeAddressModal(
                            context: context, onselect: onAddressSelect);
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.change_circle_outlined,
                            size: 16.sp,
                          ),
                          UIHelper.horizontalSpace(5.w),
                          const Text('Change'),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {
                        await Future.delayed(Duration.zero);
                        _createNewAddressModal(
                            context: context, title: 'Create New Address');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle_outline_sharp,
                            size: 16.sp,
                          ),
                          UIHelper.horizontalSpace(5.w),
                          const Text('Add New'),
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      onTap: () async {
                        await Future.delayed(Duration.zero);
                        _createNewAddressModal(
                            context: context, title: 'Edit Address');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_location_outlined,
                            size: 16.sp,
                          ),
                          UIHelper.horizontalSpace(5.w),
                          const Text('Edit'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : InkWell(
            onTap: () {
              _createNewAddressModal(
                  context: context, title: 'Create New Address');
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 24.sp,
                      color: AppColors.skyBlue,
                    ),
                    UIHelper.horizontalSpace(10.w),
                    Text(
                      'Add New Address',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: AppColors.skyBlue,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

class PaymentOptionWidget extends StatelessWidget {
  const PaymentOptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Container(
        padding: EdgeInsets.only(top: 12.h, left: 8.w, right: 8.w),
        width: getWidth,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Icon(
                      IcoFontIcons.home,
                      size: 20.sp,
                      color: AppColors.darkSky,
                    )),
                UIHelper.horizontalSpaceSmall(),
                Expanded(
                  flex: 11,
                  child: Text(
                    'Payment Option',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryGreyText3),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilder(
                  key: _paymentOptionFormKey,
                  child: FormBuilderRadioGroup(
                    activeColor: AppColors.primaryColor,
                    orientation: OptionsOrientation.vertical,
                    decoration: const InputDecoration(border: InputBorder.none),
                    initialValue: null,
                    name: 'value',
                    // onChanged: _onChanged,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Please select any one payment method')
                    ]),
                    options: paymentOption
                        .map((lang) => FormBuilderFieldOption(
                              value: lang['value'],
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          lang['title'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          lang['description'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                        Visibility(
                                            visible: lang['discount_text'] == ""
                                                ? false
                                                : true,
                                            child: Text(
                                              lang['discount_text'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      color: AppColors.red),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: lang['value'] == 'ONLINE'
                                        ? true
                                        : false,
                                    child: const Expanded(
                                      flex: 2,
                                      child: LocalImage(
                                          imageurl:
                                              'assets/images/online-payment.gif',
                                          asdpectRatio: 4),
                                    ),
                                  )
                                ],
                              ),
                            ))
                        .toList(growable: true),
                    controlAffinity: ControlAffinity.leading,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Icon(
                    IcoFontIcons.cube,
                    size: 20.sp,
                    color: AppColors.darkSky,
                  )),
              UIHelper.horizontalSpaceSmall(),
              Expanded(
                flex: 11,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryGreyText3),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 5.h),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: chackOutData['order_summary'].length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = chackOutData['order_summary'][index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data['name'],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.primaryGreyText2),
                              ),
                              Text(
                                data['value'],
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
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

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      margin: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
      child: Container(
          width: getWidth,
          padding:
              EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        IcoFontIcons.cube,
                        size: 20.sp,
                        color: AppColors.darkSky,
                      )),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ListView.builder(
                  padding: EdgeInsets.only(top: 5.h, left: 8.w),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: chackOutData['item_data'].length,
                  itemBuilder: (BuildContext context, int index) {
                    var selleData = chackOutData['item_data'][index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: '${selleData['seller']['name']} - ',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryGreyText2),
                          ),
                          TextSpan(
                            text: '${selleData['seller']['address']}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.primaryGreyText2,
                                    fontStyle: FontStyle.italic),
                          ),
                        ])),
                        ListView.builder(
                          padding: EdgeInsets.only(top: 8.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: selleData['product_data'].length,
                          itemBuilder: (BuildContext context, int index2) {
                            var data = selleData['product_data'][index2];
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: HostedImage(
                                          imageurl: data['image'],
                                          asdpectRatio: 1),
                                    ),
                                    UIHelper.horizontalSpaceMedium(),
                                    Expanded(
                                        flex: 8,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data['title'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors
                                                          .primaryGreyText3),
                                            ),
                                            UIHelper.verticalSpaceSmall(),
                                            Text.rich(
                                              TextSpan(children: [
                                                TextSpan(
                                                  text:
                                                      data['items'].toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .primaryGreyText2),
                                                ),
                                                TextSpan(
                                                  text: ' Item',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .primaryGreyText2),
                                                ),
                                              ]),
                                            ),
                                            UIHelper.verticalSpaceSmall(),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 6,
                                                  child: Text(
                                                      "₹${data['amount']}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .subtitle2!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .black,
                                                              letterSpacing:
                                                                  .1)),
                                                ),
                                                Expanded(
                                                    flex: 6,
                                                    child: ElevatedButton(
                                                        onPressed: null,
                                                        style: ButtonStyle(
                                                            minimumSize:
                                                                MaterialStateProperty
                                                                    .all(Size
                                                                        .fromHeight(28
                                                                            .h)),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(AppColors
                                                                        .primaryGreyText4)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.edit,
                                                              size: 16.sp,
                                                              color: AppColors
                                                                  .skyBlue,
                                                            ),
                                                            UIHelper
                                                                .horizontalSpaceExtraSmall(),
                                                            Text(
                                                              'Edit',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                            ),
                                                          ],
                                                        ))),
                                                UIHelper.horizontalSpaceSmall(),
                                                Expanded(
                                                    flex: 7,
                                                    child: ElevatedButton(
                                                        onPressed: null,
                                                        style: ButtonStyle(
                                                            minimumSize:
                                                                MaterialStateProperty
                                                                    .all(Size
                                                                        .fromHeight(28
                                                                            .h)),
                                                            backgroundColor:
                                                                MaterialStateProperty
                                                                    .all(AppColors
                                                                        .primaryGreyText4)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.delete,
                                                              size: 16.sp,
                                                              color: AppColors
                                                                  .darkOrage,
                                                            ),
                                                            UIHelper
                                                                .horizontalSpaceExtraSmall(),
                                                            Text(
                                                              'Delete',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                            ),
                                                          ],
                                                        ))),
                                              ],
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                Visibility(
                                    visible: index2 ==
                                            selleData['product_data'].length - 1
                                        ? false
                                        : true,
                                    child: const Divider())
                              ],
                            );
                          },
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          color: Colors.grey.shade100,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.vertical,
                                  children: [
                                    Text(
                                      "₹ ${double.parse(selleData['total_amount'] ?? '') + double.parse(selleData['delivery_charge'] ?? '')}",
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    Text(
                                      double.parse(selleData['delivery_charge'])
                                              .toStringAsFixed(0)
                                              .isEmpty
                                          ? "(₹${selleData['total_amount']} + Free Shipping)"
                                          : "(₹${selleData['total_amount']} + ₹${double.parse(selleData['delivery_charge'] ?? '').toStringAsFixed(0)} Shipping)",
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                    UIHelper.verticalSpaceExtraSmall(),
                                    selleData['order_checkout_text'] != ""
                                        ? Text(
                                            "${selleData['order_checkout_text']}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: AppColors.skyBlue),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                  onPressed: () async {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Explore More",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                  color: AppColors.darkBlue)),
                                      UIHelper.horizontalSpaceSmall(),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        UIHelper.verticalSpaceLarge()
                      ],
                    );
                  },
                ),
              ]),
            ],
          )),
    );
  }
}

_changeAddressModal(
    {required BuildContext context, required Function onselect}) {
  return showModalBottomSheet(
    context: context,
    builder: ((context) => Container(
          padding: EdgeInsets.all(10.sp),
          height: getHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: chackOutData['shipping_address'].length,
                itemBuilder: (BuildContext context, int index) {
                  var data = chackOutData['shipping_address'][index];
                  return InkWell(
                    onTap: () {
                      onselect(data);
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: .5,
                      margin: EdgeInsets.only(
                        bottom: 5.h,
                      ),
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
                                    'Deliver to:',
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
                                    'Shop: ${data['ship_to']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryGreyText2),
                                  ),
                                  Text(
                                    "${data['address']}, ${data['locality']}, ${data['city']}, ${data['state']}-${data['pincode']}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            color: AppColors.primaryGreyText2),
                                  ),
                                  data['alt_phone'] == ""
                                      ? Text('Phone No. ${data['phone']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryGreyText2))
                                      : Text(
                                          'Phone No. ${data['phone']}, ${data['alt_phone']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  color: AppColors
                                                      .primaryGreyText2))
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
            ],
          ),
        )),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: Colors.white,
  );
}

_createNewAddressModal({required BuildContext context, required String title}) {
  showModalBottomSheet(
    context: context,
    builder: ((context) => Container(
        padding: EdgeInsets.all(10.sp),
        height: getHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0.w, bottom: 5.h, top: 5.h),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormBuilderTextField(
                          // initialValue: controller.userDetail['firstName'],
                          autofillHints: const [AutofillHints.postalCode],
                          name: 'shop_name',
                          decoration: InputDecoration(
                            labelText: 'Shop/Your Name*',
                            prefixIcon: const Icon(IcoFontIcons.businessMan),
                            labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(
                                left: 25.w, top: 15.h, bottom: 15.h),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 215, 215, 215)),
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Name required'),
                          ]),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                        ),

                        /////////
                        UIHelper.verticalSpaceMedium(),
                        //////
                        FormBuilderTextField(
                          // initialValue: controller.userDetail['firstName'],
                          autofillHints: const [AutofillHints.postalCode],
                          name: 'locality',
                          decoration: InputDecoration(
                            labelText: 'Locatlity*',
                            prefixIcon: const Icon(IcoFontIcons.locationPin),
                            labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(
                                left: 25.w, top: 15.h, bottom: 15.h),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 215, 215, 215)),
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Name required'),
                          ]),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                        ),
                        UIHelper.verticalSpaceMedium(),
                        //////
                        FormBuilderTextField(
                          // initialValue: controller.userDetail['firstName'],
                          autofillHints: const [AutofillHints.postalCode],
                          name: 'address',
                          decoration: InputDecoration(
                            labelText: 'Address*',
                            prefixIcon: const Icon(IcoFontIcons.locationPin),
                            labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(
                                left: 25.w, top: 15.h, bottom: 15.h),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 215, 215, 215)),
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: 'Name required'),
                          ]),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                        ),
                        UIHelper.verticalSpaceMedium(),

                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: FormBuilderTextField(
                                // initialValue: controller.userDetail['firstName'],
                                autofillHints: const [AutofillHints.postalCode],
                                name: 'pincode',
                                decoration: InputDecoration(
                                  labelText: 'Pincode*',
                                  prefixIcon:
                                      const Icon(IcoFontIcons.locationPin),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.only(
                                      left: 25.w, top: 15.h, bottom: 15.h),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 215, 215, 215)),
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.min(6,
                                      errorText: 'Invalid Pincode'),
                                  FormBuilderValidators.max(6,
                                      errorText: 'Invalid Pincode'),
                                  FormBuilderValidators.required(
                                      errorText: 'Pincode required'),
                                ]),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            Expanded(
                              flex: 6,
                              child: FormBuilderTextField(
                                // initialValue: controller.userDetail['firstName'],
                                autofillHints: const [AutofillHints.postalCode],
                                name: 'ciry',
                                decoration: InputDecoration(
                                  labelText: 'City*',
                                  prefixIcon:
                                      const Icon(IcoFontIcons.locationPin),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.only(
                                      left: 25.w, top: 15.h, bottom: 15.h),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 215, 215, 215)),
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'City required'),
                                ]),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceMedium(),
                        Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: FormBuilderTextField(
                                // initialValue: controller.userDetail['firstName'],
                                autofillHints: const [AutofillHints.postalCode],
                                name: 'state',
                                decoration: InputDecoration(
                                  labelText: 'State*',
                                  prefixIcon:
                                      const Icon(IcoFontIcons.locationPin),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.only(
                                      left: 25.w, top: 15.h, bottom: 15.h),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 215, 215, 215)),
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'State required'),
                                ]),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall(),
                            Expanded(
                              flex: 4,
                              child: FormBuilderTextField(
                                readOnly: true,
                                initialValue: 'India',
                                autofillHints: const [AutofillHints.postalCode],
                                name: 'country',
                                decoration: InputDecoration(
                                  labelText: 'Country*',
                                  prefixIcon:
                                      const Icon(IcoFontIcons.locationPin),
                                  labelStyle:
                                      const TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.only(
                                      left: 25.w, top: 15.h, bottom: 15.h),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 215, 215, 215)),
                                      borderRadius: BorderRadius.circular(50)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1.5),
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                      errorText: 'City required'),
                                ]),
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceMedium(),
                        FormBuilderTextField(
                          // initialValue: controller.userDetail['firstName'],
                          autofillHints: const [AutofillHints.postalCode],
                          name: 'phone',
                          decoration: InputDecoration(
                            labelText: 'Mobile*',
                            prefixIcon: const Icon(
                              IcoFontIcons.phone,
                            ),
                            labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(
                                left: 25.w, top: 15.h, bottom: 15.h),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 215, 215, 215)),
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.min(10,
                                errorText: 'Invalid Mobile'),
                            FormBuilderValidators.max(10,
                                errorText: 'Invalid Mobile'),
                            FormBuilderValidators.required(
                                errorText: 'Mobile required'),
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                        UIHelper.verticalSpaceMedium(),
                        FormBuilderTextField(
                          // initialValue: controller.userDetail['firstName'],
                          autofillHints: const [AutofillHints.postalCode],
                          name: 'phone_alt',
                          decoration: InputDecoration(
                            labelText: 'Alternate Mobile',
                            prefixIcon: const Icon(IcoFontIcons.phone),
                            labelStyle: const TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(
                                left: 25.w, top: 15.h, bottom: 15.h),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 215, 215, 215)),
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.min(10,
                                errorText: 'Invalid Alternate Mobile'),
                            FormBuilderValidators.max(10,
                                errorText: 'Invalid Alternate Mobile'),
                            FormBuilderValidators.required(
                                errorText: 'Alternate Mobile number required'),
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                        UIHelper.verticalSpaceLarge(),
                        ElevatedButton(
                            onPressed: () async {
                              //: TODO Call Create Address Api and Recall Checkout Api for new address

                              // _formKey.currentState!.save();
                              // if (_formKey.currentState!.validate()) {
                              //   await controller.updateUserDetail(
                              //       data: _formKey.currentState!.value,
                              //       context: context);
                              // }
                            },
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(3),
                                minimumSize: MaterialStateProperty.all(
                                    Size.fromHeight(35.h)),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.primaryColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ))),
                            child: Text("Create",
                                style: Theme.of(context).textTheme.button)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ))),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: Colors.white,
  );
}

Map chackOutData = {
  "status_code": 200,
  "offer_text": "",
  "shipping_address": [
    {
      "phone": "5996877488",
      "id": 3062,
      "user_id": 1,
      "pincode": "734001",
      "locality": "Gurung Basti ",
      "default_address": true,
      "country": "India",
      "created_at": "2022-07-19T13:57:15",
      "deleted_at": null,
      "alt_phone": "",
      "ship_to": "Suman Dada ",
      "address": "Jaiswal Mansion ",
      "city": "Siliguri",
      "state": "West Bengal",
      "updated_at": "2022-07-26T19:00:30"
    },
    {
      "phone": "8569422535",
      "id": 3063,
      "user_id": 1,
      "pincode": "734009",
      "locality": "Dalkhola",
      "default_address": false,
      "country": "India",
      "created_at": "2022-07-19T15:58:52",
      "deleted_at": null,
      "alt_phone": "",
      "ship_to": "Rahul Singha",
      "address": "Dalkhola",
      "city": "Islampur",
      "state": "West Bengal",
      "updated_at": "2022-07-19T15:58:52"
    },
    {
      "phone": "6594649594",
      "id": 3073,
      "user_id": 1,
      "pincode": "734003",
      "locality": "Gurung Basti ",
      "default_address": false,
      "country": "India",
      "created_at": "2022-07-22T14:27:33",
      "deleted_at": null,
      "alt_phone": "",
      "ship_to": "Ram Lal",
      "address": "Jaiswal Mansion ",
      "city": "Siliguri ",
      "state": "West Bengal ",
      "updated_at": "2022-07-22T14:27:33"
    }
  ],
  "user_documents": [
    {"name": "GSTIN", "value": "", "selected": false},
    {"name": "AADHAAR", "value": "856235629584", "selected": true},
    {"name": "PAN", "value": "", "selected": false}
  ],
  "payment_method": [
    {
      "value": "ONLINE",
      "title": "Pay Online",
      "description": "Use Netbanking, Debit Card or Credit Card",
      "visible": true,
      "disabled": false,
      "discount": 0,
      "discount_text": "",
      "offer": ""
    },
    {
      "value": "COD",
      "title": "Remaining COD limit",
      "description": "₹0 out of ₹10000",
      "visible": true,
      "disabled": false,
      "discount": 0,
      "discount_text": "",
      "offer": ""
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
      "name": "Shipping Charge ",
      "value": "99.00",
      "currency": true,
      "visisble": true,
      "offer_text": ""
    }
  ],
  "grand_total": {
    "title": "Grand Total",
    "payment_method": "COD",
    "discount_rate": "0.00",
    "discount_amount": "0.00",
    "round_off": "-0.32",
    "amount": "8255.00",
    "partial": "0.00"
  },
  "item_data": [
    {
      "seller": {
        "id": 65,
        "name": "Rajdhani Garments",
        "address": "Siliguri, West Bengal"
      },
      "product_data": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1117-3257-55dfbddc-f414-4615-9a95-8a9eb59f7c6c2022-11-32-Jul-1657540977.jpg",
          "id": 11694,
          "title": "Mixed Color Fashionable Design Ladies Night Suits 01",
          "slug": "mixed-color-fashionable-design-ladies-night-suits-01",
          "items": 1,
          "amount": "1566.78"
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-1117-4652-0fd3118a-402b-4014-9d04-a412095ebde32022-11-46-Jul-1657541812.jpg",
          "id": 11698,
          "title": "Mixed Color Fashionable Design Ladies Night Suits 04",
          "slug": "mixed-color-fashionable-design-ladies-night-suits-04",
          "items": 1,
          "amount": "1566.78"
        },
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-2719-2500-2e9d1cbc-fe7b-408d-9422-feac8a67d4862022-27-25-Jul-1658930100.jpg",
          "id": 11985,
          "title": "Animie Printed Fashionable Multicolor T-Shirts",
          "slug": "animie-printed-fashionable-multicolor-t-shirts",
          "items": 2,
          "amount": "3818.20"
        }
      ],
      "total_amount": "6951.76",
      "delivery_charge": "0.00",
      "min_order_value": "0.00",
      "order_checkout_text": "Free Shipping",
      "free_delivery": true,
      "checkTotalAmountforCodLimit": ""
    },
    {
      "seller": {
        "id": 23358,
        "name": "Dagna Sales",
        "address": "New Delhi, Delhi"
      },
      "product_data": [
        {
          "image":
              "https://aseztak.ap-south-1.linodeobjects.com/products/product_202207-0113-3531-fc68c2ae-c315-4f84-ae77-7071f82c65ce2022-01-35-Jul-1656662731.JPG",
          "id": 11444,
          "title": "Casual Wear Neon Green PVC Flip-Flops a406",
          "slug": "casual-wear-neon-green-pvc-flip-flops-a406",
          "items": 1,
          "amount": "1204.56"
        }
      ],
      "total_amount": "1204.56",
      "delivery_charge": "99.00",
      "min_order_value": "2000.00",
      "order_checkout_text": "Get Free Delivery on order of 2000 and above",
      "free_delivery": false,
      "checkTotalAmountforCodLimit": ""
    }
  ]
};
