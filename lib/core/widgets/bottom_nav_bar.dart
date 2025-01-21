// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/core/screens/home_page.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentPage = 0;
  List<Widget> pages = [
    HomePage(),
    const Center(child: Text("Calendar")),
    const Center(child: Text("Compass")),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: Colors.blue, // Selected icon color
            unselectedItemColor: Colors.grey, // Unselected icon color
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentPage,
            onTap: (index) {
              setState(() {
                currentPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.homeSvg, // Replace with your SVG path
                  width: 30,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.calenderSvg, // Replace with your SVG path
                  width: 40,
                ),
                label: "Calendar",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.compassSvg, // Replace with your SVG path
                  width: 40,

                  // Dynamic color
                ),
                label: "Compass",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImages.profileSvg, // Replace with your SVG path
                  width: 30,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
