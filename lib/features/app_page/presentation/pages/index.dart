import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/features/Notification/presentation/pages/index.dart';
import 'package:zed_business/features/team/presentation/pages/index.dart';
// import 'package:zed_business/core/utils/app_color_const.dart';
import 'package:zed_business/features/homePage/presentation/pages/index.dart';
// import 'package:zed_business/features/homePage/presentation/widgets/drawer.dart';
import 'package:zed_business/features/profile/presentation/pages/index.dart';
// import 'package:zed_business/features/shopping/presentation/pages/index.dart';
// import 'package:zed_business/features/shopping/presentation/pages/product_details.dart';

@RoutePage()
class AppPage extends StatefulWidget {
  AppPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      HomePage(
        keyToOpenDrawer: _scaffoldKey,
        onViewAll: () {
          setState(() {
            _currentIndex = 2;
          });
        },
      ),
      TeamPage(),
      const NotificationPage(),
      const ProfilePage()
    ];
    super.initState();
  }

  final List _bottomBarIcons = const [
    {'icon': 'assets/svg/crown.svg', 'name': 'Home'},
    {'icon': 'assets/svg/crown.svg', 'name': 'Team'},
    {'icon': 'assets/svg/crown.svg', 'name': 'Shop'},
    {'icon': 'assets/svg/crown.svg', 'name': 'Account'}
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // drawer: const CustomAppDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        activeIndex: _currentIndex,
        onTap: _onTabTapped,
        notchSmoothness: NotchSmoothness.sharpEdge,
        gapLocation: GapLocation.center,
        itemCount: _bottomBarIcons.length,
        tabBuilder: (index, isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                _bottomBarIcons[index]['icon'],
                // color: isActive ? AppColorConst.brandColor : null,
                color: Colors.red,
              ),
              Text(
                _bottomBarIcons[index]['name'],
                style: GoogleFonts.inter(
                  // color: isActive ? AppColorConst.brandColor : null,
                  color: Colors.red,
                ),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.red, // Border color
          ),
        ),

        onPressed: () {
          // Add your QR scanning action here
          context.pushRoute(const ScannerRoute());
        },
        // backgroundColor: AppColorConst.brandColor,
        backgroundColor: Colors.red,

        child: Icon(
          Icons.qr_code_scanner_sharp,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
