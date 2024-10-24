import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zed_business/my_app.dart';

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



// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:share_plus/share_plus.dart';

// class ScreenshotShareWidget extends StatefulWidget {
//   @override
//   _ScreenshotShareWidgetState createState() => _ScreenshotShareWidgetState();
// }

// class _ScreenshotShareWidgetState extends State<ScreenshotShareWidget> {
//   GlobalKey _globalKey = GlobalKey(); // Key to identify the widget to capture

//   // Method to capture screenshot
//   Future<void> _captureAndSharePng() async {
//     try {
//       // Capturing the widget image
//       RenderRepaintBoundary boundary = _globalKey.currentContext
//           ?.findRenderObject() as RenderRepaintBoundary;
//       var image = await boundary.toImage();
//       ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
//       Uint8List pngBytes = byteData!.buffer.asUint8List();

//       // Saving the screenshot to a temporary directory
//       final tempDir = await getTemporaryDirectory();
//       final file = await File('${tempDir.path}/screenshot.png').create();
//       await file.writeAsBytes(pngBytes);

//       // Assuming `file` is a File instance or obtained from ImagePicker, etc.
//       XFile xFile = XFile(file.path);

//       // Sharing the screenshot
//       await Share.shareXFiles([xFile], text: 'Check out my screenshot!');

//       // Sharing the screenshot
//       // await Share.shareXFiles([file.path], text: 'Check out my screenshot!');
//     } catch (e) {
//       print("Error while capturing screenshot: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Screenshot & Share")),
//       body: Center(
//         child: RepaintBoundary(
//           key: _globalKey, // This is the widget that will be captured
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'This is the widget to be captured!',
//                 style: TextStyle(fontSize: 20),
//               ),
//               ElevatedButton(
//                 onPressed: _captureAndSharePng,
//                 child: Text('Share Screenshot'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






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




// class OpenDrawer extends StatefulWidget {
//   const OpenDrawer({super.key});
//   @override
//   _OpenDrawerState createState() => _OpenDrawerState();
// }

// class _OpenDrawerState extends State<OpenDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: drawerItems.map((item) {
//           return ListTile(
//             leading: SvgPicture.asset(
//               item.iconPath,
//               width: 30,
//               height: 30,
//               fit: BoxFit.cover,
//             ),
//             title: Row(
//               children: [
//                 Text(
//                   item.title,
//                   style: const TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.w400),
//                 ),
//                 const Spacer(),
//                 const Icon(
//                   Icons.chevron_right,
//                   size: 25,
//                   color: Color.fromRGBO(0, 0, 0, 1),
//                 ),
//               ],
//             ),
//             onTap: item.onTap,
//           );
//         }).toList(),
//       ),
//     );
//   }
// }


