import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/error_hanlder.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //register user /  sign up

  Future<UserModel?> signUp(
      String name, String email, String phone, String password) async {
    try {
      UserCredential userCard = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User? appUser = userCard.user;
      if (appUser != null) {
        UserModel newUser =
            UserModel(uid: appUser.uid, name: name, email: email, phone: phone);

        //store the user id in shared prefs
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("userId", appUser.uid);
        return newUser;
      }
      return null;
    } catch (e) {
      throw ErrorHandler.handleFirebaseAuthError(e.toString());
    }
  }

  // login the user
  Future<String?> login(String email, String password) async {
    try {
      var userCred = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? appUser = userCred.user;

      if (appUser != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("userId", appUser.uid);
        return "";
      }
    } catch (e) {
      throw ErrorHandler.handleFirebaseAuthError(e.toString());
    }
  }

  //method to log out

  Future<void> logOut() async {
    try {
      await auth.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove("userId");
    } catch (e) {
      throw ErrorHandler.handleFirebaseAuthError(e.toString());
    }
  }

  //get currently logged in user's id

  Future<String?> getCurrentUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("userId");
  }

// fectch current user

  Future<UserModel?> fetchUser(String uid) async {
    try {
      var userDoc = await db.collection("users").doc(uid).get();
      if (userDoc.exists) {
        return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      throw ErrorHandler.handleFirebaseAuthError(e.toString());
    }
  }
}
