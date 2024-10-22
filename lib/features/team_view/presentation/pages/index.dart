import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/features/homePage/presentation/logic/others/carousel.dart';
import 'package:zed_business/features/homePage/presentation/logic/others/drawer.dart';
import 'package:zed_business/features/homePage/presentation/logic/others/homepage.dart';

@RoutePage()
class TeamViewPage extends ConsumerStatefulWidget {
  String? appBarName;
  int level = -1;
  int userStatus = 0;
  String fetchDay = "All";

  TeamViewPage({super.key, required this.appBarName, required this.level, required this.userStatus, required this.fetchDay});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TeamViewPageState();
}

class _TeamViewPageState extends ConsumerState<TeamViewPage> {
  bool _isLoading = false;
  final ScrollController scrollController = ScrollController();

      //  List<Map<String, String>> teamData =  [ {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test",
      //       "user_id": "SP79478939",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902118",
      //       "date": "2024-09-28 04:33:11",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test2",
      //       "user_id": "SP69166792",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902117",
      //       "date": "2024-09-28 04:42:32",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test",
      //       "user_id": "SP17350281",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902114",
      //       "date": "2024-09-28 08:50:23",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test7",
      //       "user_id": "SP01544943",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834905119",
      //       "date": "2024-09-28 08:52:39",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test",
      //       "user_id": "SP80681581",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834901119",
      //       "date": "2024-09-30 10:43:10",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Sunny Kharwar",
      //       "user_id": "SP52839641",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9370994506",
      //       "date": "2024-06-07 18:33:22",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Thikanjaytripura",
      //       "user_id": "SP62485937",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9366543181",
      //       "date": "2024-08-02 23:55:02",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Raj",
      //       "user_id": "SP47325196",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8459186035",
      //       "date": "2024-08-23 11:32:05",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Bharat Bhandari",
      //       "user_id": "SP51324876",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902119",
      //       "date": "2024-06-20 11:03:33",
      //       "activation_date": null,
      //       "sponsor_id": "SP52839641"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Raj",
      //       "user_id": "SP14375296",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8459186036",
      //       "date": "2024-07-03 14:32:37",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Mahafujul Haque",
      //       "user_id": "SP46129738",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "7550942157",
      //       "date": "2024-07-08 12:33:30",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "ASHOK DHAKER",
      //       "user_id": "SP85267143",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8239659815",
      //       "date": "2024-07-13 20:52:05",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "PratikRanjan",
      //       "user_id": "SP85269471",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "7004523267",
      //       "date": "2024-07-25 18:30:13",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Ankit Garg",
      //       "user_id": "SP16543928",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "7404322643",
      //       "date": "2024-08-01 10:51:26",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Shakti Singh",
      //       "user_id": "SP15962483",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9116872820",
      //       "date": "2024-08-01 13:36:00",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Sameer Shah",
      //       "user_id": "SP16278495",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9166028739",
      //       "date": "2024-08-01 14:23:21",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Rajesh Reddy",
      //       "user_id": "SP95164378",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9676714389",
      //       "date": "2024-08-07 16:25:40",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Md Asik",
      //       "user_id": "SP89734621",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8327876827",
      //       "date": "2024-08-07 20:30:36",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Md Asif",
      //       "user_id": "SP83921746",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8372960764",
      //       "date": "2024-08-07 20:36:38",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Guddu Kumar",
      //       "user_id": "SP41593876",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8789610580",
      //       "date": "2024-08-13 00:45:23",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },{
      //       "level": 1,
      //       "status": "1",
      //       "full_name": "Kalyan Mandal",
      //       "user_id": "SP92167835",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9883948889",
      //       "date": "2024-06-07 12:21:47",
      //       "activation_date": "2024-06-12 19:44:33",
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "1",
      //       "full_name": "Vicky Kumar",
      //       "user_id": "SP76491532",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "8793184447",
      //       "date": "2024-06-12 18:14:24",
      //       "activation_date": "2024-08-18 17:00:02",
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "1",
      //       "full_name": "Narendra Kumar",
      //       "user_id": "SP82964137",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9060992673",
      //       "date": "2024-06-28 15:00:32",
      //       "activation_date": "2024-06-28 15:04:52",
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "SVN Pay ",
      //       "user_id": "SP91657428",
      //       "package": "Super Prime",
      //       "rank": "Bronze",
      //       "mobile": "9335162060",
      //       "date": "2024-06-07 12:27:03",
      //       "activation_date": "2024-06-12 19:44:58",
      //       "sponsor_id": "SP92167835"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Test1",
      //       "user_id": "SP45973216",
      //       "package": "Prime",
      //       "rank": null,
      //       "mobile": "8208230694",
      //       "date": "2024-06-12 18:20:26",
      //       "activation_date": "2024-06-12 18:44:25",
      //       "sponsor_id": "SP76491532"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Sunny Kharwar",
      //       "user_id": "SP71635849",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9370994507",
      //       "date": "2024-06-15 16:55:37",
      //       "activation_date": "2024-06-15 17:10:01",
      //       "sponsor_id": "SP76491532"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Shubham",
      //       "user_id": "SP68321547",
      //       "package": "Prime",
      //       "rank": null,
      //       "mobile": "8630402131",
      //       "date": "2024-07-05 12:56:13",
      //       "activation_date": "2024-08-30 08:28:22",
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Test",
      //       "user_id": "SP92831746",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "8793184448",
      //       "date": "2024-07-13 08:28:17",
      //       "activation_date": "2024-08-18 19:40:01",
      //       "sponsor_id": "SP76491532"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Parmeshwarrathia",
      //       "user_id": "SP83256497",
      //       "package": "Prime",
      //       "rank": null,
      //       "mobile": "7987574157",
      //       "date": "2024-09-27 20:43:55",
      //       "activation_date": "2024-10-06 09:55:05",
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Amarpreet Singh",
      //       "user_id": "SP86193257",
      //       "package": "Prime",
      //       "rank": null,
      //       "mobile": "9760640553",
      //       "date": "2024-09-12 16:11:26",
      //       "activation_date": "2024-09-12 16:35:52",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Rakesh Kumar",
      //       "user_id": "SP41853627",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9698323568",
      //       "date": "2024-09-13 22:32:01",
      //       "activation_date": "2024-09-13 22:33:15",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Poonam Yadav ",
      //       "user_id": "SP85937426",
      //       "package": "Super Prime",
      //       "rank": "Gold",
      //       "mobile": "9310076341",
      //       "date": "2024-06-07 12:32:10",
      //       "activation_date": "2024-06-12 19:38:58",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Dharmendra Kumar ",
      //       "user_id": "SP78261954",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9897551003",
      //       "date": "2024-06-13 00:21:09",
      //       "activation_date": "2024-06-13 00:29:45",
      //       "sponsor_id": "SP45973216"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Prachi Keshwan ",
      //       "user_id": "SP98672531",
      //       "package": "Super Prime",
      //       "rank": "Bronze",
      //       "mobile": "9027943877",
      //       "date": "2024-07-03 23:30:48",
      //       "activation_date": "2024-07-03 23:38:33",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Shivam Kumar ",
      //       "user_id": "SP16293874",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "8393991678",
      //       "date": "2024-07-03 23:32:18",
      //       "activation_date": "2024-07-03 23:39:01",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Anil Kumar",
      //       "user_id": "SP73825641",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "8237848671",
      //       "date": "2024-08-22 20:06:11",
      //       "activation_date": "2024-09-13 22:35:02",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Arvind Kumar",
      //       "user_id": "SP24687195",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9897944488",
      //       "date": "2024-08-24 14:10:53",
      //       "activation_date": "2024-09-13 22:30:02",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 3,
      //       "status": "1",
      //       "full_name": "Neetu",
      //       "user_id": "SP69178532",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "8279762849",
      //       "date": "2024-09-06 12:57:11",
      //       "activation_date": "2024-09-13 22:28:21",
      //       "sponsor_id": "SP91657428"
      //   },
      //   {
      //       "level": 4,
      //       "status": "1",
      //       "full_name": "Deepak Kumar",
      //       "user_id": "SP92568173",
      //       "package": "Super Prime",
      //       "rank": "Gold",
      //       "mobile": "9812194855",
      //       "date": "2024-06-07 12:35:54",
      //       "activation_date": "2024-06-12 20:11:30",
      //       "sponsor_id": "SP85937426"
      //   },
      //   {
      //       "level": 4,
      //       "status": "1",
      //       "full_name": "HARDEEP SINGH",
      //       "user_id": "SP27849165",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9815221676",
      //       "date": "2024-06-07 13:04:49",
      //       "activation_date": "2024-06-14 16:44:05",
      //       "sponsor_id": "SP85937426"
      //   },
      //    {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test",
      //       "user_id": "SP79478939",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902118",
      //       "date": "2024-09-28 04:33:11",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test2",
      //       "user_id": "SP69166792",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902117",
      //       "date": "2024-09-28 04:42:32",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test",
      //       "user_id": "SP17350281",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902114",
      //       "date": "2024-09-28 08:50:23",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test7",
      //       "user_id": "SP01544943",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834905119",
      //       "date": "2024-09-28 08:52:39",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Test",
      //       "user_id": "SP80681581",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834901119",
      //       "date": "2024-09-30 10:43:10",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "1",
      //       "full_name": "Kalyan Mandal",
      //       "user_id": "SP92167835",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9883948889",
      //       "date": "2024-06-07 12:21:47",
      //       "activation_date": "2024-06-12 19:44:33",
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Sunny Kharwar",
      //       "user_id": "SP52839641",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9370994506",
      //       "date": "2024-06-07 18:33:22",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "1",
      //       "full_name": "Vicky Kumar",
      //       "user_id": "SP76491532",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "8793184447",
      //       "date": "2024-06-12 18:14:24",
      //       "activation_date": "2024-08-18 17:00:02",
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "1",
      //       "full_name": "Narendra Kumar",
      //       "user_id": "SP82964137",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9060992673",
      //       "date": "2024-06-28 15:00:32",
      //       "activation_date": "2024-06-28 15:04:52",
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Thikanjaytripura",
      //       "user_id": "SP62485937",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9366543181",
      //       "date": "2024-08-02 23:55:02",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 1,
      //       "status": "0",
      //       "full_name": "Raj",
      //       "user_id": "SP47325196",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8459186035",
      //       "date": "2024-08-23 11:32:05",
      //       "activation_date": null,
      //       "sponsor_id": "SP09092009"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "SVN Pay ",
      //       "user_id": "SP91657428",
      //       "package": "Super Prime",
      //       "rank": "Bronze",
      //       "mobile": "9335162060",
      //       "date": "2024-06-07 12:27:03",
      //       "activation_date": "2024-06-12 19:44:58",
      //       "sponsor_id": "SP92167835"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Test1",
      //       "user_id": "SP45973216",
      //       "package": "Prime",
      //       "rank": null,
      //       "mobile": "8208230694",
      //       "date": "2024-06-12 18:20:26",
      //       "activation_date": "2024-06-12 18:44:25",
      //       "sponsor_id": "SP76491532"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Sunny Kharwar",
      //       "user_id": "SP71635849",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "9370994507",
      //       "date": "2024-06-15 16:55:37",
      //       "activation_date": "2024-06-15 17:10:01",
      //       "sponsor_id": "SP76491532"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Bharat Bhandari",
      //       "user_id": "SP51324876",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "9834902119",
      //       "date": "2024-06-20 11:03:33",
      //       "activation_date": null,
      //       "sponsor_id": "SP52839641"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Raj",
      //       "user_id": "SP14375296",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "8459186036",
      //       "date": "2024-07-03 14:32:37",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Shubham",
      //       "user_id": "SP68321547",
      //       "package": "Prime",
      //       "rank": null,
      //       "mobile": "8630402131",
      //       "date": "2024-07-05 12:56:13",
      //       "activation_date": "2024-08-30 08:28:22",
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "Mahafujul Haque",
      //       "user_id": "SP46129738",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "7550942157",
      //       "date": "2024-07-08 12:33:30",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   },
      //   {
      //       "level": 2,
      //       "status": "1",
      //       "full_name": "Test",
      //       "user_id": "SP92831746",
      //       "package": "Super Prime",
      //       "rank": null,
      //       "mobile": "8793184448",
      //       "date": "2024-07-13 08:28:17",
      //       "activation_date": "2024-08-18 19:40:01",
      //       "sponsor_id": "SP76491532"
      //   },
      //   {
      //       "level": 2,
      //       "status": "0",
      //       "full_name": "PratikRanjan",
      //       "user_id": "SP85269471",
      //       "package": "Free",
      //       "rank": null,
      //       "mobile": "7004523267",
      //       "date": "2024-07-25 18:30:13",
      //       "activation_date": null,
      //       "sponsor_id": "SP82964137"
      //   }
      //   ];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _getHome();
    }
  }

  _getHome() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
        _isLoading = false;
      });
    }
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
      body: RefreshIndicator(
        onRefresh: () async {
          await _getHome();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              // children: [Expanded(child: InfiniteScrollPagination())],
              ),
        ),
      ),
    );
  }
}


