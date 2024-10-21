import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zed_business/core/styles/text.style.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  static var page;

  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
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
          {
            "text": "About Us",
            "icon": "assets/svg/bxs_file-pdf.svg",
          },
          {
            "text": "Terms & Conditions",
            "icon": "assets/svg/bxs_file-pdf.svg",
          },
          {
            "text": "Privacy & Policy",
            "icon": "assets/svg/bxs_file-pdf.svg",
          },
          {
            "text": "Help Center",
            "icon": "assets/svg/bxs_file-pdf.svg",
          },
          {
            "text": "Rate Us",
            "icon": "assets/svg/bxs_file-pdf.svg",
          },
          {
            "text": "Settings",
            "icon": "assets/svg/bxs_file-pdf.svg",
          },
        ],
      },
    ];

    List servicesList = services[0]["Pay and Receive"];

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 225,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 35),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 18, left: 18, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/png/profileimage.png",
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Sunny Kharwar",
                          style: AppTextStyles.appBodyText(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "ZP 237462",
                          style: AppTextStyles.appCaptionText(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white)
                              .copyWith(fontSize: 12),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        OutlinedButton.icon(
                          onPressed: () {},
                          label: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/svg/crown.svg"),
                              const Text(
                                'Free Membership',
                                style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              side: const BorderSide(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  width: 1.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: EdgeInsets.only(right: 100, left: 100)),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    var service = servicesList[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 0.5)),
                      ),
                      child: ListTile(
                        minVerticalPadding: 22,
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
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right,
                              size: 25,
                              color: Color.fromRGBO(0, 0, 0, 1),
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

                // Static Logout ListTile
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5)),
                  ),
                  child: ListTile(
                    minVerticalPadding: 22,
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
                      print('Logout tapped');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
