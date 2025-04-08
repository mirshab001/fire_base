import 'package:firebase_sample/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';

class AuthController extends ChangeNotifier {
  var authService = AuthService();
  UserModel? user;
  bool isLoading = false;

  AuthController() {
    fetchUser();
  }

  //fetch user data

  Future<void> fetchUser() async {
    try {
      String? uid = await authService.getCurrentUserId();
      if (uid != null) {
        user = await authService.fetchUser(uid);
      }
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  //sign up user
  Future<void> signUp(
      String name, String email, String phone, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await authService.signUp(name, email, phone, password);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // log in
  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      String? uid = await authService.login(email, password);
      if (uid != null) {
        user = await authService.fetchUser(uid);
        print(uid);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //log out
  Future<void> logOut() async {
    try {
      await authService.logOut();
      user = null;
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }
}
