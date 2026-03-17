import 'package:flutter/material.dart';
import '../models/contest_model.dart';
import '../models/question_model.dart';
import '../services/api_service.dart';

class ContestProvider with ChangeNotifier {
  List<ContestModel> contests = [];
  List<QuestionModel> questions = [];

  bool isLoading = false;

  // Load contests
  Future<void> loadContests() async {
    isLoading = true;
    notifyListeners();

    try {
      final res = await ApiService.getContests();

      contests = List<ContestModel>.from(
        res.map((e) => ContestModel.fromJson(e)),
      );
    } catch (e) {
      debugPrint('Error loading contests: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  // Join contest
  Future<void> joinContest(String contestId) async {
    try {
      await ApiService.joinContest(contestId);
    } catch (e) {
      debugPrint('Error joining contest: $e');
    }
  }

  // Load questions
  Future<void> loadQuestions(int contestType) async {
    isLoading = true;
    notifyListeners();

    try {
      final res = await ApiService.getQuestions(contestType);

      questions = List<QuestionModel>.from(
        res.map((e) => QuestionModel.fromJson(e)),
      );
    } catch (e) {
      debugPrint('Error loading questions: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}