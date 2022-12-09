import 'package:dio/dio.dart';
import 'package:example_1/models/user.dart';

class UserAPI {
  UserAPI._internal();
  static final UserAPI _instance = UserAPI._internal();
  static UserAPI get instance => _instance;

  final _dio = Dio();

  Future<List<User>?> getUsers(int page) async {
    try {
      final Response response = await _dio.get(
        'https://reqres.in/api/users',
        queryParameters: {
          "page": page,
          "delay": 3,
        },
      );

      return (response.data['data'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
