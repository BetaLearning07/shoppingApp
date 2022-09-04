import 'dart:io';

import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';

String selectedReason = "";
String typedReason = "";
List<XFile>? proofImage = [];
final ImagePicker _picker = ImagePicker();

final _formKeyReturnReason = GlobalKey<FormBuilderState>();
final _bankDetailKey = GlobalKey<FormBuilderState>();

class ReturnReasonScreen extends StatefulWidget {
  final List returnReason;

  const ReturnReasonScreen({Key? key, required this.returnReason})
      : super(key: key);

  @override
  State<ReturnReasonScreen> createState() => _ReturnReasonScreenState();
}

class _ReturnReasonScreenState extends State<ReturnReasonScreen> {
  Future<void> getImageFromGallery() async {
    final XFile? tempImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (tempImage != null) {
      setState(() {
        proofImage?.add(tempImage);
      });

      // imageFileList!.insert(index, XFile(tempImage.path));

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
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
                        if (_formKeyReturnReason.currentState!
                                .saveAndValidate() &&
                            _bankDetailKey.currentState!.saveAndValidate()) {}
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.primaryColor)),
                      child: Text(
                        'Return Confirm',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpace(40.h),
              Text.rich(
                  TextSpan(style: const TextStyle(fontSize: 12), children: [
                TextSpan(
                    text: 'Note: ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.red)),
                TextSpan(
                    text:
                        ' Image should be clear to see, if we found the given reason and image proof is not valid for return your return request will be decline',
                    style: Theme.of(context).textTheme.bodyMedium),
              ])),
              UIHelper.verticalSpaceSmall(),
              Text(
                'Image proof (Upto 5 Images)',
                style: Theme.of(context).textTheme.headline4,
              ),
              GridView.builder(
                padding: EdgeInsets.only(top: 15.h, bottom: 0.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: proofImage!.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == proofImage!.length) {
                    return Visibility(
                      visible: proofImage!.length == 5 ? false : true,
                      child: InkWell(
                        onTap: () {
                          getImageFromGallery();
                        },
                        child: Container(
                          margin: EdgeInsets.all(4.0.sp),
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(
                                color: AppColors.primaryGreyText5,
                              ),
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add),
                              Text(
                                'Add Image',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                        margin: EdgeInsets.all(2.0.sp),
                        padding: EdgeInsets.all(4.0.sp),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            border:
                                Border.all(color: AppColors.primaryGreyText4),
                            borderRadius: BorderRadius.circular(10.sp)),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(4.0)),
                                child: Image.file(
                                  File(proofImage![index].path),
                                )),
                            Positioned(
                              right: -13,
                              top: -13,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      proofImage!.removeAt(index);
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_circle,
                                    size: 20.sp,
                                  )),
                            )
                          ],
                        ));
                  }
                },
              ),
              UIHelper.verticalSpace(30.h),
              Text(
                'Please choose any one reason',
                style: Theme.of(context).textTheme.headline4,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 10.h),
                shrinkWrap: true,
                itemCount: widget.returnReason.length,
                itemBuilder: (BuildContext context, int index) {
                  return RadioListTile(
                    contentPadding: const EdgeInsets.all(0),
                    activeColor: Colors.blue,
                    value: true,
                    groupValue: widget.returnReason[index]['selected'],
                    onChanged: (value) {
                      setState(() {
                        for (var i = 0; i < widget.returnReason.length; i++) {
                          if (index == i) {
                            widget.returnReason[i]['selected'] = true;
                            selectedReason = widget.returnReason[i]['text'];
                          } else {
                            widget.returnReason[i]['selected'] = false;
                          }
                        }
                      });
                    },
                    title: Text(widget.returnReason[index]['text']),
                  );
                },
              ),
              Visibility(
                visible: selectedReason == "Other" ? true : false,
                child: FormBuilder(
                    key: _formKeyReturnReason,
                    child: FormBuilderTextField(
                      maxLines: 3,
                      name: 'reason',
                      decoration: const InputDecoration(
                        hintText: 'Please explain us why are you returning?',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),

                      onChanged: (code) {
                        typedReason = code.toString();
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                            errorText: "Return reason can't be empty"),
                        FormBuilderValidators.max(500),
                      ]),
                      keyboardType: TextInputType.text,
                    )),
              ),
              UIHelper.verticalSpaceSmall(),
              Text(
                'Bank Details',
                style: Theme.of(context).textTheme.headline4,
              ),
              UIHelper.verticalSpace(5.h),
              FormBuilder(
                key: _bankDetailKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: FormBuilderTextField(
                            // initialValue: controller.userDetail['firstName'],
                            autofillHints: const [AutofillHints.postalCode],

                            name: 'holder_name',
                            decoration: InputDecoration(
                              labelText: 'Account Holder Name',
                              labelStyle: const TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 25.w, top: 15.h, bottom: 15.h),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 215, 215, 215)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),

                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Account holder name required'),
                            ]),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                        UIHelper.horizontalSpace(5.w),
                        Expanded(
                          child: FormBuilderTextField(
                            // initialValue: controller.userDetail['lastName'],
                            autofillHints: const [AutofillHints.postalCode],

                            name: 'bank_name',

                            decoration: InputDecoration(
                              labelText: 'Bank Name',
                              labelStyle: const TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 25.w, top: 15.h, bottom: 15.h),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 215, 215, 215)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Bank name required'),
                            ]),

                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpace(10.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: FormBuilderTextField(
                            // initialValue: controller.userDetail['lastName'],
                            autofillHints: const [AutofillHints.postalCode],

                            name: 'account_number',

                            decoration: InputDecoration(
                              labelText: 'Account Number',
                              labelStyle: const TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 25.w, top: 15.h, bottom: 15.h),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 215, 215, 215)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Account number required'),
                            ]),

                            keyboardType: TextInputType.number,
                          ),
                        ),
                        UIHelper.horizontalSpace(5.w),
                        Expanded(
                          flex: 5,
                          child: FormBuilderTextField(
                            // initialValue: controller.userDetail['email'],
                            autofillHints: const [AutofillHints.postalCode],

                            name: 'ifsc',
                            decoration: InputDecoration(
                              labelText: 'IFSC Code',
                              labelStyle: const TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 25.w, top: 15.h, bottom: 15.h),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 215, 215, 215)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10)),
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
                      ],
                    ),
                    UIHelper.verticalSpace(10.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: FormBuilderDropdown(
                            name: 'account_type',
                            decoration: InputDecoration(
                                labelText: 'Account Type',
                                labelStyle: const TextStyle(color: Colors.grey),
                                contentPadding: EdgeInsets.only(
                                    left: 25.w,
                                    top: 12.h,
                                    bottom: 12.h,
                                    right: 15.w),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 215, 215, 215)),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1.5),
                                    borderRadius: BorderRadius.circular(10)),
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
                        ),
                        UIHelper.horizontalSpace(5.w),
                        Expanded(
                          flex: 6,
                          child: FormBuilderTextField(
                            // initialValue: controller.userDetail['mobile'],
                            autofillHints: const [AutofillHints.postalCode],

                            name: 'branch_address',
                            decoration: InputDecoration(
                              labelText: 'Branch Address',
                              labelStyle: const TextStyle(color: Colors.grey),
                              contentPadding: EdgeInsets.only(
                                  left: 25.w, top: 15.h, bottom: 15.h),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 215, 215, 215)),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.primaryColor,
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10)),
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
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
