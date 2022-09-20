part of 'index.dart';

class ApiresultModel<T> {
  final bool error;
  final String message;
  final int count;
   T? data;
  ApiresultModel({
    this.error = false,
    this.message = '',
    this.count = 0,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'message': message,
      'count': count,
    };
  }

  factory ApiresultModel.fromMap(Map<String, dynamic> map) {
    return ApiresultModel<T>(
      error: map['error'] ?? false,
      message: map['message'] ?? '',
      count: map['count'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiresultModel.fromJson(String source) => ApiresultModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
