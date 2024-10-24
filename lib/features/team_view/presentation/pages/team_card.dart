import 'package:flutter/material.dart';
// import 'package:svnpay/widgets/custom/custom_separator.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamCard extends StatelessWidget {
  final Map details;
  const TeamCard({Key? key, required this.details}) : super(key: key);

  _rowSection(label, value, color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w500, color: color),
          ),
          Spacer(),
          Text(
            "$value",
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color? color = Colors.blue;
    if (details['package'] == "Free") {
      color = Colors.pink[700];
    } else if (details['package'] == "Prime") {
      color = Colors.orange[700];
    } else if (details['package'] == "Super Prime") {
      color = Colors.green[700];
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      // color: green100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(4)),
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        // color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: "L${details['level']} |",
                    // style: TextStyle(color: whiteColor)
                  ),
                  TextSpan(text: " ${details['name']} |"),
                  TextSpan(
                    text: " ${details['user_id']}",
                  )
                ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            // child: CustomSeparator(
            //   color: greyColor,
            // ),
          ),
          _rowSection('Package', details['package'], Colors.green),
          _rowSection('Rank', details['rank'] ?? "Not Achieved", Colors.green),
          if (details['level'] == 1)
            _rowSection('Mobile', details['mobile'], Colors.green),
          _rowSection('Sponsor', details['sponsor'], Colors.green),
          _rowSection(
              'Date',
              details['activation_date'] == null
                  ? details['date'].split(" ").first
                  : details['activation_date'].split(" ").first,
              Colors.green),
          _rowSection(
              'Time',
              details['activation_date'] == null
                  ? details['time'].split(" ").last
                  : details['activation_date'].split(" ").last,
              Colors.green),
        ],
      ),
    );
  }
}


// Future<List<Map<String, String>>> _getTeamView(
//     int currentPage, int userStatus, int level, String fetchDay, String fromDate, String toDate) async {
  
//   // Replace this with your API call logic
//   // Assuming you want to filter the predefined teamData based on arguments
//   List<Map<String, String>> teamData = [
//     {
//       "level": "1",
//       "name": "Adarsh Yadav",
//       "package": "Free",
//       "rank": "Not Achieved",
//       "sponsor": "CLASEYHDH",
//       "date": "30/03/2024",
//       "time": "12:45:09"
//     },
//     {
//       "level": "2",
//       "name": "Ram Singh",
//       "package": "Free",
//       "rank": "Not Achieved",
//       "sponsor": "CLASEYHDH",
//       "date": "30/03/2024",
//       "time": "12:45:09"
//     },
//     {
//       "level": "3",
//       "name": "Vikas Pandit",
//       "package": "Free",
//       "rank": "Not Achieved",
//       "sponsor": "CLASEYHDH",
//       "date": "30/03/2024",
//       "time": "12:45:09"
//     },
//     // ... your data continues
//   ];

//   // Filter teamData based on the arguments if needed (e.g., userStatus, level, fetchDay, date ranges)
//   var filteredData = teamData.where((team) {
//     bool matchesLevel = team['level'] == level.toString();
//     bool matchesFetchDay = team['date'] == fetchDay;
//     // Add more filtering based on other conditions such as fromDate, toDate, userStatus
//     return matchesLevel && matchesFetchDay;
//   }).toList();

//   // Implement pagination logic based on currentPage
//   int itemsPerPage = 5;  // You can adjust this value
//   int startIndex = (currentPage - 1) * itemsPerPage;
//   int endIndex = startIndex + itemsPerPage;

//   // Slice the data for pagination
//   var paginatedData = filteredData.sublist(
//     startIndex,
//     endIndex > filteredData.length ? filteredData.length : endIndex,
//   );

//   // Simulate API delay (optional)
//   await Future.delayed(Duration(milliseconds: 500));

//   return paginatedData;
// }
