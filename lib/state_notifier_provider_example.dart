import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNotifier extends StateNotifier<List<String>> {
  MyNotifier() : super([]);

  void addString(String stringToAdd) {
    state = [...state, stringToAdd];
  }
}

final myProvider = StateNotifierProvider<MyNotifier, List<String>>(
  (ref) => MyNotifier(),
);

class StateNotifierProviderMyApp extends ConsumerWidget {
  Random random = Random();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> listOfString = ref.watch(myProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                // * state provider used to update state
                onPressed: () => {
                  ref
                      .read(myProvider.notifier)
                      .addString("string ${random.nextInt(100)}")
                },
                icon: const Icon(Icons.add),
              ),
            ],
            title: const Text("Example"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [...listOfString.map((string) => Text(string))],
            ),
          ),
        ));
  }
}
