import 'package:ecom_thin_ui/theme/colors.dart';
import 'package:ecom_thin_ui/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

final _formKey = GlobalKey<FormBuilderState>();

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: true,
            floating: true,
            title: Text(
              'Update Shipping Address',
            ),
          ),
          SliverToBoxAdapter(
            child: AddressForm(),
          )
        ],
      ),
    );
  }
}

class AddressForm extends StatelessWidget {
  const AddressForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
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
                contentPadding:
                    EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                FormBuilderValidators.required(errorText: 'Name required'),
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
                contentPadding:
                    EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                FormBuilderValidators.required(errorText: 'Name required'),
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
                contentPadding:
                    EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                FormBuilderValidators.required(errorText: 'Name required'),
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
                      prefixIcon: const Icon(IcoFontIcons.locationPin),
                      labelStyle: const TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                      prefixIcon: const Icon(IcoFontIcons.locationPin),
                      labelStyle: const TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                      prefixIcon: const Icon(IcoFontIcons.locationPin),
                      labelStyle: const TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                      prefixIcon: const Icon(IcoFontIcons.locationPin),
                      labelStyle: const TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                contentPadding:
                    EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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
                FormBuilderValidators.min(10, errorText: 'Invalid Mobile'),
                FormBuilderValidators.max(10, errorText: 'Invalid Mobile'),
                FormBuilderValidators.required(errorText: 'Mobile required'),
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
                contentPadding:
                    EdgeInsets.only(left: 25.w, top: 15.h, bottom: 15.h),
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

            FormBuilderCheckbox(
              name: 'default',
              initialValue: false,
              // onChanged: _onChanged,
              tristate: false,
              activeColor: AppColors.primaryColor,
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Make this address default',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            UIHelper.verticalSpaceExtraLarge(),
            ElevatedButton(
                onPressed: () async {
                  // _formKey.currentState!.save();
                  // if (_formKey.currentState!.validate()) {
                  //   await controller.updateUserDetail(
                  //       data: _formKey.currentState!.value,
                  //       context: context);
                  // }
                },
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(3),
                    minimumSize:
                        MaterialStateProperty.all(Size.fromHeight(35.h)),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ))),
                child:
                    Text("Create", style: Theme.of(context).textTheme.button)),
          ],
        ),
      ),
    );
  }
}
