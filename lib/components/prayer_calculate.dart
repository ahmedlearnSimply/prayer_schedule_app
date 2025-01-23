import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class PrayerTimeCalculator {
  // Calculate prayer times for a specific date and location
  static Map<String, String> getPrayerTimes() {
    // Define coordinates (latitude and longitude)
    final coordinates = Coordinates(30.0444, 31.2357);
// Replace with user's location

    // Define calculation parameters (e.g., Muslim World League)
    final params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.hanafi; // Optional: Set madhab (e.g., Hanafi)

    // Get prayer times for today
    final prayerTimes = PrayerTimes.today(coordinates, params);

    // Format prayer times as a map
    return {
      'fajr': _formatTime(prayerTimes.fajr!),
      'shuruk': _formatTime(prayerTimes.sunrise!),
      'dhuhr': _formatTime(prayerTimes.dhuhr!),
      'asr': _formatTime(prayerTimes.asr!),
      'maghrib': _formatTime(prayerTimes.maghrib!),
      'isha': _formatTime(prayerTimes.isha!),
    };
  }

  // Helper method to format DateTime as a readable time string
  // static String _formatTime(DateTime dateTime) {
  //   return '${dateTime.hour}:${dateTime.minute.toString()}';
  // }
  static String _formatTime(DateTime dateTime) {
    final format = DateFormat('h:mm a'); // 12-hour format with AM/PM
    return format.format(dateTime);
  }
}
