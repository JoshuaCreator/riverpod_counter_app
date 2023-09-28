import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/screens/provider_screen.dart';
import 'package:riverpod_app/screens/scoped_provider_screen.dart';
import 'package:riverpod_app/screens/state_provider_screen.dart';
import 'package:riverpod_app/screens/future_provider_screen.dart';
import 'package:riverpod_app/screens/stream_provider_screen.dart';

import '../main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lightTheme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Providers'),
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
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              text: 'Provider',
              screen: ProviderScreen(),
            ),
            MyButton(
              text: 'State Provider',
              screen: StateProviderScreen(),
            ),
            MyButton(
              text: 'Future Provider',
              screen: FutureProviderScreen(),
            ),
            MyButton(
              text: 'Stream Provider',
              screen: StreamProviderScreen(),
            ),
            MyButton(
              text: 'Scoped Provider',
              screen: ScopedProviderScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.screen,
  });
  final String text;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.purpleAccent.withOpacity(.5),
      highlightColor: Colors.purpleAccent.withOpacity(.5),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => screen,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        child: Center(child: Text(text)),
      ),
    );
  }
}
