import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.label,
    required this.image,
    required this.count,
    required this.color,
  });

  String label;
  String image;
  int count;
  Color? color;
  // final void Function()? onClick;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 175,
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF3A45FF),
              shape: BoxShape.circle,
            ),
            child: Center(child: SvgPicture.asset("assets/svg/menu.svg")),
          ),
          SizedBox(height: 10), // Spacing between icon and number
          // Number
          Text(
            label == "Fund Wallet" ? "₹$count" : "$count",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
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
    );
  }
}
