import 'package:exam_test/feature/auth/repository/auth_repository.dart';
import 'package:exam_test/feature/auth/repository/auth_repository_impl.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  AuthRepository _repository = AuthRepositoryImpl();
  List? points;

  Future<void> loginUser(String email, String password) async {
    final data = await _repository.loginUser(email, password);
    if (data == null) {
      return;
    }
    points = data.points;
    notifyListeners();
  }
}
