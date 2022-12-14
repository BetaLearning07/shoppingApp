import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/widgets/extended_image.dart';
import 'package:shopping_app/widgets/hosted_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/ui_helper.dart';

class ProductDetailImageWidget extends StatefulWidget {
  final List imageList;
  final bool? showPageChangeBullet;

  const ProductDetailImageWidget({
    Key? key,
    required this.imageList,
    this.showPageChangeBullet,
  }) : super(key: key);

  @override
  State<ProductDetailImageWidget> createState() =>
      _ProductDetailImageWidgetState();
}

class _ProductDetailImageWidgetState extends State<ProductDetailImageWidget> {
  final PageController _pageController = PageController();
  final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UIHelper.verticalSpaceMedium(),
        Expanded(
          flex: 10,
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                children: List.generate(widget.imageList.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ExtendedImageWidget(
                                imageList: widget.imageList,
                                currentPage: index,
                              )));
                    },
                    child: HostedImage(
                        imageurl: widget.imageList[index], asdpectRatio: 2),
                  );
                }),
                onPageChanged: (ind) {
                  setState(() {
                    currentIndex = ind;
                    _scrollController.animateTo(_pageController.offset / 5,
                        duration: const Duration(milliseconds: 10),
                        curve: Curves.ease);
                  });
                },
              ),
              Positioned(
                top: 30.h,
                right: 5,
                child: Container(
                  height: 20.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: AppColors.primaryGreyText4,
                      borderRadius: BorderRadius.circular(100.sp)),
                  child: Center(
                      child: Text(
                          '${currentIndex + 1}/${widget.imageList.length}')),
                ),
              )
            ],
          ),
        ),
        UIHelper.verticalSpaceExtraSmall(),
        Expanded(
          flex: 2,
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.imageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Opacity(
                opacity: currentIndex == index ? 1 : .5,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          _pageController.animateToPage(currentIndex,
                              duration: const Duration(microseconds: 1),
                              curve: Curves.ease);
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.sp),
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: currentIndex == index
                                  ? AppColors.primaryColor
                                  : Colors.transparent,
                              width: 1.5),
                        ),
                        child: HostedImage(
                            imageurl: widget.imageList[index], asdpectRatio: 1),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Visibility(
          visible: widget.showPageChangeBullet ?? false,
          child: Column(
            children: [
              UIHelper.verticalSpaceSmall(),
              SizedBox(
                height: 10.h,
                width: getWidth,
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.imageList.length,
                    itemBuilder: (BuildContext context, int index2) {
                      return Row(
                        children: [
                          Container(
                            height: 5.h,
                            width: 7.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.sp),
                                color: currentIndex == index2
                                    ? Colors.amber
                                    : Colors.grey),
                          ),
                          UIHelper.horizontalSpaceExtraSmall()
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
