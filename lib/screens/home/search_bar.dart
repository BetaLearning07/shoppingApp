import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import '../../theme/styles.dart';

class SearchBar extends StatefulWidget {
  final String keyword;

  const SearchBar({Key? key, this.keyword = ''}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _textEditController.text = widget.keyword;

    _textEditController.selection = TextSelection.fromPosition(
      TextPosition(
          affinity: TextAffinity.downstream, offset: widget.keyword.length),
    );
    return Container(
      color: AppColors.primaryColor,
      height: 50.h,
      padding: const EdgeInsets.only(top: 8, right: 15, bottom: 8, left: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(49 * 0.5),
        ),
        child: TextField(
          controller: _textEditController,
          cursorColor: AppColors.primaryColor,
          decoration: InputDecoration(
            prefixIcon: Icon(
              IcoFontIcons.uiSearch,
              size: 15.sp,
            ),
            isDense: true,
            hintText: "What you are looking for?",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
