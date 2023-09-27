import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import 'second_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final lightTheme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('R I V E R P O D  A P P'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).state = !lightTheme;
            },
            icon: Icon(
              lightTheme ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            ),
          ),
        ],
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
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    maintainState: false,
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              child: const Icon(Icons.navigate_next_rounded),
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
