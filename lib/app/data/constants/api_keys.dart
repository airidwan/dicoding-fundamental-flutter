class ApiKeys {
  static const String baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String restaurantList = '/list';
  static const String restaurantDetail = '/detail/';
  static const String restaurantSearch = '/search';
  static const String restaurantReview = '/review';

  static String urlImageMedium(String id) => '$baseUrl/images/medium/$id';
  static String urlImageLarge(String id) => '$baseUrl/images/large/$id';
  static String urlImageSmall(String id) => '$baseUrl/images/large/$id';
}
