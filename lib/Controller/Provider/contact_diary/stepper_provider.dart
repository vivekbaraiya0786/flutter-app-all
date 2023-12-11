import 'package:flutter/material.dart';
import 'package:projects/Modals/contact_diary/stepper_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/attributes/attributes.dart';

class stepvalue_provider extends ChangeNotifier {
  stepper_Modal stepper_modal;

  stepvalue_provider({required this.stepper_modal});

  onstepContinue() async {
    if (stepper_modal.currentStepValue < steps!.length - 1) {
      stepper_modal.currentStepValue++;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('stepper-value', stepper_modal.currentStepValue);
      notifyListeners();
    }
  }

  onstepCancel() async {
    if (stepper_modal.currentStepValue > 0) {
      stepper_modal.currentStepValue--;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt('stepper-value', stepper_modal.currentStepValue);
      notifyListeners();
    }
  }
}
