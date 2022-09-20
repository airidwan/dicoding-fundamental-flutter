import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:submission_restaurantapp/app/data/constants/api_keys.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';

class ApiServices {
  ApiServices._();
  factory ApiServices() => ApiServices._();

  static ApiServices get i => ApiServices._();

  Dio get _dio => Dio()
    ..options.baseUrl = ApiKeys.baseUrl
    ..options.connectTimeout = 25000
    ..interceptors.add(PrettyDioLogger());

  String globalErrorMessage = 'Gagal/Error mendapatkan data';

  Future<ApiresultModel<List<RestaurantModel>>> fetchListRestaurantListAll() async {
    try {
      final _res = await _dio.get(ApiKeys.restaurantList);
      var _result = ApiresultModel<List<RestaurantModel>>.fromMap(_res.data);
      if (_res.statusCode == 200) {
        _result.data = (_res.data['restaurants'] as List).map((e) => RestaurantModel.fromMap(e)).toList();
      }
      return _result;
    } catch (e) {
      return throw Exception(globalErrorMessage);
    }
  }

  Future<ApiresultModel<RestaurantModel>> getRestaurantDetailById(String id) async {
    try {
      final _res = await _dio.get('${ApiKeys.restaurantDetail}/$id');
      var _result = ApiresultModel<RestaurantModel>.fromMap(_res.data);
      if (_res.statusCode == 200) {
        _result.data = RestaurantModel.fromMap(_res.data['restaurant']);
      }
      return _result;
    } catch (e) {
      return throw Exception(globalErrorMessage);
    }
  }

  Future<ApiresultModel<List<RestaurantModel>>> getRestaurantByQuery(String query) async {
    try {
      final _res = await _dio.get('${ApiKeys.restaurantSearch}', queryParameters: {'q': query});
      var _result = ApiresultModel<List<RestaurantModel>>.fromMap(_res.data);
      if (_res.statusCode == 200) {
        _result.data = (_res.data['restaurants'] as List).map((e) => RestaurantModel.fromMap(e)).toList();
      }
      return _result;
    } catch (e) {
      return throw Exception(globalErrorMessage);
    }
  }

  Future<ApiresultModel<List<CustomerReviewsModel>>> addRestaurantReview({String id = '', String name = '', String review = ''}) async {
    final _body = {"id": id, "name": name, "review": review};
    try {
      final _res = await _dio.post('${ApiKeys.restaurantReview}', data: _body);
      var _result = ApiresultModel<List<CustomerReviewsModel>>.fromMap(_res.data);
      if (_res.statusCode == 201) {
        _result.data = (_res.data['customerReviews'] as List).map((e) => CustomerReviewsModel.fromMap(e)).toList();
      }
      return _result;
    } catch (e) {
      return throw Exception(globalErrorMessage);
    }
  }

  List<RestaurantModel> getRestaurantByRandomList(List<RestaurantModel> data) {
    if (data.isEmpty) return <RestaurantModel>[];
    Random random = Random();
    final _count = Random().nextInt((data.length / 2.5).floor());
    final _list = List.generate(_count, (index) => data[random.nextInt(data.length)]);
    return _list;
  }

  RestaurantModel? getRestaurantByRandom(List<RestaurantModel> data) {
    if (data.isEmpty) return null;
    return data[Random().nextInt(data.length)];
  }
}
