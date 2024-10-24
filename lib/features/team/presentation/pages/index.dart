import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class TeamPage extends ConsumerStatefulWidget {
  static var page;

  const TeamPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamPageState();
}

class _TeamPageState extends ConsumerState<TeamPage> {
  bool _isLoading = false;

  List _totalTeam = [];

  int _totalTeamCount = 0;
  int _totalFreeTeamCount = 0;
  int _totalPaidTeamCount = 0;

  List<Map<String, String>> teamData = [
    {
      "level": "1",
      "name": "Adarsh Yadav",
      "package": "Free",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "2",
      "name": "Ram Singh",
      "package": "Free",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "3",
      "name": "Vikas Pandit",
      "package": "Free",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "3",
      "name": "Sunnuy Kahrwar",
      "package": "Free",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "1",
      "name": "Raj Mandal",
      "package": "Paid",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "2",
      "name": "Vikram Pandit",
      "package": "Paid",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "2",
      "name": "Vikram Baital",
      "package": "Paid",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "4",
      "name": "Vikram Singh",
      "package": "Paid",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "4",
      "name": "Vikram Maharana",
      "package": "Paid",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "4",
      "name": "Vikram Maharana",
      "package": "Free",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
    {
      "level": "4",
      "name": "Vikram Maharana",
      "package": "Free",
      "rank": "Not Achieved",
      "sponsor": "CLASEYHDH",
      "date": "30/03/2024",
      "time": "12:45:09"
    },
  ];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _getHome();
    }
    var totalFreeTeam = teamData.where((i) => i['package'] == 'Free').toList();
    var totalPaidTeam = teamData.where((i) => i['package'] != 'Free').toList();

    // _totalTeam = teamData;
    _totalTeamCount = teamData.length;
    _totalFreeTeamCount = totalFreeTeam.length;
    _totalPaidTeamCount = totalPaidTeam.length;

    // print(_totalTeamCount);
    // print(_totalFreeTeamCount);
    // print(_totalPaidTeamCount);
  }

  _getHome() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _isLoading = false;
      });
    }
  }

  _getTeamCount(dynamic totalTeam, int level, String userPackage) {
    return totalTeam
        .where((team) =>
            int.parse(team['level']) == level && team['package'] == userPackage)
        ?.toList()
        .length;
  }

  @override
  Widget build(BuildContext context) {
    final route = ref.read(routeService);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(230, 230, 230, 1),
        scrolledUnderElevation: 10.0,
        toolbarHeight: 1,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _getHome();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _isLoading
              ? Center(
                  child: LoadingAnimationWidget.flickr(
                      size: 50,
                      leftDotColor: Colors.red,
                      rightDotColor: Colors.green),
                )
              : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                route.push(
                                    TeamViewRoute(
                                        appBarName: 'Total Free',
                                        level: -1,
                                        userStatus: 0,
                                        fetchDay: 'All'),
                                    context);
                              },
                              child: Container(
                                height: 65,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: AppTextStyles.appCaptionText(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red),
                                        children: [
                                          TextSpan(
                                            text: 'Total Free\n',
                                          ),
                                          TextSpan(
                                            text:
                                                _totalFreeTeamCount.toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                route.push(
                                    TeamViewRoute(
                                        appBarName: 'Total Paid',
                                        level: -1,
                                        userStatus: 0,
                                        fetchDay: 'All'),
                                    context);
                              },
                              child: Container(
                                height: 65,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: AppTextStyles.appCaptionText(
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromARGB(
                                                255, 10, 194, 53)),
                                        children: [
                                          TextSpan(
                                            text: 'Total Paid\n',
                                          ),
                                          TextSpan(
                                            text:
                                                _totalPaidTeamCount.toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                route.push(
                                    TeamViewRoute(
                                        appBarName: 'Total Team',
                                        level: -1,
                                        userStatus: 0,
                                        fetchDay: 'All'),
                                    context);
                              },
                              child: Container(
                                height: 65,
                                width: 110,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        style: AppTextStyles.appCaptionText(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red),
                                        children: [
                                          TextSpan(
                                            text: 'Total Team\n',
                                          ),
                                          TextSpan(
                                            text: _totalTeamCount.toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                top: 20, right: 7, left: 7),
                            child: Table(columnWidths: const {
                              0: FixedColumnWidth(60)
                            }, children: [
                              TableRow(children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Text(
                                    'Level',
                                    textAlign: TextAlign.center,
                                    // style: teamText.copyWith(color: Colors.green)
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Text('Free Team',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Text('Paid Team',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 6),
                                  child: Text('Total Team',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ]),
                              for (var i = 1; i <= 15; i++) ...[
                                TableRow(children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(5)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4, vertical: 6),
                                    child: Text(i.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0))),
                                  ),
                                  InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    // onTap: () {
                                    //   Navigator.of(context)
                                    //       .pushNamed('/view-team', arguments: {
                                    //     "appBarName": "Level $i Free Team",
                                    //     "level": i,
                                    //     "status": 0,
                                    //     "fetchDay": "All"
                                    //   }).then((value) => _clearSearch());
                                    // },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 6),
                                      child: Text(
                                        _getTeamCount(teamData, i, 'Free')
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        // style: teamText.copyWith(
                                        //     color: freeColor)
                                      ),
                                      // child: Text(
                                      //   "0",
                                      //   textAlign: TextAlign.center,
                                      //   style: TextStyle(color: Colors.red),
                                      // ),
                                    ),
                                  ),
                                  InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    // onTap: () {
                                    //   Navigator.of(context)
                                    //       .pushNamed('/view-team', arguments: {
                                    //     "appBarName": "Level $i Paid Team",
                                    //     "level": i,
                                    //     "status": 1,
                                    //     "fetchDay": "All"
                                    //   }).then((value) => _clearSearch());
                                    // },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 6),
                                      child: Text(
                                        _getTeamCount(teamData, i, 'Paid')
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        // style: teamText.copyWith(
                                        //     color: freeColor)
                                      ),
                                      // child: Text(
                                      //   "0",
                                      //   textAlign: TextAlign.center,
                                      //   style: TextStyle(color: Colors.red),
                                      // ),
                                    ),
                                  ),
                                  InkWell(
                                    customBorder: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    // onTap: () {
                                    //   Navigator.of(context)
                                    //       .pushNamed('/view-team', arguments: {
                                    //     "appBarName": "Level $i Total Team",
                                    //     "level": i,
                                    //     "status": -1,
                                    //     "fetchDay": "All"
                                    //   }).then((value) => _clearSearch());
                                    // },
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 6),
                                      child: Text(
                                          (_getTeamCount(teamData, i, 'Free') +
                                                  _getTeamCount(
                                                      teamData, i, 'Paid'))
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ])
                              ]
                            ])),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
