import 'package:flutter/material.dart';
import 'package:projects/Modals/contact_diary/counter_modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class counterProvider extends ChangeNotifier {
  // CounterModal counterModal = CounterModal(counter: 0);
  //
  // increment() {
  //   counterModal.counter++;
  //   notifyListeners();
  // }
  //
  // decrement() {
  //   if (counterModal.counter > 0) {
  //     counterModal.counter--;
  //     notifyListeners();
  //   }
  // }

  CounterModal counterModal;

  counterProvider({required this.counterModal});

  increment() async {
    counterModal.counter++;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('countervalue', counterModal.counter);
    notifyListeners();
  }

  decrement() async {
    if (counterModal.counter > 0) {
      counterModal.counter--;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('countervalue', counterModal.counter);
      notifyListeners();
    }
  }
}
