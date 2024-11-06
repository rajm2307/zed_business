import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zed_business/core/styles/text.style.dart';

@RoutePage()
class HistoryPage extends ConsumerStatefulWidget {
  static var page;

  const HistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final List services = [
      {
        "July 2024": [
          {
            "text": "Bank Transfer",
            "icon": "assets/svg/transaction_icon_1.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 2590.0,
          },
          {
            "text": "Fund Transfer",
            "icon": "assets/svg/transaction_icon_1.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 7890.0,
          },
          {
            "text": "Bank Transfer",
            "icon": "assets/svg/transaction_icon_2.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 5520.0,
          },
          {
            "text": "Fund Transfer",
            "icon": "assets/svg/transaction_icon_1.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 5500.0,
          },
          {
            "text": "Fund Transfer",
            "icon": "assets/svg/transaction_icon_2.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 2240.0,
          },
        ],
      },
      {
        "July 2025": [
          {
            "text": "Bank ",
            "icon": "assets/svg/transaction_icon_1.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 2590.0,
          },
          {
            "text": "Fund ",
            "icon": "assets/svg/transaction_icon_1.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 7890.0,
          },
          {
            "text": "Bank ",
            "icon": "assets/svg/transaction_icon_2.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 5520.0,
          },
          {
            "text": "Fund ",
            "icon": "assets/svg/transaction_icon_1.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 5500.0,
          },
          {
            "text": "Fund ",
            "icon": "assets/svg/transaction_icon_2.svg",
            'date': DateTime.parse('2024-08-16 04:30:00'),
            'amount': 2240.0,
          },
        ],
      },
    ];

    List servicesList = [];

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              // Replace the outer ListView.builder with Column
              children: [
                ...services.map((monthEntry) {
                  String monthName = monthEntry.keys.first;
                  List<Map<String, dynamic>> monthServices =
                      monthEntry[monthName]!;

                  return Container(
                    margin: EdgeInsets.only(top: 100),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      // No Expanded here
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 0.1)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                monthName,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                        ),
                        ListView.builder(
                          shrinkWrap:
                              true, // Use shrinkWrap here to avoid unbounded height issue
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: monthServices.length,
                          itemBuilder: (BuildContext context, int index) {
                            // for (var service in services[index]) {
                            //   for (var objects in service.values) {
                            //     servicesList.addAll(objects);
                            //   }
                            // }
                            // var fl = services[index];
                            // var infl = fl.values.first;
                            // print(infl);
                            // var service = servicesList[index];
                            // print(service);
                            var service = monthServices[index];

                            return Container(
                              child: ListTile(
                                minVerticalPadding: 18,
                                leading: SvgPicture.asset(
                                  service['icon'],
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.cover,
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          service['text'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text('₹${service['amount'].toString()}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: DateFormat('dd MMMM yyyy')
                                                    .format(service['date']),
                                                style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: " at ",
                                                style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              TextSpan(
                                                text: DateFormat('h:mm a')
                                                    .format(service['date']),
                                                style: TextStyle(
                                                  fontSize: 12.5,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  print('${service['text']} tapped');
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
