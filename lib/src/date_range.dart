import 'package:date_time_iso/src/date.dart';

///
class DateRange {
  /// Initialize `DateRange`
  const DateRange(this.start, this.end);

  final Date start;
  final Date end;

  /// Returns whether or not [start] is before [end].
  bool get isValid => start <= end;

  /// Difference between [start] and [end]
  Duration get duration => end.asDateTime.difference(start.asDateTime);

  /// Returns whether or not [date] is contained in this range.
  bool contains(Date date) =>
      start.isSameOrBefore(date) && date.isSameOrBefore(end);

  @override
  bool operator ==(Object other) =>
      other is DateRange && other.start == start && other.end == end;

  @override
  int get hashCode => Object.hash(
        start.hashCode,
        end.hashCode,
      );

  @override
  String toString() => '$start - $end';
}
