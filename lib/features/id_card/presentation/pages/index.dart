import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class IdCardPage extends ConsumerStatefulWidget {
  static var page;

  const IdCardPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IdCardPageState();
}

class _IdCardPageState extends ConsumerState<IdCardPage> {
  File? pickedImage;

  _rowSection(label, value) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.pink[700]),
            ),
            Text(
              "$value",
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 480,
                clipBehavior: Clip.antiAlias,
                width: 315,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/png/top_shape.png',
                      // height: 185,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                          ),
                          child: ClipOval(
                            child: pickedImage != null
                                ? Image.file(
                                    pickedImage!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Sunny Kharwar',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Color.fromRGBO(0, 0, 0, 1)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        const Text(
                          "Free Member",
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 70, left: 70, top: 30),
                          child: Column(
                            children: [
                              _rowSection(
                                'User ID :',
                                'ZP 237462',
                              ),
                              _rowSection(
                                'Status  :',
                                'Super Prime',
                              ),
                              _rowSection(
                                'Mobile  :',
                                '9345005407',
                              ),
                              _rowSection(
                                'Date      :',
                                '10/08/24',
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/png/bottom_shape.png',
                      // height: 185,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
