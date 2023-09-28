import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stateProvider = StateProvider<int>((ref) {
  return 0;
});

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('STATE PROVIDER'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('$provider'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                ref.read(stateProvider.notifier).state--;
              },
              child: const Icon(Icons.remove_rounded),
            ),
            FloatingActionButton(
              heroTag: null,
              onPressed: () {
                ref.read(stateProvider.notifier).state++;
              },
              child: const Icon(Icons.add_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
