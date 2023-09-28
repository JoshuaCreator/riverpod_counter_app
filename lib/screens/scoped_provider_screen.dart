import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScopedProviderScreen extends ConsumerWidget {
  const ScopedProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('SCOPED PROVIDER'),
        centerTitle: true,
      ),
      body:const Center(
        child: Text('Scoped Provider'),
      ),
    );
  }
}