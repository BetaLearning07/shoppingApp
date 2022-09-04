import 'package:ecom_thin_ui/theme/colors.dart';
import 'package:ecom_thin_ui/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

final _formKey = GlobalKey<FormBuilderState>();

class BankDetailScreen extends StatelessWidget {
  const BankDetailScreen({Key? key}) : super(key: key);

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
              'Bank Detail',
            ),
          ),
          SliverToBoxAdapter(
            child: BankDetailForm(),
          )
        ],
      ),
    );
  }
}

class BankDetailForm extends StatelessWidget {
  const BankDetailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(12.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    IcoFontIcons.bankAlt,
                    size: 20.sp,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: 'Note: ',
                            style: Theme.of(context).textTheme.bodyText1),
                        TextSpan(
                          text:
                              'We are requesting you to enter your account detail correctly Aseztak will not be responsible for any account related mismatch',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontStyle: FontStyle.italic),
                        )
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            FormBuilderTextField(
              // initialValue: controller.userDetail['firstName'],
              autofillHints: const [AutofillHints.postalCode],

              name: 'holder_name',
              decoration: InputDecoration(
                labelText: 'Account Holder Name',
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
                    errorText: 'Account holder name required'),
              ]),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            UIHelper.verticalSpaceMedium(),
            FormBuilderTextField(
              // initialValue: controller.userDetail['lastName'],
              autofillHints: const [AutofillHints.postalCode],

              name: 'account_number',

              decoration: InputDecoration(
                labelText: 'Account Number',
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
                    errorText: 'Account number required'),
              ]),

              keyboardType: TextInputType.number,
            ),
            UIHelper.verticalSpaceMedium(),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: FormBuilderTextField(
                    // initialValue: controller.userDetail['email'],
                    autofillHints: const [AutofillHints.postalCode],

                    name: 'ifsc',
                    decoration: InputDecoration(
                      labelText: 'IFSC Code',
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
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'IFSC required'),
                    ]),
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
                UIHelper.horizontalSpaceSmall(),
                Expanded(
                  flex: 5,
                  child: FormBuilderDropdown(
                    name: 'account_type',
                    decoration: InputDecoration(
                        labelText: 'Account Type',
                        labelStyle: const TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.only(
                            left: 25.w, top: 12.h, bottom: 12.h, right: 15.w),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 215, 215, 215)),
                            borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.primaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(50)),
                        border: const OutlineInputBorder()),
                    // initialValue: 'Male',
                    allowClear: false,
                    hint: const Text('Account Type'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required()]),
                    items: ['Current', 'Saving']
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(gender),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
            UIHelper.verticalSpaceMedium(),
            FormBuilderTextField(
              // initialValue: controller.userDetail['lastName'],
              autofillHints: const [AutofillHints.postalCode],

              name: 'bank_name',

              decoration: InputDecoration(
                labelText: 'Bank Name',
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
                FormBuilderValidators.required(errorText: 'Bank name required'),
              ]),

              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            UIHelper.verticalSpaceMedium(),
            FormBuilderTextField(
              // initialValue: controller.userDetail['mobile'],
              autofillHints: const [AutofillHints.postalCode],

              name: 'branch_address',
              decoration: InputDecoration(
                labelText: 'Branch Address',
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
              // onChanged: _onChanged,
              // valueTransformer: (text) => num.tryParse(text),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Branch address required'),
              ]),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
            ),
            SizedBox(
              height: 60.h,
            ),
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
                    Text("Update", style: Theme.of(context).textTheme.button)),
          ],
        ),
      ),
    );
  }
}
