import 'package:flutter_test/flutter_test.dart';
import 'package:submission_restaurantapp/app/data/services/api_services.dart';

void main() {
  const _restaurantId = 'rqdv5juczeskfw1e867';
  const _restaurantName = 'Melting Pot';

  group('test APi Service', () {
    test('call restaurant list', () async {
      final _result = await ApiServices().fetchListRestaurantListAll();
      expect(_result.count > 0, true);
    });
    test('call restaurant detail', () async {
      final _result = await ApiServices().getRestaurantDetailById(_restaurantId);
      expect(_result.data!.id, _restaurantId);
    });
    test('call restaurant by Query', () async {
      final _result = await ApiServices().getRestaurantByQuery(_restaurantName);
      expect(_result.founded > 0, true);
    });
  });
}
