import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zed_business/my_app.dart';
// import 'package:zed_business/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // final sharedPreferences = await SharedPreferences.getInstance();
  //Set App Flavour
  // setMode = Flavour.development;
  // HttpOverrides.global = CustomHttpOverrides();
  runApp(
    const ProviderScope(
      overrides: [
        // sharedPreferencesProvider.overrideWithValue(sharedPreferences)
      ],
      child: MyApp(),
      //  const MyApp(),
    ),
  );
}

////______________________________________________________________________________________________________________________________________________________




////______________________________________________________________________________________________________________________________________________________

// import 'package:flutter/material.dart';

// class WalletSelector extends StatefulWidget {
//   @override
//   _WalletSelectorState createState() => _WalletSelectorState();
// }

// class _WalletSelectorState extends State<WalletSelector> {
//   bool isCommissionSelected = true; // Track selected option

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Container(
//             height: 60.0,
//             width: 390.0,
//             padding: EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Stack(
//               children: [
//                 // Animated positioned indicator
//                 AnimatedPositioned(
//                   duration: Duration(milliseconds: 200),
//                   curve: Curves.easeInOut,
//                   left: isCommissionSelected ? 0 : 195, // Animate position
//                   right: isCommissionSelected ? 195 : 0,
//                   child: Container(
//                     height: 50.0,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     _buildOption(
//                       title: "Commission Wallet",
//                       isSelected: isCommissionSelected,
//                       onTap: () {
//                         setState(() {
//                           isCommissionSelected = true;
//                         });
//                       },
//                     ),
//                     _buildOption(
//                       title: "Fund Wallet",
//                       isSelected: !isCommissionSelected,
//                       onTap: () {
//                         setState(() {
//                           isCommissionSelected = false;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Builds each option with text style depending on selection state
//   Widget _buildOption({
//     required String title,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: onTap,
//         child: Center(
//           child: Container(
//             height: 40.0,
//             alignment: Alignment.center,
//             child: Text(
//               title,
//               style: TextStyle(
//                 color: isSelected ? Colors.white : Colors.red,
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: WalletSelector()));
// }





// _____________________________________________________________________________________________________________________________________





// import 'dart:async';

// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:circular_reveal_animation/circular_reveal_animation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// // import 'package:lanarsnavbarflutter/theme/app_theme.dart';
// // import 'package:lanarsnavbarflutter/theme/custom_colors_theme.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//           appBarTheme:
//               AppBarTheme(backgroundColor: Color.fromRGBO(111, 111, 111, 1))),
//       darkTheme: ThemeData(
//           appBarTheme:
//               AppBarTheme(backgroundColor: Color.fromRGBO(39, 116, 48, 1))),
//       home: MyHomePage(title: 'Animated Navigation Bottom Bar'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   final autoSizeGroup = AutoSizeGroup();
//   var _bottomNavIndex = 0; //default index of a first screen

//   late AnimationController _fabAnimationController;
//   late AnimationController _borderRadiusAnimationController;
//   late Animation<double> fabAnimation;
//   late Animation<double> borderRadiusAnimation;
//   late CurvedAnimation fabCurve;
//   late CurvedAnimation borderRadiusCurve;
//   late AnimationController _hideBottomBarAnimationController;

