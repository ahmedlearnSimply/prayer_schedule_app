import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/core/screens/calender_page.dart';
import 'package:prayer_schedule_app/core/screens/compass.dart';
import 'package:prayer_schedule_app/core/screens/home_page.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentPage = 0;
  List<Widget> pages = [
    const HomePage(),
    const CalenderPage(),
    CompassPage(),
    const Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a Stack to overlay the bottom navigation bar on top of the content
      body: Stack(
        children: [
          // Display the selected page
          pages[currentPage],

          // Bottom Navigation Bar (positioned at the bottom of the screen)
          Positioned(
            left: 10,
            right: 10,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white
                      .withOpacity(0.9), // Semi-transparent background
                  elevation: 0,
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
                        AppImages.homeSvg,
                        width: 35,
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppImages.calenderSvg,
                        width: 40,
                      ),
                      label: "Calendar",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppImages.compassSvg,
                        width: 40,
                      ),
                      label: "Compass",
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppImages.profileSvg,
                        width: 40,
                      ),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
