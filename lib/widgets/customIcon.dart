import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomIconContainer extends StatelessWidget {
  final IconData icon;

  const CustomIconContainer({
    Key? key,
    required this.icon, // Only icon is required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 5.h,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon),
    );
  }
}
