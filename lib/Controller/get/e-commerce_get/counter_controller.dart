import 'package:get/get.dart';
import 'package:projects/Modals/e-commerce_get/counter_modal.dart';

class CounterController extends GetxController {
  CounterModal counterModal = CounterModal(i: 0);

  void increment() {
    counterModal.i++;
    update();
  }

  void decrement() {
    if (counterModal.i > 0) {
      counterModal.i--;
      update();
    }
  }
}

class CounterController1 extends GetxController {
  CounterModal1 counterModal1 = CounterModal1(i1: 0.obs);

  void increment() {
    counterModal1.i1++;
  }

  void decrement() {
    if (counterModal1.i1 > 0) {
      counterModal1.i1--;
    }
  }
}
