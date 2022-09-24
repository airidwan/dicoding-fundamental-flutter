import 'package:flutter_test/flutter_test.dart';
import 'package:submission_restaurantapp/app/utils/date_time_helper.dart';

void main() {
  test('test datetime helper', () async {
    final _now = DateTime.now();
    final _datetime = DateTime(_now.year, _now.month, _now.add(Duration(days: 1)).day, 11);
    expect(DateTimeHelper.format(), _datetime);
    expect(DateTimeHelper.format().hour, equals(11));
  });
}
