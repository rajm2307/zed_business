import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/features/id_card/presentation/pages/index.dart';
import 'package:zed_business/features/team/presentation/logic/others/mainservices.dart';
import 'package:zed_business/features/withdrawal_/withdrawal/presentation/pages/index.dart';
import 'package:zed_business/my_app.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class TeamPage extends ConsumerStatefulWidget {
  static var page;

  const TeamPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamPageState();
}

class _TeamPageState extends ConsumerState<TeamPage> {
  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
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
                            height: MediaQuery.of(context).size.height * 0.001,
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
                    Container(
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
                                height:
                                    MediaQuery.of(context).size.height * 0.001,
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
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardWidget(
                      label: 'Today Paid Team',
                      image: '',
                      count: 4,
                      color: const Color.fromARGB(255, 193, 226, 194),
                    ),
                    CardWidget(
                      label: 'Total Paid Team',
                      image: '',
                      count: 7,
                      color: const Color.fromARGB(255, 163, 202, 238),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardWidget(
                      label: 'Fund Wallet',
                      image: '',
                      count: 2,
                      color: const Color.fromARGB(255, 202, 184, 233),
                    ),
                    CardWidget(
                      label: 'Pin Wallet',
                      image: '',
                      count: 5,
                      color: const Color.fromARGB(255, 255, 219, 168),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Rounded edges
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8B0000), // Dark red
                        Color.fromARGB(255, 193, 56, 56), // Firebrick red
                        Color(0xFF8B0000), // Dark red
                      ],
                    ),
                  ),
                  child: Text(
                    'Welcome to customer support all problem',
                    style: TextStyle(
                      color: Colors.white, // White text
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      width: 175,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 201, 201, 201),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/svg/menu.svg"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Withdrawal &\nTransfer Money",
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70,
                      clipBehavior: Clip.antiAlias,
                      width: 175,
                      // padding: EdgeInsets.only(left: 22),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 224, 253, 255),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/svg/menu.svg"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Activation &\nUpdation",
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.001,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 150),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 255, 219, 168)),
                  child: Row(
                    children: [
                      Lottie.asset(
                        'assets/svg/successfull.json',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fill,
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
}
