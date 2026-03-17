import 'package:flutter/material.dart';
import '../services/api_service.dart';

class WalletProvider with ChangeNotifier {

  int wallet = 0;
  bool isLoading = false;

  void setWallet(int amount){
    wallet = amount;
    notifyListeners();
  }

  // Deposit Request
  Future<void> deposit(int amount) async {

    isLoading = true;
    notifyListeners();

    try{
      await ApiService.deposit(amount);

    } catch(e){
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

  // Withdraw Request
  Future<void> withdraw(int amount) async {

    isLoading = true;
    notifyListeners();

    try{
      await ApiService.withdraw(amount);

    } catch(e){
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

  // Update wallet locally
  void addBalance(int amount){
    wallet += amount;
    notifyListeners();
  }

  void deductBalance(int amount){
    wallet -= amount;
    notifyListeners();
  }

}