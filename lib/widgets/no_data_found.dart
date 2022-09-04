import 'package:ecom_thin_ui/theme/device_size_helper.dart';
import 'package:ecom_thin_ui/widgets/index.dart';
import 'package:flutter/material.dart';

class NoDataFound extends StatelessWidget {
  final String? title;

  final String? image;
  const NoDataFound({Key? key, required this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getHeight / 4,
        ),
        HostedImage(
            imageurl: image ??
                'https://stories.freepiklabs.com/storage/24403/no-data-cuate-3449.png',
            asdpectRatio: 2),
        Text(title ?? '', style: Theme.of(context).textTheme.headline3),
      ],
    );
  }
}
