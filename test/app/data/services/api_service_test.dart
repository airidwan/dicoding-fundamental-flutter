import 'package:flutter_test/flutter_test.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/data/services/api_services.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  const _restaurantId = 'rqdv5juczeskfw1e867';
  late MockApiServices apiServiceMock;

  setUp(() {
    apiServiceMock = MockApiServices();
  });

  group('test APi Service', () {
    test('return apiresult', () async {
      final apiResult = ApiresultModel<RestaurantModel>(error: false, count: 1, message: 'success', data: RestaurantModel(id: _restaurantId));
      when(apiServiceMock.getRestaurantDetailById(_restaurantId)).thenAnswer((_) async => await Future.value(apiResult));
      final _result = await apiServiceMock.getRestaurantDetailById(_restaurantId);
      expect(_result, isA<ApiresultModel<RestaurantModel>>());
      expect(_result.error, equals(_result.error));
    });
  });
}
