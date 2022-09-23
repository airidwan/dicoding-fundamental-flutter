// Mocks generated by Mockito 5.3.2 from annotations
// in submission_restaurantapp/test/app/data/services/api_service_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:typed_data' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:submission_restaurantapp/app/data/model/index.dart' as _i2;
import 'package:submission_restaurantapp/app/data/services/api_services.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeApiresultModel_0<T> extends _i1.SmartFake
    implements _i2.ApiresultModel<T> {
  _FakeApiresultModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ApiServices].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiServices extends _i1.Mock implements _i3.ApiServices {
  MockApiServices() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get globalErrorMessage => (super.noSuchMethod(
        Invocation.getter(#globalErrorMessage),
        returnValue: '',
      ) as String);
  @override
  set globalErrorMessage(String? _globalErrorMessage) => super.noSuchMethod(
        Invocation.setter(
          #globalErrorMessage,
          _globalErrorMessage,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Future<_i2.ApiresultModel<List<_i2.RestaurantModel>>>
      fetchListRestaurantListAll() => (super.noSuchMethod(
            Invocation.method(
              #fetchListRestaurantListAll,
              [],
            ),
            returnValue:
                _i4.Future<_i2.ApiresultModel<List<_i2.RestaurantModel>>>.value(
                    _FakeApiresultModel_0<List<_i2.RestaurantModel>>(
              this,
              Invocation.method(
                #fetchListRestaurantListAll,
                [],
              ),
            )),
          ) as _i4.Future<_i2.ApiresultModel<List<_i2.RestaurantModel>>>);
  @override
  _i4.Future<_i2.ApiresultModel<_i2.RestaurantModel>> getRestaurantDetailById(
          String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurantDetailById,
          [id],
        ),
        returnValue: _i4.Future<_i2.ApiresultModel<_i2.RestaurantModel>>.value(
            _FakeApiresultModel_0<_i2.RestaurantModel>(
          this,
          Invocation.method(
            #getRestaurantDetailById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.ApiresultModel<_i2.RestaurantModel>>);
  @override
  _i4.Future<_i2.ApiresultModel<List<_i2.RestaurantModel>>>
      getRestaurantByQuery(String? query) => (super.noSuchMethod(
            Invocation.method(
              #getRestaurantByQuery,
              [query],
            ),
            returnValue:
                _i4.Future<_i2.ApiresultModel<List<_i2.RestaurantModel>>>.value(
                    _FakeApiresultModel_0<List<_i2.RestaurantModel>>(
              this,
              Invocation.method(
                #getRestaurantByQuery,
                [query],
              ),
            )),
          ) as _i4.Future<_i2.ApiresultModel<List<_i2.RestaurantModel>>>);
  @override
  _i4.Future<_i2.ApiresultModel<List<_i2.CustomerReviewsModel>>>
      addRestaurantReview({
    String? id = r'',
    String? name = r'',
    String? review = r'',
  }) =>
          (super.noSuchMethod(
            Invocation.method(
              #addRestaurantReview,
              [],
              {
                #id: id,
                #name: name,
                #review: review,
              },
            ),
            returnValue: _i4.Future<
                    _i2.ApiresultModel<List<_i2.CustomerReviewsModel>>>.value(
                _FakeApiresultModel_0<List<_i2.CustomerReviewsModel>>(
              this,
              Invocation.method(
                #addRestaurantReview,
                [],
                {
                  #id: id,
                  #name: name,
                  #review: review,
                },
              ),
            )),
          ) as _i4.Future<_i2.ApiresultModel<List<_i2.CustomerReviewsModel>>>);
  @override
  List<_i2.RestaurantModel> getRestaurantByRandomList(
          List<_i2.RestaurantModel>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurantByRandomList,
          [data],
        ),
        returnValue: <_i2.RestaurantModel>[],
      ) as List<_i2.RestaurantModel>);
  @override
  _i4.Future<_i2.RestaurantModel?> getRestaurantByRandom(
          List<_i2.RestaurantModel>? data) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurantByRandom,
          [data],
        ),
        returnValue: _i4.Future<_i2.RestaurantModel?>.value(),
      ) as _i4.Future<_i2.RestaurantModel?>);
  @override
  _i4.Future<_i5.Uint8List> getImageByUrl(String? url) => (super.noSuchMethod(
        Invocation.method(
          #getImageByUrl,
          [url],
        ),
        returnValue: _i4.Future<_i5.Uint8List>.value(_i5.Uint8List(0)),
      ) as _i4.Future<_i5.Uint8List>);
}