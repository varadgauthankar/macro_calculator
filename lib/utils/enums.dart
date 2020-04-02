enum Gender {
  unDefined,
  male,
  female,
}

enum ActivityLevel {
  unDefined,
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  extremlyActive,
}

enum Goal {
  unDefined,
  looseWeight,
  maintainWeight,
  gainWeight,
}

enum Units {
  metric,
  imperial,
}

Gender selectedGender = Gender.unDefined;
ActivityLevel selectedActivityLevel = ActivityLevel.unDefined;
Goal selectedGoal = Goal.unDefined;
Units selectedUnit = Units.metric;

class CheckVal {
  CheckVal(this.value);
  bool value;
}
