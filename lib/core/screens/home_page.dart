// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//! todo to make svgpicture
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/core/widgets/prayer_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text('Home Page')),
    Center(child: Text('Calendar Page')),
    Center(child: Text('Prayer Times Page')),
    Center(child: Text('Settings Page')),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //* background static
        body: Stack(
          children: [
            //* background image
            Positioned.fill(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppImages.fajr,
                    ), // Replace with your image path
                    fit: BoxFit.cover, // Cover the entire screen
                  ),
                ),
              ),
            ),

            //* prayer times column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(40),
                //todo: date for this day
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 20),
                  child: Text(
                    "16 February, 2023 ",
                    style: AppFonts.get20Font(),
                  ),
                ),
                //todo: time now
                Padding(
                  padding: const EdgeInsets.only(top: 1, left: 20),
                  child: Text(
                    "06:00 Am",
                    style: AppFonts.get20Font(),
                  ),
                ),
                Gap(16),
                //todo: prayer times

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(
                      text: "Fajr",
                      time: "06:00",
                    ),
                    PrayerBox(
                      text: "Shuruk",
                      time: "07:18",
                    ),
                    PrayerBox(
                      text: "Dhuhr",
                      time: "06:00",
                    ),
                  ],
                ),
                Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(
                      text: "Asr",
                      time: "06:00",
                    ),
                    PrayerBox(
                      text: "Maghrib",
                      time: "06:00",
                    ),
                    PrayerBox(
                      text: "Isha",
                      time: "06:00",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.amber,
          backgroundColor: Colors.amber,
          unselectedItemColor: Colors.black12,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index; // Update the selected tab
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.calenderSvg,
                width: 24,
                color: Colors.amber,
              ), // Material icon
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Material icon
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Material icon
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Material icon
              label: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
