import 'package:flutter/material.dart';
import '../services/api_service.dart';

class WalletProvider with ChangeNotifier {
  int wallet = 0;
  bool isLoading = false;

  /// Set wallet amount directly
  void setWallet(int amount) {
    wallet = amount;
    notifyListeners();
  }

  /// Send a deposit request to backend
  Future<bool> deposit(int amount) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.deposit(amount);
      if (response["status"] == "success") {
        wallet += amount; // Update local wallet on success
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        debugPrint("Deposit failed: ${response["message"]}");
      }
    } catch (e) {
      debugPrint("Deposit Error: $e");
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  /// Send a withdraw request to backend
  Future<bool> withdraw(int amount) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.withdraw(amount);
      if (response["status"] == "success") {
        wallet -= amount; // Update local wallet on success
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        debugPrint("Withdraw failed: ${response["message"]}");
      }
    } catch (e) {
      debugPrint("Withdraw Error: $e");
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  /// Add balance locally without backend (optional)
  void addBalance(int amount) {
    wallet += amount;
    notifyListeners();
  }

  /// Deduct balance locally without backend (optional)
  void deductBalance(int amount) {
    wallet -= amount;
    notifyListeners();
  }
}