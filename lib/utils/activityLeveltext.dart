import 'package:macro_calculator/utils/enums.dart';

String activityLevelText() {
  if (selectedActivityLevel == ActivityLevel.unDefined)
    return 'Select activity level';
  else if (selectedActivityLevel == ActivityLevel.sedentary)
    return 'Sedentary: little to no exercise';
  else if (selectedActivityLevel == ActivityLevel.lightlyActive)
    return 'Lightly Active: light exercise\n(1-3 days / week)';
  else if (selectedActivityLevel == ActivityLevel.moderatelyActive)
    return 'Moderately Active: moderate exercise\n(3-5 days / week)';
  else if (selectedActivityLevel == ActivityLevel.veryActive)
    return 'Very Active: heavy exercise\n(6-7 days / week)';
  else if (selectedActivityLevel == ActivityLevel.extremlyActive)
    return 'Extremely Active: Athelete\n(training 2x / day)';
  else
    return '';
}
