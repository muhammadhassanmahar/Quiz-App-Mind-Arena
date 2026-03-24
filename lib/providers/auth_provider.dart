import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel? user;
  bool isLoading = false;

  /// Login function that connects to backend via ApiService
  Future<bool> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.login(email, password);

      if (response["status"] == "success" && response["user"] != null) {
        user = UserModel.fromJson(response["user"]);

        isLoading = false;
        notifyListeners();
        return true;
      } else {
        debugPrint("Login failed: ${response["message"] ?? "Unknown error"}");
      }
    } catch (e) {
      debugPrint("Login Exception: $e");
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  /// Logout the user
  void logout() {
    user = null;
    notifyListeners();
  }

  /// Check if current user is admin
  bool get isAdmin => user?.role == "admin";
}