//   final iconList = <IconData>[
//     Icons.home,
//     Icons.brightness_4,
//     Icons.brightness_6,
//     Icons.brightness_7,
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _fabAnimationController = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _borderRadiusAnimationController = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     fabCurve = CurvedAnimation(
//       parent: _fabAnimationController,
//       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );
//     borderRadiusCurve = CurvedAnimation(
//       parent: _borderRadiusAnimationController,
//       curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
//     );

//     fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
//     borderRadiusAnimation = Tween<double>(begin: 0, end: 1).animate(
//       borderRadiusCurve,
//     );

//     _hideBottomBarAnimationController = AnimationController(
//       duration: Duration(milliseconds: 200),
//       vsync: this,
//     );

//     Future.delayed(
//       Duration(seconds: 1),
//       () => _fabAnimationController.forward(),
//     );
//     Future.delayed(
//       Duration(seconds: 1),
//       () => _borderRadiusAnimationController.forward(),
//     );
//   }

//   bool onScrollNotification(ScrollNotification notification) {
//     if (notification is UserScrollNotification &&
//         notification.metrics.axis == Axis.vertical) {
//       switch (notification.direction) {
//         case ScrollDirection.forward:
//           _hideBottomBarAnimationController.reverse();
//           _fabAnimationController.forward(from: 0);
//           break;
//         case ScrollDirection.reverse:
//           _hideBottomBarAnimationController.forward();
//           _fabAnimationController.reverse(from: 1);
//           break;
//         case ScrollDirection.idle:
//           break;
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final colors = Theme.of(context).extension<CustomColorsTheme>()!;
//     return Scaffold(
//       extendBody: true,
//       appBar: AppBar(
//         title: Text(
//           widget.title,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: NotificationListener<ScrollNotification>(
//         onNotification: onScrollNotification,
//         child: NavigationScreen(iconList[_bottomNavIndex]),
//       ),
//       floatingActionButton: FloatingActionButton(
//         shape: CircleBorder(),
//         child: Icon(
//           Icons.brightness_3,
//           color: Colors.green,
//         ),
//         onPressed: () {
//           // _fabAnimationController.reset();
//           // _borderRadiusAnimationController.reset();
//           // _borderRadiusAnimationController.forward();
//           // _fabAnimationController.forward();
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: AnimatedBottomNavigationBar.builder(
//         itemCount: iconList.length,
//         tabBuilder: (int index, bool isActive) {
//           final color = isActive ? true : false;
//           return Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 iconList[index],
//                 size: 24,
//                 color: Colors.yellow,
//               ),
//               const SizedBox(height: 4),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: AutoSizeText(
//                   "brightness $index",
//                   maxLines: 1,
//                   style: TextStyle(color: Colors.brown),
//                   group: autoSizeGroup,
//                 ),
//               )
//             ],
//           );
//         },
//         backgroundColor: Color.fromRGBO(444, 444, 444, 1),
//         activeIndex: _bottomNavIndex,
//         splashColor: Color.fromRGBO(61, 61, 57, 1),
//         notchAndCornersAnimation: borderRadiusAnimation,
//         splashSpeedInMilliseconds: 300,
//         notchSmoothness: NotchSmoothness.defaultEdge,
//         gapLocation: GapLocation.center,
//         leftCornerRadius: 0,
//         rightCornerRadius: 0,
//         onTap: (index) => setState(() => _bottomNavIndex = index),
//         hideAnimationController: _hideBottomBarAnimationController,
//         // shadow: BoxShadow(
//         //   offset: Offset(0, 1),
//         //   blurRadius: 12,
//         //   spreadRadius: 0.5,
//         //   color: Color.fromRGBO(146, 146, 16, 1),
//         // ),
//       ),
//     );
//   }
// }

// class NavigationScreen extends StatefulWidget {
//   final IconData iconData;

//   NavigationScreen(this.iconData) : super();

//   @override
//   _NavigationScreenState createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> animation;

//   @override
//   void didUpdateWidget(NavigationScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.iconData != widget.iconData) {
//       _startAnimation();
//     }
//   }

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//     super.initState();
//   }

//   _startAnimation() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 1000),
//     );
//     animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeIn,
//     );
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final colors = Theme.of(context).extension<CustomColorsTheme>()!;
//     return Container(
//       color: Theme.of(context).colorScheme.background,
//       child: ListView(
//         children: [
//           SizedBox(height: 64),
//           Center(
//             child: CircularRevealAnimation(
//               animation: animation,
//               centerOffset: Offset(80, 80),
//               maxRadius: MediaQuery.of(context).size.longestSide * 1.1,
//               child: Icon(
//                 widget.iconData,
//                 color: Colors.purple,
//                 size: 160,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




