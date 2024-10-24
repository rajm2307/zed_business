import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:zed_business/core/styles/text.style.dart';
// import 'package:zed_business/features/homePage/presentation/logic/others/carousel.dart';
// import 'package:zed_business/features/homePage/presentation/logic/others/drawer.dart';
// import 'package:zed_business/features/homePage/presentation/logic/others/homepage.dart';
import 'package:zed_business/features/team_view/presentation/pages/infinite_scroll_pagination.dart';
import 'package:zed_business/features/team_view/presentation/pages/team_card.dart';

@RoutePage()
class TeamViewPage extends ConsumerStatefulWidget {
  final ScrollController scrollController = ScrollController();

  String appBarName;
  int level;
  int userStatus;
  String fetchDay;

  TeamViewPage(
      {super.key,
      required this.appBarName,
      required this.level,
      required this.userStatus,
      required this.fetchDay});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamViewPageState();
}

class _TeamViewPageState extends ConsumerState<TeamViewPage> {
  bool _isLoading = false;
  final ScrollController scrollController = ScrollController();

    // Declare class-level variables
  late String _appBarName;
  late int _level;
  late int _userStatus;
  late String _fetchDay;

  @override
  void initState() {
    super.initState();    // Assign widget data to class-level variables
    _appBarName = widget.appBarName;
    _level = widget.level;
    _userStatus = widget.userStatus;
    _fetchDay = widget.fetchDay;
    if (mounted) {
      setState(() {
        // You can modify values here if needed
        _appBarName = widget.appBarName;
        _level = widget.level;
        _userStatus = widget.userStatus;
        _fetchDay = widget.fetchDay;

      });
    }
  }

  _teamCard(team) {
    return TeamCard(details: team);
  }

//   List<Map<String, String>> _getTeamView(
//     int currentPage, {
//     int? levelFilter,
//     String? packageFilter,
//   }) {

//         _level ??= _level; // If level is not provided, use the default _level
//         _userStatus  ??= _userStatus;
        

//     // Predefined list of team data
//     List<Map<String, String>> teamData = [
//       {
//         "level": "1",
//         "name": "Adarsh Yadav",
//         "package": "Free",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "2",
//         "name": "Ram Singh",
//         "package": "Free",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "3",
//         "name": "Vikas Pandit",
//         "package": "Free",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "3",
//         "name": "Sunnuy Kahrwar",
//         "package": "Free",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "1",
//         "name": "Raj Mandal",
//         "package": "Paid",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "2",
//         "name": "Vikram Pandit",
//         "package": "Paid",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "2",
//         "name": "Vikram Baital",
//         "package": "Paid",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "4",
//         "name": "Vikram Singh",
//         "package": "Paid",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "4",
//         "name": "Vikram Maharana",
//         "package": "Paid",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "4",
//         "name": "Vikram Maharana",
//         "package": "Free",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//       {
//         "level": "4",
//         "name": "Vikram Maharana",
//         "package": "Free",
//         "rank": "Not Achieved",
//         "sponsor": "CLASEYHDH",
//         "date": "30/03/2024",
//         "time": "12:45:09"
//       },
//     ];

//     // Apply filtering logic based on the passed filters (optional)
//     if (levelFilter != null) {
//       teamData =
// teamData = teamData
//         .where((member) => int.parse(member['level']!) == levelFilter)
//         .toList();
//     }
//     if (packageFilter != null) {
//       teamData = teamData
//           .where((member) => member['package'] == packageFilter)
//           .toList();
//     }

//     print(teamData);
//     // Return the subset of data for the current page
//     return teamData;


//   }

List<Map<String, String>> _getTeamView(int currentPage ) {
  // Instead of fetching from API, we use the predefined list of team data
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

  // You can implement pagination logic here if needed
  // For now, we'll return the entire teamData
  return teamData;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        backgroundColor: Colors.red,
        scrolledUnderElevation: 10.0,
        toolbarHeight: 60,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          widget.appBarName!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
                child: InfiniteScrollPagination(
              scrollController: scrollController,
              fetchDataFunction: _getTeamView,
              showList: _teamCard,
            ))
          ],
        ),
      ),
    );
  }
}