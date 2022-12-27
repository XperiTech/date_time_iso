import 'package:date_time_iso/date_time_iso.dart';
import 'package:shouldly/shouldly.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Message', () {
    final error = DateTimeError('some error');
    error.message.should.be('some error');
  });
}
