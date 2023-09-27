import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/providers/counter_demo.dart';

import 'screens/home_screen.dart';

final themeProvider = StateProvider<bool>((ref) => true);

final counterProvider = StateNotifierProvider<CounterDemo, int>(
  (ref) => CounterDemo(),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Riverpod App',
      // themeMode: lightTheme ? ThemeMode.light : ThemeMode.dark,
      theme: lightTheme
          ? ThemeData.light(useMaterial3: true)
          : ThemeData.dark(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
