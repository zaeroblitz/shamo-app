import 'package:flutter/cupertino.dart';
import 'package:shamo/models/UserModel.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().regiser(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
