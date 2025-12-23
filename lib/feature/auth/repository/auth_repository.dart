import 'package:exam_test/data/models/user/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> loginUser(String email, String password);
}
