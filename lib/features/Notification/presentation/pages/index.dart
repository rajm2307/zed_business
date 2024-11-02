import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zed_business/core/routes/route.gr.dart';
import 'package:zed_business/core/styles/text.style.dart';
import 'package:zed_business/features/withdrawal_/withdrawal/presentation/pages/index.dart';
import 'package:zed_business/services/provider.dart';

@RoutePage()
class NotificationPage extends ConsumerStatefulWidget {
  static var page;

  const NotificationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  bool hasNotification = true;

  final List services = [
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor",
      "icon": "assets/svg/shoppingbag.svg",
      "days": "4",
      "notification": true
    },
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor",
      "icon": "assets/svg/shoppingbag.svg",
      "days": "14",
      "notification": true
    },
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor",
      "icon": "assets/svg/shoppingbag.svg",
      "days": "6",
      "notification": true
    },
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor",
      "icon": "assets/svg/shoppingbag.svg",
      "days": "12",
      "notification": true
    },
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor",
      "icon": "assets/svg/shoppingbag.svg",
      "days": "9",
      "notification": true
    },
    {
      "text":
          "Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor",
      "icon": "assets/svg/shoppingbag.svg",
      "days": "5",
      "notification": true
    },
  ];

  // Future<void> _selectDateRange(BuildContext context) async {
  //   // setState(() {
  //   //   _datesLoading = true;
  //   // });
  //   final DateTimeRange? picked = await showDateRangePicker(
  //       context: context,
  //       firstDate: DateTime(1900, 8),
  //       lastDate: DateTime.now());
  //   if (picked != null) {
  //     var initialDate = picked.start.toString().split(' ').first;
  //     var endDate = picked.end.toString().split(' ').first;
  //     // setState(() {
  //     //   selectedDates = picked;
  //     //   fromDate = initialDate;
  //     //   toDate = endDate;
  //     //   dateButtonLabel = "$initialDate to $endDate";
  //     // });
  //   }
  //   // setState(() {
  //   //   _datesLoading = false;
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: services.isNotEmpty
              ? ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, providerIndex) {
                    var service = services[providerIndex];
                    bool hasNotification = service['notification'];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          final route = ref.read(routeService);
                          route.push(WithdrawalRoute(), context);
                          services[providerIndex]['notification'] = false;
                        });
                      },
                      child: ListTile(
                        minVerticalPadding: 17,
                        leading: Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255)),
                                child: SvgPicture.asset(
                                  service['icon'],
                                  height: 20,
                                  color: hasNotification
                                      ? Colors.red
                                      : Colors.grey,
                                )),
                            if (hasNotification)
                              Positioned(
                                right: 5,
                                top: 5,
                                child: Container(
                                  width: 7,
                                  height: 7,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service['text'],
                              style: AppTextStyles.appCaptionText(
                                      fontWeight: FontWeight.w500)
                                  .copyWith(
                                fontSize: 14,
                                color: hasNotification
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              "${service['days']} Day Ago",
                              style: AppTextStyles.appCaptionText(
                                      fontWeight: FontWeight.w500)
                                  .copyWith(fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/empty_notification.svg',
                      width: 300,
                      height: 300,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Text(
                      'There’s no notifications ',
                      style: AppTextStyles.appTitleText(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Your notifications will be appear\non this page",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.appCaptionText(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w400)
                          .copyWith(fontSize: 16),
                    ),
                    // GestureDetector(
                    //   onTap: () async {
                    //     await _selectDateRange(context);
                    //   },
                    //   child: Text(
                    //     "data",
                    //     style: TextStyle(color: Colors.red),
                    //   ),
                    // )
                  ],
                )),
        ),
      ),
    );
  }
}
