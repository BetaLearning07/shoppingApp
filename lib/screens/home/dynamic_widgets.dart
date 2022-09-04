import 'package:shopping_app/theme/colors.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:shopping_app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DynamicWidgets extends StatelessWidget {
  const DynamicWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: const [
              ThreeImageWidget(),
              SingleImageWidget(),
              GrowableCrossAxisTwoWidget(),
              TwoImageWidget(),
              GrowableCrossAxisFourWidget(),
              HorizontalSlidableWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class SingleImageWidget extends StatelessWidget {
////dynamic data is reuired
  const SingleImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const LeftTitle(
            title: 'Single Image Widget',
            subtitile: 'This is single image widget',
            tipColor: AppColors.addToCart1,
          ),
          InkWell(
            onTap: () {
              // DynamicWidgetRoutes.to.goToAnyPage(
              //     page: data.items![0].goTo!, id: data.items![0].id!);
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: SizedBox(
                  child: HostedImage(
                      imageurl:
                          'https://aseztak.ap-south-1.linodeobjects.com/widgets/202207-0118-3644-daa57b22-fdb3-4468-8b37-5cc244ae6df22022-01-36-Jul-1656680804.gif',
                      asdpectRatio: 2.2)),
            ),
          ),
        ],
      ),
    );
  }
}

class TwoImageWidget extends StatelessWidget {
////dynamic data is reuired
  const TwoImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const LeftTitle(
            title: 'Two Image Widget',
            tipColor: AppColors.red,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // DynamicWidgetRoutes.to.goToAnyPage(
                      //     page: data.items![0].goTo!, id: data.items![0].id!);
                    },
                    child: const HostedImage(
                        imageurl:
                            'https://aseztak.ap-south-1.linodeobjects.com/notification/d567bdc8-a91b-451a-92b7-719c9541ed88.png',
                        asdpectRatio: 1.5),
                  ),
                ),
                UIHelper.horizontalSpaceExtraSmall(),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // DynamicWidgetRoutes.to.goToAnyPage(
                      //     page: data.items![1].goTo!, id: data.items![1].id!);
                    },
                    child: const HostedImage(
                        imageurl:
                            'https://aseztak.ap-south-1.linodeobjects.com/notification/649170fc-fa7b-41d8-8b08-eeda6aaf2ec8.png',
                        asdpectRatio: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThreeImageWidget extends StatelessWidget {
  ////dynamic data is reuired
  const ThreeImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const LeftTitle(
            title: 'Theree Image Widget',
            subtitile: 'This is three image widget',
            tipColor: AppColors.addToCart1,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // DynamicWidgetRoutes.to.goToAnyPage(
                      //     page: data.items![0].goTo!, id: data.items![0].id!);
                    },
                    child: const HostedImage(
                        imageurl:
                            'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2412-2400-e5affdea-7820-4fc9-a872-d097f2df770a2022-24-24-Jun-1656053640.gif',
                        asdpectRatio: .98),
                  ),
                ),
                UIHelper.horizontalSpaceExtraSmall(),
                Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // DynamicWidgetRoutes.to.goToAnyPage(
                          //     page: data.items![1].goTo!,
                          //     id: data.items![1].id!);
                        },
                        child: const HostedImage(
                            imageurl:
                                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0348-f8c3e85a-0fb6-45bc-90d7-6e564205fded2022-20-03-Jun-1655728428.jpg',
                            asdpectRatio: 2),
                      ),
                      UIHelper.verticalSpaceExtraSmall(),
                      InkWell(
                        onTap: () {
                          // DynamicWidgetRoutes.to.goToAnyPage(
                          //     page: data.items![2].goTo!,
                          //     id: data.items![2].id!);
                        },
                        child: const HostedImage(
                            imageurl:
                                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2412-2409-a582afc3-0cb2-4c8d-b080-2511fd7e58aa2022-24-24-Jun-1656053649.jpg',
                            asdpectRatio: 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GrowableCrossAxisTwoWidget extends StatelessWidget {
  ///dynammic data is required
  const GrowableCrossAxisTwoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const LeftTitle(title: 'Growable Cross Axis Two'),
          GridView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              List imageList = [
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0110-222b950e-307b-444f-8cb1-e6f26492c35e2022-20-01-Jun-1655728270.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0110-222b950e-307b-444f-8cb1-e6f26492c35e2022-20-01-Jun-1655728270.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2112-3700-d9fc866e-e35c-4671-9d17-47918bade3762022-21-37-Jun-1655795220.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-0607-5b6c00d0-7d12-4bd3-b8b5-5f012f998a552022-20-06-Jun-1655728567.jpg',
              ];
              return InkWell(
                onTap: () {
                  // DynamicWidgetRoutes.to.goToAnyPage(
                  //     page: data.items![index].goTo!,
                  //     id: data.items![index].id!);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: HostedImage(
                        imageurl: imageList[index], asdpectRatio: 1),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GrowableCrossAxisFourWidget extends StatelessWidget {
  ///dynamic data
  const GrowableCrossAxisFourWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const LeftTitle(title: 'Growable Grid Cross Axis Four'),
          GridView.builder(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              List imageList = [
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1922-c9e189ec-1064-483d-a2ca-498f0cb4a97c2022-20-19-Jun-1655729362.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1929-514bb74d-ff62-415a-89e0-110cc19159462022-20-19-Jun-1655729369.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1935-143ce542-dc4e-45ee-999d-18f0e16cbcbe2022-20-19-Jun-1655729375.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1942-cb1e3ae5-604b-4c87-b0a9-fb7e609189022022-20-19-Jun-1655729382.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1948-00a0ffdc-90f3-4979-ade2-c8fc714cd31b2022-20-19-Jun-1655729388.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-1954-e78bea75-3e8e-41ad-a10d-e7c3160ce6f22022-20-19-Jun-1655729394.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-2001-26aeab8a-43d9-4719-91b9-126554488f692022-20-20-Jun-1655729401.jpg',
                'https://aseztak.ap-south-1.linodeobjects.com/widgets/202206-2018-2008-8fa0c27e-126c-42b6-8145-6a42bb1e42f92022-20-20-Jun-1655729408.jpg'
              ];
              return InkWell(
                onTap: () {
                  // DynamicWidgetRoutes.to.goToAnyPage(
                  //     page: data.items![index].goTo!,
                  //     id: data.items![index].id!);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: SizedBox(
                        child: HostedImage(
                            imageurl: imageList[index], asdpectRatio: 1)),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class HorizontalSlidableWidget extends StatelessWidget {
  ///dynamic data required
  const HorizontalSlidableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Column(
            children: <Widget>[
              const LeftTitle(title: 'Horizontal Slidable Widget'),
              AspectRatio(
                aspectRatio: 1.18,
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // DynamicWidgetRoutes.to.goToAnyPage(
                          //     page: data.items![index].goTo!,
                          //     id: data.items![index].id!);
                        },
                        child: Container(
                            padding: const EdgeInsets.only(right: 2),
                            width: 235.w,
                            child: const HostedImage(
                                imageurl:
                                    'https://aseztak.ap-south-1.linodeobjects.com/notification/18caefe1-1a98-4f13-89ab-c734d6c8ffd0.png',
                                asdpectRatio: 1)),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
