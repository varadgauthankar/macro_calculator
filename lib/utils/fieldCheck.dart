import 'package:macro_calculator/utils/enums.dart';

bool isGenderEmpty() {
  if (selectedGender == Gender.unDefined) {
    return true;
  }
  return false;
}

bool isActivityEmpty() {
  if (selectedActivityLevel == ActivityLevel.unDefined) {
    return true;
  }
  return false;
}

bool isGoalEmpty() {
  if (selectedGoal == Goal.unDefined) {
    return true;
  }
  return false;
}
