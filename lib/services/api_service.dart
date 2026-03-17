import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  // ⚠️ apna backend URL yahan lagana
  static String baseUrl = "https://your-backend-url";

  // ================= LOGIN =================
  static Future<dynamic> login(String email, String password) async {

    try {
      var response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password
        }),
      );

      return jsonDecode(response.body);

    } catch (e) {
      print("Login Error: $e");
      return {"status": "error"};
    }
  }

  // ================= DEPOSIT =================
  static Future<dynamic> deposit(int amount) async {

    try {
      var response = await http.post(
        Uri.parse("$baseUrl/deposit"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "amount": amount
        }),
      );

      return jsonDecode(response.body);

    } catch (e) {
      print("Deposit Error: $e");
    }
  }

  // ================= WITHDRAW =================
  static Future<dynamic> withdraw(int amount) async {

    try {
      var response = await http.post(
        Uri.parse("$baseUrl/withdraw"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "amount": amount
        }),
      );

      return jsonDecode(response.body);

    } catch (e) {
      print("Withdraw Error: $e");
    }
  }

  // ================= GET CONTESTS =================
  static Future<List<dynamic>> getContests() async {

    try {
      var response = await http.get(
        Uri.parse("$baseUrl/contests"),
      );

      return jsonDecode(response.body);

    } catch (e) {
      print("Contest Error: $e");
      return [];
    }
  }

  // ================= JOIN CONTEST =================
  static Future<dynamic> joinContest(String contestId) async {

    try {
      var response = await http.post(
        Uri.parse("$baseUrl/join-contest"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contest_id": contestId
        }),
      );

      return jsonDecode(response.body);

    } catch (e) {
      print("Join Error: $e");
    }
  }

  // ================= GET QUESTIONS =================
  static Future<List<dynamic>> getQuestions(int contestType) async {

    try {
      var response = await http.get(
        Uri.parse("$baseUrl/questions/$contestType"),
      );

      return jsonDecode(response.body);

    } catch (e) {
      print("Questions Error: $e");
      return [];
    }
  }

}