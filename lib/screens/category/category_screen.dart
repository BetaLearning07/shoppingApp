import 'package:shopping_app/theme/device_helper.dart';
import 'package:shopping_app/theme/device_size_helper.dart';
import 'package:shopping_app/theme/ui_helper.dart';
import 'package:shopping_app/widgets/hosted_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/colors.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: const Text('Categories'),
            pinned: false,
            snap: true,
            floating: true,
            expandedHeight: 120.sp,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: <Widget>[
                  UIHelper.verticalSpace(75.h),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                    child: SizedBox(
                      height: 36.0.h,
                      width: double.infinity,
                      child: CupertinoTextField(
                        keyboardType: TextInputType.text,
                        placeholder: 'Search Category',
                        placeholderStyle: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(
                                color: const Color(0xffC4C6CC),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Brutal'),
                        prefix: Padding(
                          padding:
                              EdgeInsets.fromLTRB(9.0.w, 6.0.h, 9.0.w, 6.0.h),
                          child: const Icon(
                            Icons.search,
                            color: Color(0xffC4C6CC),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: const Color(0xffF0F1F5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CategoryBody(
            key: key,
          )
        ],
      ),
    );
  }
}

class CategoryBody extends StatelessWidget {
  const CategoryBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: DeviceHelper.isMobile(context) ? 3 : 4,
        childAspectRatio: 1.h / 1.38.h,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var data = catData['categories'][index];
          return InkWell(
            onTap: () {},
            child: Card(
              elevation: 2,
              margin: EdgeInsets.all(3.sp),
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0.h, bottom: 5.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: SizedBox(
                            child: HostedImage(
                                imageurl: data['image'], asdpectRatio: 1)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(2.sp),
                      width: getWidth,
                      color: AppColors.primaryGreyText6,
                      child: Center(
                        child: Text(
                          data['name'],
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: catData['categories'].length,
      ),
    );
  }
}

Map catData = {
  "title": "Men",
  "categories": [
    {
      "id": 16,
      "name": "Mens T Shirts",
      "slug": "mens-t-shirts",
      "description": "T-Shirt For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/137TDVgwEpv6W1013oSdXElQP.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 17,
      "name": "Mens Sando/Vests/Baniyan",
      "slug": "mens-sandovestsbaniyan",
      "description": "Sando/Vest/Baniyan For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/YSXeoISLhsdR5PJpJFCZjC9dT.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 26,
      "name": "Mens Socks",
      "slug": "mens-socks",
      "description": "Socks For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/XCz0hLdOf96bOUDCytyGMNfJ6.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 31,
      "name": "Mens Capris/Three Fourths",
      "slug": "mens-capristhree-fourths",
      "description": "Capri/Three Fourths For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/ENX6yPmZvS2yx9MOCXztrECxW.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 32,
      "name": "Cargo",
      "slug": "cargo",
      "description": "Cargo For Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/CanrwkRD9r4sN91OtGrtvKpH4.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 33,
      "name": "Mens Briefs and Trunks (Underwear)",
      "slug": "mens-briefs-and-trunks-underwear",
      "description": "Briefs/Trunks For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/HQczpQ88P6inVWNaRXZgtkMOz.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 34,
      "name": "Mens Jeans",
      "slug": "mens-jeans",
      "description": "Jeans Pant For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/ZYpMEWajEfxqhs4RtgmBxycXD.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 35,
      "name": "Mens Kurtas",
      "slug": "mens-kurtas",
      "description": "Kurtas For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/Nb6STa0S9ioGv4wYNXSP4ZbRv.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 37,
      "name": "Mens Kurta and Pyjama",
      "slug": "mens-kurta-and-pyjama",
      "description": "Kurta And Pyjama For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/2sEVu3o6z26lslA32Psxu6whl.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 38,
      "name": "Mens Shirts",
      "slug": "mens-shirts",
      "description": "Shirts For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/4bB3kA72RgDWyWSa1pgKZlZWx.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 39,
      "name": "Mens Shorts/Half Pant/Boxers",
      "slug": "mens-shortshalf-pantboxers",
      "description": "Half Pants/Boxers/Shorts For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/PNpDLe8JkGZOmBgamZltEHom9.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 40,
      "name": "Mens Track Pants/Lower",
      "slug": "mens-track-pantslower",
      "description": "Track Pants/Lowers For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/aK8UtmRloLWAzGHTRfagOBz8t.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 41,
      "name": "Mens Track Suits",
      "slug": "mens-track-suits",
      "description": "Track Suits For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/8EbqdNVSpdjhrnn12HRg8MAJ4.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 42,
      "name": "Mens Cotton Pant",
      "slug": "mens-cotton-pant",
      "description": "Cotton Pant For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/Z5oG3uVFuqWBhwU6ZTVuomDaf.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 45,
      "name": "Mens Blazers/Coats",
      "slug": "mens-blazerscoats",
      "description": "Blazers/Coats For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/c74mEAws6qFy3m2cl9VhRtxuu.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 48,
      "name": "Mens Waistcoats",
      "slug": "mens-waistcoats",
      "description": "Waistcoats For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/sFvU3UnQ9BqHT57t0O3dHTU2f.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 52,
      "name": "Mens Jackets",
      "slug": "mens-jackets",
      "description": "Jackets For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/fiPWqEhfAhnAqsfkeOZzzcLfo.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 53,
      "name": "Mens Pullovers/ Sweatshirts/ Sweater",
      "slug": "mens-pullovers-sweatshirts-sweater",
      "description": "Sweater, Pullovers and Sweatshirts For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/HWQRu9jW8jDdVdMXxR0JrxsoN.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 129,
      "name": "Sherwani",
      "slug": "sherwani",
      "description": "Sherwani For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/ieCMByWr5a1Eq0WJRJIzJv1zg.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 160,
      "name": "Mens Mufflers/Scarves",
      "slug": "mens-mufflersscarves",
      "description": "Muffler & Scarves For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/HAxUKsQBC4WNiru9LRaJEuNzC.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 163,
      "name": "Mens Gloves",
      "slug": "mens-gloves",
      "description": "Gloves For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/2AADRP4lF2HK1bVB1ceNPcE8k.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 164,
      "name": "Mens Raincoats",
      "slug": "mens-raincoats",
      "description": "Raincoats For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/y0zsbkqLw7xTyrktLDFehse0g.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 165,
      "name": "Windcheaters",
      "slug": "windcheaters",
      "description": "Windcheaters For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/hNjqyJ7vpJ3C8z8fRQ33kqJxw.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 202,
      "name": "Mens Track Tops",
      "slug": "mens-track-tops",
      "description": "Track Tops For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/K0qJvE2L8a5an7L8Exxs16iqu.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 1363,
      "name": "Mens Pyjamas",
      "slug": "mens-pyjamas",
      "description": "Pyjamas For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/cA5r4dPMZSBOA5ngDp8iVH83W.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 1366,
      "name": "Mens Thermal Tops",
      "slug": "mens-thermal-tops",
      "description": "Thermal Tops For Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/Ty4nESSqhd6Znyi8hijusog1U.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 1367,
      "name": "Mens Thermal Pants",
      "slug": "mens-thermal-pants",
      "description": "Thermal Pants For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/6Jj1t5GQldC1K5A0sj9app2Dp.jpg",
      "status": 1,
      "haschild": false
    },
    {
      "id": 1409,
      "name": "Men's Footwear",
      "slug": "mens-footwear",
      "description":
          "Men's Casual Shoes, Sport Shoes, Formal Shoes,, Sandals & Floaters, Slippers & Flip-Flops, Ethnic Shoes, Boots, Clogs.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/mbr9a8FIjCbFU8NcLmDm5agIR.png",
      "status": 1,
      "haschild": true
    },
    {
      "id": 1443,
      "name": "Mens Accessories",
      "slug": "mens-accessories",
      "description":
          "Men's Belts, Caps & Hats, Wallets, Ties, Handkerchief, Pocket Square, Cufflinks, Watch and Sunglasses.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/J7dtVtAH5RUuIycBFGtklzGN7.png",
      "status": 1,
      "haschild": true
    },
    {
      "id": 2280,
      "name": "Formal Pants",
      "slug": "formal-pants",
      "description": "Formal Pant For Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/kc5VoNkmSsXHpmU8TQFUt7GIC.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 2281,
      "name": "Mens Dhoti/Lungi",
      "slug": "mens-dhotilungi",
      "description": "Dhoties and Lungies For Men.",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/NJAtMuS0W0Fs25lNepNSYiS4v.png",
      "status": 1,
      "haschild": false
    },
    {
      "id": 2292,
      "name": "Mens Jersey",
      "slug": "mens-jersey",
      "description": "Jersies for Men",
      "image":
          "https://aseztak.ap-south-1.linodeobjects.com/categories/3OqhVfka1M203X8JrdNe1OQv1.png",
      "status": 1,
      "haschild": false
    }
  ]
};
