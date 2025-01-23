class CalculateReminingTime {
  static String calculateRemainingTime(DateTime prayerTime) {
    final now = DateTime.now();
    final difference = prayerTime.difference(now);

    if (difference.isNegative) {
      return "00:00:00"; // Prayer time has passed
    }

    // Format the remaining time as HH:mm:ss
    final hours = difference.inHours.toString().padLeft(2, '0');
    final minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds";
  }

  static DateTime getPrayerDateTime(DateTime now, DateTime prayerTime) {
    DateTime prayerDateTime = DateTime(
        now.year, now.month, now.day, prayerTime.hour, prayerTime.minute);

    // If the prayer time has already passed today, set it for the next day
    if (prayerDateTime.isBefore(now)) {
      prayerDateTime = prayerDateTime.add(Duration(days: 1));
    }

    return prayerDateTime;
  }
}
