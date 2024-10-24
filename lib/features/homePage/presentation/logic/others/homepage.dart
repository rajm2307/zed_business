import 'package:flutter/material.dart';
import 'package:zed_business/core/styles/text.style.dart';

class MainServices extends StatelessWidget {
  MainServices({
    super.key,
    required this.label,
    required this.image,
    required this.money,
  });

  String label;
  String image;
  double? money;
  // final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("services clicked");
      },
      child: Container(
        height: 200,
        width: 175,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.appCaptionText(
                        fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      ">",
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Image.asset(
                image,
                height: 95,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "₹$money",
                style: AppTextStyles.appHeadingText(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}










