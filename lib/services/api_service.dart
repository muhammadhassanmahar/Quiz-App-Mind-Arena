import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  /// ⚠️ Replace this with your actual backend URL
  static String baseUrl = "https://your-backend-url";

  // ================= LOGIN =================
  static Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return {"status": "error", "message": "Invalid response from server"};
      }
    } catch (e) {
      return {"status": "error", "message": "Login failed: $e"};
    }
  }

  // ================= DEPOSIT =================
  static Future<Map<String, dynamic>> deposit(int amount) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/deposit"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"amount": amount}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return {"status": "error", "message": "Invalid response from server"};
      }
    } catch (e) {
      return {"status": "error", "message": "Deposit failed: $e"};
    }
  }

  // ================= WITHDRAW =================
  static Future<Map<String, dynamic>> withdraw(int amount) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/withdraw"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"amount": amount}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return {"status": "error", "message": "Invalid response from server"};
      }
    } catch (e) {
      return {"status": "error", "message": "Withdraw failed: $e"};
    }
  }

  // ================= GET CONTESTS =================
  static Future<List<dynamic>> getContests() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/contests"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // ================= JOIN CONTEST =================
  static Future<Map<String, dynamic>> joinContest(String contestId) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/join-contest"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"contest_id": contestId}),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return {"status": "error", "message": "Invalid response from server"};
      }
    } catch (e) {
      return {"status": "error", "message": "Join contest failed: $e"};
    }
  }

  // ================= GET QUESTIONS =================
  static Future<List<dynamic>> getQuestions(int contestType) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/questions/$contestType"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}