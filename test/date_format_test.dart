import 'package:date_time_iso/date_time_iso.dart';
import 'package:intl/intl.dart';
import 'package:shouldly/shouldly.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('format date', () {
    const date = Date(year: 2022);
    DateFormat('yyyy-MM-dd').formatDate(date).should.be('2022-01-01');
  });
}
