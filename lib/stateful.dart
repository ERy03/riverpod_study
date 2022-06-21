import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myProvider = StateProvider((ref) => 100);

class StatefulMyApp extends ConsumerStatefulWidget {
  const StatefulMyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StatefulMyAppState();
}

class _StatefulMyAppState extends ConsumerState<StatefulMyApp> {
  @override
  Widget build(BuildContext context) {
    int value = ref.watch(myProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                // * state provider used to update state
                onPressed: () => ref.read(myProvider.notifier).state++,
                icon: const Icon(Icons.sort),
              ),
            ],
            title: const Text("Example"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(value.toString())],
            ),
          ),
        ));
  }
}
