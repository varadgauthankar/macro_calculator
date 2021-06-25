import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:macro_calculator/utils/enums.dart';

class DataController extends ChangeNotifier {
  Gender gender;
  double height;
  double weight;
  int age;

  ActivityLevel activityLevel;
  Goal goal;

  Box box = Hive.box('data');

  DataController() {
    this.gender = Gender.values[box.get('gender') ?? 0];
    this.height = box.get('height') ?? 170;
    this.weight = box.get('weight') ?? 70;
    this.age = box.get('age') ?? 25;
    this.activityLevel = ActivityLevel.values[box.get('activityLevel') ?? 2];
    this.goal = Goal.values[box.get('goal') ?? 0];
  }

  void setGender(Gender gender) async {
    this.gender = gender;
    box.put('gender', gender.index);
    notifyListeners();
  }

  void setHeight(double height) {
    this.height = height;
    box.put('height', height);
    notifyListeners();
  }

  void setWeight(double weight) {
    this.weight = weight;
    box.put('weight', weight);
    notifyListeners();
  }

  void setAge(int age) {
    this.age = age;
    box.put('age', age);
    notifyListeners();
  }

  void setActivityLevel(ActivityLevel activityLevel) {
    this.activityLevel = activityLevel;
    box.put('activityLevel', activityLevel.index);
    notifyListeners();
  }

  void setGoal(Goal goal) {
    this.goal = goal;
    box.put('goal', goal.index);

    notifyListeners();
  }
}
