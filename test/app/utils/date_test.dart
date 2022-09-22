import 'package:flutter_test/flutter_test.dart';
import 'package:submission_restaurantapp/app/utils/date_time_helper.dart';

void main() {
  test('test datetime helper', () async {
    final _datetime = DateTime(2022, 9, DateTime.now().add(Duration(days: 1)).day, 11, 00);
    expect(DateTimeHelper.format(), _datetime);
  });
}
