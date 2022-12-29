import 'package:date_time_iso/date_time_iso.dart';
import 'package:shouldly/shouldly.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('is a valid date range when end is after start', () {
    const range = DateRange(
      Date(year: 2021, month: 3, day: 3),
      Date(year: 2021, month: 5, day: 7),
    );

    expect(range.isValid, isTrue);
  });

  test('is not a valid date range when start is after end', () {
    const range = DateRange(
      Date(year: 2021, month: 5, day: 7),
      Date(year: 2021, month: 3, day: 3),
    );

    expect(range.isValid, isFalse);
  });

  test('treats two date ranges with equal start and end dates as equal', () {
    const dateRange1 = DateRange(
      Date(year: 2021, month: 3, day: 3),
      Date(year: 2021, month: 5, day: 7),
    );
    const dateRange2 = DateRange(
      Date(year: 2021, month: 3, day: 3),
      Date(year: 2021, month: 5, day: 7),
    );

    dateRange2.should.be(dateRange1);
  });

  test('computes difference between start and end', () {
    const range = DateRange(
      Date(year: 2021, month: 3, day: 3),
      Date(year: 2021, month: 3, day: 7),
    );

    expect(range.duration.inDays, equals(4));
  });
}
