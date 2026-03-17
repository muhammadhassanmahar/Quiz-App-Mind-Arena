import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {

  UserModel? user;
  bool isLoading = false;

  // Login function
  Future<bool> login(String email, String password) async {

    isLoading = true;
    notifyListeners();

    try {
      var response = await ApiService.login(email, password);

      if(response["status"] == "success"){

        user = UserModel.fromJson(response["user"]);

        isLoading = false;
        notifyListeners();

        return true;
      }

    } catch(e){
      print(e);
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  // Logout
  void logout(){
    user = null;
    notifyListeners();
  }

  bool get isAdmin => user?.role == "admin";

}