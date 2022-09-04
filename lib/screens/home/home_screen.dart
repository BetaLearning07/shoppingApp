import 'package:ecom_thin_ui/data/home_model.dart';
import 'package:ecom_thin_ui/screens/home/dynamic_widgets.dart';
import 'package:ecom_thin_ui/screens/home/home_filter_widget.dart';
import 'package:ecom_thin_ui/screens/home/search_bar.dart';
import 'package:ecom_thin_ui/widgets/informative_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import '../../data/categories_model.dart';
import '../../services/data_service.dart';
import '../../theme/styles.dart';
import '../../widgets/default_bottom_navigation.dart';
import '../../widgets/index.dart';
import 'banner_swiper.dart';
import 'category_swiper.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeModel homeData = ref.read(homeDataProvider);
    CaegoriesModel categoriesData = ref.read(categoriesDataProvider);
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        titleSpacing: 0,
        title: Image.asset(
          "assets/images/logo.png",
          // width: 100,
          height: 30.h,
          fit: BoxFit.contain,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(6.w, 6.h, 8.w, 6.h),
            icon: Icon(
              IcoFontIcons.love,
              size: 20.sp,
            ),
            onPressed: null,
          ),
          const AppBarShopCartIconButton(),
        ],
      ),
      drawer: const Drawer(child: Text("sfdsf")),
      bottomNavigationBar: DefaultBottomNavigationBar(onTap: (index) {}),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
              /// search bar
              const SliverToBoxAdapter(
                child: SearchBar(),
              ),

              /// Category carousel area
              SliverToBoxAdapter(
                child: CategorSwiper(categories: categoriesData.categories),
              ),

              /// top carousel
              const SliverToBoxAdapter(
                child: BannerSwiper(),
              ),

              /// dynamic widget
              const SliverToBoxAdapter(
                child: DynamicWidgets(),
              ),

              /// informative banner widget
              const SliverToBoxAdapter(
                child: InformativeBanner(),
              ),

              /// Brand carousel area
              // SliverToBoxAdapter(
              //   child: BrandSwiper(brands: homeData.brands!),
              // ),
            ] +
            _productGrid(data: homeData.products!, context: context),
      ),
    );
  }
}

_productGrid({required List<Products> data, required BuildContext context}) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  return [
    SliverPersistentHeader(
      delegate: HomeFilterWidget(),
      pinned: true,
      floating: true,
    ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: shortestSide < 600 ? 2 : 3,
        childAspectRatio: 1.h / 1.38.h,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: data.length,
        (context, index) {
          return ProductThumbnail(data: data[index]);
        },
      ),
    )
  ];
}
