import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:prayer_schedule_app/components/app_fonts.dart';
import 'package:prayer_schedule_app/components/app_images.dart';
import 'package:prayer_schedule_app/components/prayer_calculate.dart';
import 'package:prayer_schedule_app/core/widgets/left_time.dart';
import 'package:prayer_schedule_app/core/widgets/prayer_box.dart';
import 'package:prayer_schedule_app/functions/calculate_remining_time.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? formattedDate;
  String? formattedTime;
  String? remainingTimeFajr;
  String? remainingTimeDhuhr;
  String? remainingTimeAsr;
  late Timer _timer;

  Map<String, String>? prayerTimes;

  @override
  void initState() {
    super.initState();
    _calculatePrayerTimes();
    _updateDateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _updateDateTime(); // Update every second
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer
    super.dispose();
  }

  // Method to calculate prayer times
  void _calculatePrayerTimes() {
    final times = PrayerTimeCalculator.getPrayerTimes();
    setState(() {
      prayerTimes = times;
    });
  }

  // Method to update the date and time
  void _updateDateTime() {
    final now = DateTime.now();

    setState(() {
      formattedDate = DateFormat('dd MMMM, yyyy').format(now); // Format date
      formattedTime = DateFormat('h:mm a').format(now); // Format time

      // Calculate remaining time for each prayer
      if (prayerTimes != null) {
        final fajrTime = DateFormat('h:mm a').parse(prayerTimes!['fajr']!);
        final dhuhrTime = DateFormat('h:mm a').parse(prayerTimes!['dhuhr']!);
        final asrTime = DateFormat('h:mm a').parse(prayerTimes!['asr']!);

        final fajrDateTime =
            CalculateReminingTime.getPrayerDateTime(now, fajrTime);
        final dhuhrDateTime =
            CalculateReminingTime.getPrayerDateTime(now, dhuhrTime);
        final asrDateTime =
            CalculateReminingTime.getPrayerDateTime(now, asrTime);

        remainingTimeFajr =
            CalculateReminingTime.calculateRemainingTime(fajrDateTime);
        remainingTimeDhuhr =
            CalculateReminingTime.calculateRemainingTime(dhuhrTime);
        remainingTimeAsr =
            CalculateReminingTime.calculateRemainingTime(asrTime);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                AppImages.fajr,
                fit: BoxFit.cover,
              ),
            ),

            // Main content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(40),
                // Date and time
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 20),
                  child: Text(
                    formattedDate ?? "Loading date...",
                    style: AppFonts.get20Font(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1, left: 20),
                  child: Text(
                    formattedTime ?? "Loading time...",
                    style: AppFonts.get20Font(),
                  ),
                ),
                const Gap(16),

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

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LeftTime(
                        prayerName: "Fajr",
                        padding: 10,
                        remainingTime: remainingTimeFajr ?? "00:00:00",
                      ),
                      Gap(15),
                      LeftTime(
                        prayerName: "Dhuhr",
                        padding: 10,
                        remainingTime: remainingTimeDhuhr ?? "00:00:00",
                      ),
                      Gap(10),
                      LeftTime(
                        prayerName: "Asr",
                        padding: 10,
                        remainingTime: remainingTimeAsr ?? "00:00:00",
                      ),
                      Gap(90),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
