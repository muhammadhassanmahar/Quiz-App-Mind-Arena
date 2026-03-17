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

    try{
      var res = await ApiService.getContests();

      contests = (res as List)
          .map((e) => ContestModel.fromJson(e))
          .toList();

    } catch(e){
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

  // Join contest
  Future<void> joinContest(String contestId) async {

    try{
      await ApiService.joinContest(contestId);
    } catch(e){
      print(e);
    }
  }

  // Load questions
  Future<void> loadQuestions(int contestType) async {

    isLoading = true;
    notifyListeners();

    try{
      var res = await ApiService.getQuestions(contestType);

      questions = (res as List)
          .map((e) => QuestionModel.fromJson(e))
          .toList();

    } catch(e){
      print(e);
    }

    isLoading = false;
    notifyListeners();
  }

}