import 'package:flutter_test/flutter_test.dart';
import 'package:submission_restaurantapp/app/utils/date_time_helper.dart';

void main() {
  test('test datetime return jam 11', () async {
    final _now = DateTime.now();
    expect(DateTimeHelper.format(_now).hour, equals(11));
  });
}
