import 'package:ecom_thin_ui/theme/colors.dart';
import 'package:ecom_thin_ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

PageController _pageController = PageController();

class ExtendedImageWidget extends StatelessWidget {
  final List imageList;
  final int currentPage;
  const ExtendedImageWidget({
    Key? key,
    required this.imageList,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: currentPage);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: Icon(
            IcoFontIcons.close,
            color: Colors.black,
            size: 24.sp,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: PageView(
          controller: _pageController,
          children: List.generate(imageList.length, (index) {
            return GestureDetector(
              onDoubleTapDown: _handleDoubleTapDown,
              onDoubleTap: _handleDoubleTap,
              child: InteractiveViewer(
                  transformationController: _transformationController,
                  child:
                      HostedImage(imageurl: imageList[index], asdpectRatio: 1)
                  /* ... */
                  ),
            );
          }),
          onPageChanged: (ss) {
            _transformationController.value = Matrix4.identity();
          }),
    );
  }
}

final _transformationController = TransformationController();
TapDownDetails? _doubleTapDetails;

void _handleDoubleTapDown(TapDownDetails details) {
  _doubleTapDetails = details;
}

final position = _doubleTapDetails!.localPosition;

void _handleDoubleTap() {
  if (_transformationController.value != Matrix4.identity()) {
    _transformationController.value = Matrix4.identity();
  } else {
    // For a 3x zoom
    //  _transformationController.value = Matrix4.identity()
    //   ..translate(-position.dx * 2, -position.dy * 2)
    //   ..scale(3.0);
    // Fox a 2x zoom
    _transformationController.value = Matrix4.identity()
      ..translate(-position.dx, -position.dy)
      ..scale(2.0);
  }
}
