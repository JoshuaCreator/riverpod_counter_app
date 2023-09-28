import 'package:flutter_riverpod/flutter_riverpod.dart';


/// UTILIZED BY PROVIDER
class CounterDemo extends StateNotifier<int> {
  CounterDemo() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}
