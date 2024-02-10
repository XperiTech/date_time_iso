import 'package:date_time_iso/src/date.dart';

///
class DateRange with Iterable<Date> implements Iterator<Date> {
  /// Creates a date range based on dates from [start] to [end] (inclusive).
  DateRange(
    this.start,
    this.end, {
    this.step = const Duration(days: 1),
  }) : assert(step.inDays > 0, 'Step must be at least a day');

  final Date start;

  /// End of the range, inclusive
  final Date end;

  /// Since the smallest step possible for a date is a day,
  /// the [step] parameter is required to be at least a day.
  final Duration step;

  Date? _current;
  var _exhausted = false;

  @override
  Date get current => _current!;

  @override
  bool moveNext() {
    if (_exhausted) {
      return false;
    }

    if (_current == null) {
      _current = start;
    } else {
      _current = _current!.add(step);
    }

    _exhausted = _current!.isAfter(end);
    return !_exhausted;
  }

  @override
  Iterator<Date> get iterator => DateRange(start, end, step: step);

  /// Returns whether or not [start] is before [end].
  bool get isValid => start <= end;

  /// Difference between [start] and [end]
  Duration get duration => end.asDateTime.difference(start.asDateTime);

  /// Returns whether or not [object] is contained in this range.
  @override
  bool contains(Object? object) =>
      object is Date &&
      start.isSameOrBefore(object) &&
      object.isSameOrBefore(end);

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
