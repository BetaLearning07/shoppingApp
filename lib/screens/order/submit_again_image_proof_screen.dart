import 'dart:io';

import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

List<XFile>? proofImage = [];
final ImagePicker _picker = ImagePicker();

class SubmitProofAgainScreen extends StatefulWidget {
  const SubmitProofAgainScreen({Key? key}) : super(key: key);

  @override
  State<SubmitProofAgainScreen> createState() => _SubmitProofAgainScreenState();
}

class _SubmitProofAgainScreenState extends State<SubmitProofAgainScreen> {
  Future<void> getImageFromGallery() async {
    final XFile? tempImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (tempImage != null) {
      setState(() {
        proofImage?.add(tempImage);
      });
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
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.primaryColor)),
                      child: Text(
                        'Confirm',
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
            ],
          ),
        ),
      ),
    );
  }
}
