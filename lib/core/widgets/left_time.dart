// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';
import 'package:prayer_schedule_app/components/app_images.dart';

class LeftTime extends StatelessWidget {
  final double padding;
  final String prayerName;
  final String remainingTime;
  LeftTime({
    required this.prayerName,
    required this.remainingTime,
    required this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: padding, left: padding),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white, // Border color
            width: 1, // Border width
          ),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              prayerName,
              style: AppFonts.get24Font(),
            ),
            Text(
              "Left: $remainingTime",
              style: AppFonts.get24Font(),
            ),
            SvgPicture.asset(
              width: 34,
              AppImages.turnSvg,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
