import 'package:date_time_iso/date_time_iso.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('calculate mins', () {
    const overflowedTime = OverflowedTime(hour: 1, days: 1);
    overflowedTime.inMins.should.be(25 * 60);
  });

  given('minutes of two days', () {
    const mins = 23 * 60;

    when('convert to Time', () {
      late Time time;

      before(() {
        time = Time.fromMinutes(mins);
      });

      then('time should be type of Time', () {
        time.should.beOfType<Time>();
      });

      then('start should be right', () {
        time.hour.should.be(23);
      });
    });
  });

  given('minutes of two days', () {
    const mins = 1500;

    when('convert to Time', () {
      late Time time;

      before(() {
        time = Time.fromMinutes(mins);
      });

      then('time should be oveflowed', () {
        time.should.beOfType<OverflowedTime>();
      });

      then('start should be right', () {
        time.hour.should.be(1);
      });
    });
  });
}
