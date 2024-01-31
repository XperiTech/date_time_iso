import 'package:date_time_iso/src/time.dart';

/// To keep days
class OverflowedTime extends Time {
  /// Initialize new `OverflowedTime` instance
  const OverflowedTime({
    required super.hour,
    required this.days,
    super.minute,
    super.second,
  });

  /// Days
  final int days;

  @override
  int get inMins => (days * 24 * 60) + (hour * 60) + minute;
}
