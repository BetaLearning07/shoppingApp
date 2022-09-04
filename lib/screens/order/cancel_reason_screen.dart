import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

String selectedReason = "";
String typedReason = "";
final _formKeyCancelReason = GlobalKey<FormBuilderState>();

class CancelReasonScreen extends StatefulWidget {
  final List cancelReason;

  const CancelReasonScreen({Key? key, required this.cancelReason})
      : super(key: key);

  @override
  State<CancelReasonScreen> createState() => _CancelReasonScreenState();
}

class _CancelReasonScreenState extends State<CancelReasonScreen> {
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
                        if (_formKeyCancelReason.currentState!
                            .saveAndValidate()) {}
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.primaryColor)),
                      child: Text(
                        'Cancel Confirm',
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
              Text(
                'Please choose any one reason',
                style: Theme.of(context).textTheme.headline4,
              ),
              ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                shrinkWrap: true,
                itemCount: widget.cancelReason.length,
                itemBuilder: (BuildContext context, int index) {
                  return RadioListTile(
                    contentPadding: const EdgeInsets.all(0),
                    activeColor: Colors.blue,
                    value: true,
                    groupValue: widget.cancelReason[index]['selected'],
                    onChanged: (value) {
                      setState(() {
                        for (var i = 0; i < widget.cancelReason.length; i++) {
                          if (index == i) {
                            widget.cancelReason[i]['selected'] = true;
                            selectedReason = widget.cancelReason[i]['text'];
                          } else {
                            widget.cancelReason[i]['selected'] = false;
                          }
                        }
                      });
                    },
                    title: Text(widget.cancelReason[index]['text']),
                  );
                },
              ),
              Visibility(
                visible: selectedReason == "Other" ? true : false,
                child: FormBuilder(
                    key: _formKeyCancelReason,
                    child: FormBuilderTextField(
                      maxLines: 3,
                      name: 'reason',
                      decoration: const InputDecoration(
                        hintText: 'Please explain us why are you cancelling?',
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
            ],
          ),
        ),
      ),
    );
  }
}
