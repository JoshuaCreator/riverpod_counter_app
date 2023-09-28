import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/counter_demo.dart';

final counterProvider = StateNotifierProvider<CounterDemo, int>(
  (ref) => CounterDemo(),
);

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROVIDER'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('$counter'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                // if (value == 0) return;
                ref.read(counterProvider.notifier).decrement();
              },
              child: const Icon(Icons.remove_rounded),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Icon(Icons.add_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
