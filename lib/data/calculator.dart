import 'dart:math';

import 'package:macro_calculator/utils/enums.dart';

class Calculator {
  final double weight;
  final double height;
  final int age;
  final ActivityLevel activityLevel;
  final Goal goal;
  final Gender gender;

  Calculator({
    this.activityLevel,
    this.goal,
    this.gender,
    this.weight,
    this.height,
    this.age,
  });

  double bmi() {
    return (weight / pow(height / 100, 2));
  }

  String bmiScale() {
    if (bmi() < 18.5)
      return 'UNDERWEIGHT';
    else if (bmi() >= 18.5 && bmi() <= 24.9)
      return 'NORMAL';
    else if (bmi() >= 25 && bmi() <= 29.9)
      return 'OVERWEIGHT';
    else if (bmi() >= 30 && bmi() <= 34.9)
      return 'OBESE';
    else if (bmi() >= 35)
      return 'EXTREMLY OBESE';
    else
      return 'BMI';
  }

  double bmr() {
    if (gender == Gender.male) {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double tdee() {
    if (activityLevel == ActivityLevel.sedentary)
      return bmr() * 1.2;
    else if (activityLevel == ActivityLevel.lightly)
      return bmr() * 1.375;
    else if (activityLevel == ActivityLevel.moderately)
      return bmr() * 1.55;
    else if (activityLevel == ActivityLevel.very)
      return bmr() * 1.725;
    else if (activityLevel == ActivityLevel.extremly)
      return bmr() * 1.9;
    else
      return null;
  }

  double totalCalories() {
    if (goal == Goal.loose) {
      return (tdee() - 500);
    } else if (goal == Goal.maintain) {
      return tdee();
    } else if (goal == Goal.gain) {
      return tdee() + 400;
    } else
      return null;
  }

  //protein
  double protein() {
    if (goal == Goal.loose) {
      return ((1.1 * (weight * 2.2)) * 4) / 4;
    } else if (goal == Goal.maintain) {
      return ((weight * 2.2) * 4) / 4;
    } else if (goal == Goal.gain) {
      return ((0.9 * (weight * 2.2)) * 4) / 4;
    }
    return 0;
  }

  //fats
  double fat() {
    if (goal == Goal.loose) {
      return (0.20 * totalCalories()) / 9;
    } else if (goal == Goal.maintain) {
      return (0.20 * totalCalories()) / 9;
    } else if (goal == Goal.gain) {
      return (0.25 * totalCalories()) / 9;
    }
    return 0;
  }

  //carbs
  //I succ at maths lol
  double carb() {
    if (goal == Goal.loose) {
      return (totalCalories() - (fat() * 9 + protein() * 4)) / 4;
    } else if (goal == Goal.maintain) {
      return (totalCalories() - (protein() * 4 + fat() * 9)) / 4;
    } else if (goal == Goal.gain) {
      return (totalCalories() - (fat() * 9 + protein() * 4)) / 4;
    }
    return 0;
  }
}
