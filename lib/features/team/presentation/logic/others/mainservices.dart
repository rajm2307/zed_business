import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget1 extends StatelessWidget {
  CardWidget1({
    super.key,
    required this.label,
    required this.image,
    required this.count,
    required this.color,
    required this.function,
  });

  String label;
  String image;
  int count;
  Color? color;
  VoidCallback function;
  // final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.only(top: 7, bottom: 7),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 25,
            left: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon Circle
              Container(
                padding: EdgeInsets.only(top: 7, bottom: 7),
                child: Center(child: SvgPicture.asset(image)),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 10),
                  Text(
                    label == "Fund Wallet" ? "₹$count" : "$count",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget2 extends StatelessWidget {
  CardWidget2({
    super.key,
    required this.label,
    required this.image,
    required this.count,
    required this.color,
    required this.function,
  });

  String label;
  String image;
  int count;
  Color? color;
  VoidCallback function;
  // final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.only(top: 7, bottom: 7),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 25,
            left: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    label == "Fund Wallet" ? "₹$count" : "$count",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Icon Circle
              Container(
                padding: EdgeInsets.only(top: 7, bottom: 7),
                child: Center(child: SvgPicture.asset(image)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
