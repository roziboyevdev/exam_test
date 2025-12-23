import 'package:exam_test/data/models/user/user_model.dart';
import 'package:exam_test/feature/auth/repository/auth_repository.dart';
import 'package:exam_test/feature/auth/repository/auth_repository_impl.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthRepository _repository = AuthRepositoryImpl();
  UserModel? user;

  Future<void> loginUser(String email, String password) async {
    final data = await _repository.loginUser(email, password);
    if (data == null) {
      return;
    }
    user = data;
    notifyListeners();
  }
}
