import 'package:flutter/cupertino.dart';
import 'package:macro_calculator/utils/enums.dart';

class DataController extends ChangeNotifier {
  Gender gender = Gender.male;
  double height = 170;
  double weight = 70;
  int age = 25;

  ActivityLevel activityLevel = ActivityLevel.moderately;
  Goal goal = Goal.loose;

  void setGender(Gender gender) {
    this.gender = gender;
    notifyListeners();
  }

  void setHeight(double height) {
    this.height = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    this.weight = weight;
    notifyListeners();
  }

  void setAge(int age) {
    this.age = age;
    notifyListeners();
  }

  void setActivityLevel(ActivityLevel activityLevel) {
    this.activityLevel = activityLevel;
    notifyListeners();
  }

  void setGoal(Goal goal) {
    this.goal = goal;
    notifyListeners();
  }
}
