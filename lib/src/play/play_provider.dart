import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'package:flutter_calc_game/src/play/model/calc_model.dart';


class PlayProvider extends ChangeNotifier {
  static final Logger _log = Logger('PlayService');

  late int selectedRange = 10;
  int get getSelectedRange => selectedRange;
  set setSelectedRange(int _selectedRange) {
    selectedRange = _selectedRange;
    notifyListeners();
  }

  late int selectedCalcModelIdx = -1;
  int get getSelectedCalcModelIdx => selectedCalcModelIdx;
  set setSelectedCalcModelIdx(int _selectedCalcModel) {
    selectedCalcModelIdx = _selectedCalcModel;
    notifyListeners();
  }

  late int result = 0;
  int get getResult => result;
  set setResult(int _result) {
    result = _result;
    notifyListeners();
  }

  late String questionStr = '';
  String get getQuestionStr => questionStr;
  set setQuestionStr(String _questionStr) {
    questionStr = _questionStr;
    notifyListeners();
  }

  late List<int> questionList = [0,0,0,0];
  List<int> get getQuestionList => questionList;
  set setQuestionList(List<int> _questionList) {
    questionList = _questionList;
    notifyListeners();
  }

  late int correctCnt = 0;
  int get getCorrectCnt => correctCnt;
  set setCorrectCnt(int _correctCnt) {
    correctCnt = _correctCnt;
    notifyListeners();
  }

  late int worngCnt = 0;
  int get getWorngCnt => worngCnt;
  set setWorngCnt(int _worngCnt) {
    worngCnt = _worngCnt;
    notifyListeners();
  }


  final List<CalcModel> calcModel = [
    CalcModel("plus"     , "\u002B", (a, b) => a + b),
    CalcModel("minus"    , "\u2212", (a, b) => a - b),
    CalcModel("multiply" , "\u00D7", (a, b) => a * b),
    CalcModel("divide"   , "\u00F7", (a, b) => a ~/ b),
  ];
  List<CalcModel> get getCalcModel => calcModel;

  void init() {
    setSelectedRange = 10;
    setCorrectCnt    = 0;
    setWorngCnt      = 0;
    setQuestionList  = [];
    setQuestionStr   = '';
    notifyListeners();
  }

  void createQuestion() {
    int first  = Random().nextInt(getSelectedRange) + 1;
    int second = Random().nextInt(getSelectedRange) + 1;
    setResult = getCalcModel[getSelectedCalcModelIdx].fn(first, second);
    setQuestionList = [];
    setQuestionList = [getResult-2, getResult, getResult+1, getResult+3];
    questionList.shuffle();
    setQuestionStr = '${first} ${getCalcModel[getSelectedCalcModelIdx].label} ${second} = ?';
  }

}