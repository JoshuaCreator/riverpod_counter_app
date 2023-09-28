import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<String> fetchMsg() async {
  return await Future.delayed(
    const Duration(seconds: 3),
    () => 'And that was the Future Provider',
  );
}

final futureProvider = FutureProvider<String>((ref) async {
  return fetchMsg();
});

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FUTURE PROVIDER'),
        centerTitle: true,
      ),
      body: Center(
        child: provider.when(
          data: (data) => Text(data),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
