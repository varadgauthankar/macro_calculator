import 'dart:math';
import 'package:macro_calculator/utils/enums.dart';

class CalculatorBrain {
  CalculatorBrain({this.weight, this.height, this.age});
  final double weight;
  final double height;
  final double age;

  double bmi() {
    return (weight / pow(height / 100, 2));
  }

  double bmr() {
    if (selectedGender == Gender.male) {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double tdee() {
    if (selectedActivityLevel == ActivityLevel.sedentary)
      return bmr() * 1.2;
    else if (selectedActivityLevel == ActivityLevel.lightlyActive)
      return bmr() * 1.375;
    else if (selectedActivityLevel == ActivityLevel.moderatelyActive)
      return bmr() * 1.55;
    else if (selectedActivityLevel == ActivityLevel.veryActive)
      return bmr() * 1.725;
    else if (selectedActivityLevel == ActivityLevel.extremlyActive)
      return bmr() * 1.9;
    else
      return null;
  }

  double totalCalories() {
    if (selectedGoal == Goal.looseWeight) {
      return (tdee() - 500);
    } else if (selectedGoal == Goal.maintainWeight) {
      return tdee();
    } else if (selectedGoal == Goal.gainWeight) {
      return tdee() + 400;
    } else
      return null;
  }

  //protein
  double protein() {
    if (selectedGoal == Goal.looseWeight) {
      return loPro() / 4;
    } else if (selectedGoal == Goal.maintainWeight) {
      return mnPro() / 4;
    } else if (selectedGoal == Goal.gainWeight) {
      return gnPro() / 4;
    }
    return null;
  }

  //fats
  double fat() {
    if (selectedGoal == Goal.looseWeight) {
      return loFat() / 9;
    } else if (selectedGoal == Goal.maintainWeight) {
      return mnFat() / 9;
    } else if (selectedGoal == Goal.gainWeight) {
      return gnFat() / 9;
    }
    return null;
  }

  //carbs
  double carb() {
    if (selectedGoal == Goal.looseWeight) {
      return loCarb() / 4;
    } else if (selectedGoal == Goal.maintainWeight) {
      return mnCarb() / 4;
    } else if (selectedGoal == Goal.gainWeight) {
      return gnCarb() / 4;
    }
    return null;
  }

  // loose weight
  double loPro() {
    return (1.1 * (weight * 2.2)) * 4;
  }

  double loFat() {
    return 0.20 * tdee();
  }

  double loCarb() {
    return (tdee() - (loFat() + loPro()));
  }

  //maintain weight
  double mnPro() {
    return (weight * 2.2) * 4;
  }

  double mnFat() {
    return 0.20 * tdee();
  }

  double mnCarb() {
    return tdee() - (mnPro() + mnFat());
  }

  //gain weight
  double gnPro() {
    return (0.9 * (weight * 2.2)) * 4;
  }

  double gnFat() {
    return 0.25 * tdee();
  }

  double gnCarb() {
    return tdee() - (gnFat() + gnPro());
  }
}
