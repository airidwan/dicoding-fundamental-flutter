import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:submission_restaurantapp/app/data/constants/api_keys.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/data/services/api_services.dart';

import 'test_constant.dart';

void main() {
  late Dio _dio;
  late DioAdapter _dioAdapter;
  const _restaurantId = 'rqdv5juczeskfw1e867';

  setUp(() {
    _dio = Dio()
      ..options.baseUrl = ApiKeys.baseUrl
      ..options.connectTimeout = 25000
      ..interceptors.add(LogInterceptor());
    _dioAdapter = DioAdapter(
      dio: _dio,
      matcher: const FullHttpRequestMatcher(),
    );
  });

  group('test APi Service', () {
    test(
      'Get restaurant detail by Id',
      () async {
        _dioAdapter.onGet(
          '${ApiKeys.restaurantDetail}/$_restaurantId',
          (server) {
            return server.reply(
              200,
              fakeResDetail,
              delay: Duration(seconds: 1),
            );
          },
        );

        final _res = await ApiServices().init(dio: _dio).getRestaurantDetailById(_restaurantId);
        var _fakeResDetail = ApiresultModel<RestaurantModel>.fromMap(fakeResDetail)..data = RestaurantModel.fromMap(fakeResDetail['restaurant']);

        expect(_res, isA<ApiresultModel<RestaurantModel>>());
        expect(_res.data!.id, equals(_fakeResDetail.data!.id));
      },
    );
  });
}
