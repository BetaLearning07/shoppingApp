import 'dart:io';
import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import '../theme/styles.dart';

// tabBar
List<TabData> _tabBarData = [
  TabData("Home", IcoFontIcons.uiHome),
  TabData("Search", IcoFontIcons.search2),
  TabData("Cart", IcoFontIcons.cart),
  TabData("Saved", IcoFontIcons.love),
  TabData("Account", IcoFontIcons.uiUser),
];

class TabData {
  String? title;
  IconData? icon;

  TabData(this.title, this.icon);
}

class DefaultBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  const DefaultBottomNavigationBar({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarHeight = 49 +
        MediaQuery.of(context).padding.bottom +
        (Platform.isAndroid ? 2 : 0);
    return SizedBox(
      height: bottomBarHeight,
      child: _getBottomNavigationBar1(context),
    );
  }

  /// Bottom Navigation
  _getBottomNavigationBar1(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int value) {
        switch (value) {
          case 4:
            {
              Navigator.pushNamed(context, '/account');
            }

            break;
          default:
        }
      },
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      unselectedItemColor: Colors.black,
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      items: _getTabBar(context),
    );
  }

  /// bottomNavBar
  // _getBottomNavigationBar(BuildContext context) {
  //   return Stack(
  //     children: <Widget>[
  //       Selector<MainProvider, int>(
  //           builder: (_, index, __) {
  //             return BottomNavigationBar(
  //               currentIndex: index,
  //               type: BottomNavigationBarType.fixed,
  //               selectedFontSize: 12,
  //               unselectedFontSize: 12,
  //               unselectedItemColor: Colors.black,
  //               unselectedLabelStyle:
  //                   const TextStyle(fontWeight: FontWeight.bold),
  //               selectedLabelStyle:
  //                   const TextStyle(fontWeight: FontWeight.w600),
  //               selectedItemColor: Colors.black,
  //               backgroundColor: Colors.white,
  //               elevation: 0,
  //               onTap: onTap,
  //               items: _getTabBar(context),
  //             );
  //           },
  //           selector: (_, model) => model.getTabBarSelectedIndex),
  //       const Divider(
  //         height: 0.5,
  //         color: Color(0xffdfdfdf),
  //       ),
  //     ],
  //   );
  // }
  // 8B63E6  9B9B9B

  List<BottomNavigationBarItem> _getTabBar(BuildContext context) {
    var index = 0;
    return _tabBarData.map((item) {
      return _getBottomBarItem(
          item.title, item.icon, context, index++ == 3 ? _getBadge() : null);
    }).toList();
  }

  BottomNavigationBarItem _getBottomBarItem(
      String? title, IconData? icon, BuildContext context,
      [Widget? badge]) {
    final screenWidth = MediaQuery.of(context).size.width;
    final tabBarIconWidth = screenWidth / _tabBarData.length;
    // const tabBarIconHeight = 22.0;

    final badge = Positioned(
      left: tabBarIconWidth / 2 + 5,
      // child: badge ?? Container(),
      child: Container(),
    );

    return BottomNavigationBarItem(
      icon: Stack(
        children: <Widget>[
          Icon(icon, color: AppColors.primaryGreyText, size: 20),
          badge,
        ],
      ),
      activeIcon: Stack(
        children: <Widget>[
          Icon(
            icon,
            color: AppColors.primaryText,
            size: 20,
          ),
          badge
        ],
      ),
      label: title,
    );
  }

  _getBadge() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xfff8d949),
      ),
      height: 18,
      padding: const EdgeInsets.only(left: 6, right: 6),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 6,
        ),
        child: const Center(
          child: Text(
            '12',
            style: TextStyle(color: Colors.white, fontSize: 10.5),
          ),
        ),
      ),
    );
  }
}
