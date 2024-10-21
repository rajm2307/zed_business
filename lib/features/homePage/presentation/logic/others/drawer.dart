import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zed_business/core/styles/text.style.dart';
// import 'package:a1_recharge/drawer/drawer_header_inner_section/profile.dart';

class openDrawer extends StatefulWidget {
  const openDrawer({super.key});
  @override
  _openDrawerState createState() => _openDrawerState();
}

class _openDrawerState extends State<openDrawer> {
  @override
  Widget build(BuildContext context) {
    final List services = [
      {
        "Pay and Receive": [
          {
            "text": "QR COde",
            "icon": "assets/svg/ph_qr-code-fill.svg",
          },
          {
            "text": "ID Card",
            "icon": "assets/svg/solar_user-id-bold.svg",
          },
          {
            "text": "Bank KYC",
            "icon": "assets/svg/mdi_bank.svg",
          },
          {
            "text": "All History",
            "icon": "assets/svg/ic_baseline-history.svg",
          },
          {
            "text": "Gallery",
            "icon": "assets/svg/solar_gallery-bold.svg",
          },
          {
            "text": "PDF & Video",
            "icon": "assets/svg/bxs_file-pdf.svg",
          },
        ],
      },
    ];

    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 90, bottom: 0),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                  child: Image.asset(
                    'assets/png/profileimage.png',
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Vikram Pandit',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'ZP 237462',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false,
                              applyHeightToLastDescent: false),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: services[0].keys.length,
              itemBuilder: (context, index) {
                String key = services[0].keys.elementAt(index);
                List servicesList = services[0][key];
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: servicesList.length,
                      itemBuilder: (context, providerIndex) {
                        var service = servicesList[providerIndex];
                        return ListTile(
                          minVerticalPadding: 10,
                          leading: SvgPicture.asset(
                            service['icon'],
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          title: Row(
                            children: [
                              Text(
                                service['text'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                              Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ],
                          ),
                          onTap: () {
                            print('${service['text']} tapped');
                          },
                        );
                      },
                    ),
                    ListTile(
                      leading: SvgPicture.asset(
                        "assets/svg/logout.svg",
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        'Logout',
                        style: AppTextStyles.appCaptionText(
                                fontWeight: FontWeight.w400)
                            .copyWith(fontSize: 16),
                      ),
                      onTap: () {
                        print('logout tapped');
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
