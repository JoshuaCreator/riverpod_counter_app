import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStream = StreamProvider<int>(
  (ref) => Stream.periodic(
    const Duration(microseconds: 1),
    (count) => count,
  ),
);

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STREAM PROVIDER'),
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
      // persistentFooterButtons: [
      //   Text("The stream provider is used to read the state of a stream object")
      // ],
    );
  }
}
