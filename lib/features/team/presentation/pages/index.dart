import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/features/id_card/presentation/pages/index.dart';
import 'package:zed_business/features/team/presentation/logic/others/mainservices.dart';
import 'package:marquee/marquee.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class TeamPage extends ConsumerStatefulWidget {
  static var page;

  const TeamPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamPageState();
}

class _TeamPageState extends ConsumerState<TeamPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with a network video or asset
    _controller = VideoPlayerController.asset(
      'assets/video/leadership.mp4',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
        _controller.setLooping(true); // Loop the video
        _controller.play(); // Play the video automatically
      });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final route = ref.read(routeService);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *
                      0.6, // Adjust height as needed
                  child: IdCardPage(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        route.push(GalleryRoute(), context);
                      },
                      child: Container(
                        height: 70,
                        clipBehavior: Clip.antiAlias,
                        width: 175,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 201, 201, 201),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Membership",
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                            Text(
                              'Super Prime',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        clipBehavior: Clip.antiAlias,
                        width: 175,
                        padding: EdgeInsets.only(left: 22),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 236, 194),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/svg/gold_rank.json',
                              width: 70,
                              height: 70,
                              fit: BoxFit.fill,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Rank",
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                                Text(
                                  'Gold',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color.fromRGBO(0, 0, 0, 1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CardWidget1(
                      label: 'Today Paid Team',
                      image: "assets/svg/today_paid_team_graph.svg",
                      count: 4,
                      color: const Color.fromARGB(255, 193, 226, 194),
                      function: () {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CardWidget2(
                      label: 'Total Paid Team',
                      image: "assets/svg/total_paid_team.svg",
                      count: 7,
                      color: const Color.fromARGB(255, 163, 202, 238),
                      function: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8B0000),
                        Color.fromARGB(255, 193, 56, 56),
                        Color(0xFF8B0000),
                      ],
                    ),
                  ),
                  child: SizedBox(
                    height: 20,
                    child: Marquee(
                      text:
                          '📢  Welcome to customer support, call on  +91 9878973722',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      scrollAxis: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      blankSpace: 17.0,
                      velocity: 100.0,
                      // pauseAfterRound: Duration(seconds: 1),
                      startPadding: 15.0,
                      // accelerationDuration: Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      // decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // CardWidget(
                    //   label: 'Fund Wallet',
                    //   image: "assets/svg/fund_wallet_graph.svg",
                    //   count: 2,
                    //   color: const Color.fromARGB(255, 202, 184, 233),
                    //   function: () {},
                    // ),
                    CardWidget1(
                      label: 'Pin Wallet',
                      image: "assets/svg/pin_wallet_graph.svg",
                      count: 5,
                      color: const Color.fromARGB(255, 255, 219, 168),
                      function: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildRow(
                        'assets/svg/withdrawal_icon_container.svg',
                        "Withdrawal &\nTransfer Money",
                        Color.fromARGB(255, 201, 201, 201)),
                    buildRow(
                        'assets/svg/activation_icon_container.svg',
                        'Activation &\nUpdation',
                        Color.fromARGB(255, 220, 241, 243)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 219, 168)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: ClipOval(
                            child: _controller.value.isInitialized
                                ? SizedBox(
                                    width: 33,
                                    height: 33,
                                    child: VideoPlayer(_controller),
                                  )
                                : CircularProgressIndicator(),
                          ),
                        ),
                        Text(
                          'My Team',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String image, String label, Color color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 70,
        clipBehavior: Clip.antiAlias,
        width: 175,
        // padding: EdgeInsets.only(left: 22),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
