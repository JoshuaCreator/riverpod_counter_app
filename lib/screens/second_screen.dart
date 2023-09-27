import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStream = StreamProvider<int>((ref) => Stream.periodic(
      const Duration(seconds: 1),
      (count) => count,
    ));

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SECOND SCREEN'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            AsyncValue<int> stream = ref.watch(counterStream);
            return stream.when(
              data: (value) => Text(value.toString()),
              error: (error, stackTrace) => const Text('An error occurred'),
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
