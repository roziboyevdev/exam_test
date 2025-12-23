import 'dart:convert';
import 'dart:developer';
import 'package:exam_test/core/service/service.dart';
import 'package:exam_test/data/models/user/user_model.dart';
import 'package:exam_test/feature/auth/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<UserModel?> loginUser(String email, String password) async {
    final data = await Network.request(
      api:
          "https://693a9c539b80ba7262ca9990.mockapi.io/weatherapp/users?email=$email&password=$password",
      method: .get,
    );

    if (data == null || data.isEmpty) {
      return null;
    }

    log(data);
    final json = jsonDecode(data);
    return UserModel.fromJson(json[0]);
  }
}
