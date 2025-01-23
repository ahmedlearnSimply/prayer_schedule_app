// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/components/prayer_calculate.dart';
import 'package:prayer_schedule_app/core/widgets/left_time.dart';
import 'package:prayer_schedule_app/core/widgets/prayer_box.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _HomePageState();
}

class _HomePageState extends State<CalenderPage> {
  Map<String, String>? prayerTimes;
  @override
  void initState() {
    super.initState();
    _calculatePrayerTimes();
  }

  // Method to calculate prayer times
  void _calculatePrayerTimes() {
    final times = PrayerTimeCalculator.getPrayerTimes();
    setState(() {
      prayerTimes = times;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use SafeArea to avoid system UI overlaps
      body: SafeArea(
        child: Stack(
          children: [
            // Background image (takes up the entire screen)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        AppImages.fajr), // Replace with your image path
                    fit: BoxFit.cover, // Cover the entire screen
                  ),
                ),
              ),
            ),

            // Main content column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(90),

                // Prayer times - First row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(
                        text: "Fajr", time: prayerTimes!['fajr'] ?? '/na'),
                    PrayerBox(
                        text: "Shuruk", time: prayerTimes!['shuruk'] ?? '/na'),
                    PrayerBox(
                        text: "Dhuhr", time: prayerTimes!['dhuhr'] ?? '/na'),
                  ],
                ),
                const Gap(30),

                // Prayer times - Second row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PrayerBox(text: "Asr", time: prayerTimes!['asr'] ?? '/na'),
                    PrayerBox(
                        text: "Maghrib",
                        time: prayerTimes!['maghrib'] ?? '/na'),
                    PrayerBox(
                        text: "Isha", time: prayerTimes!['isha'] ?? '/na'),
                  ],
                ),
                Gap(10),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            // gradient: LinearGradient(
                            //   colors: [
                            //     Colors.black,
                            //     Colors.grey,
                            //   ],
                            // ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width: 350,
                            height: 300,
                            child: DaysPicker(
                              currentDateDecoration: const BoxDecoration(),
                              currentDateTextStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              daysOfTheWeekTextStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              disabledCellsDecoration: const BoxDecoration(),
                              disabledCellsTextStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              enabledCellsDecoration: const BoxDecoration(),
                              enabledCellsTextStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              selectedCellTextStyle: const TextStyle(),
                              leadingDateTextStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              slidersColor: Colors.white,
                              highlightColor: Colors.redAccent,
                              slidersSize: 20,
                              splashColor: Colors.lightBlueAccent,
                              splashRadius: 40,
                              centerLeadingDate: true,
                              minDate: DateTime(202, 1, 1),
                              maxDate: DateTime(2023, 12, 31),
                              // currentDate: DateTime.now(),
                              // selectedDate: DateTime.now(),
                              onDateSelected: (value) {
                                // Handle selected date
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // Bottom navigation bar (sits on top of the background)
    );
  }
}
