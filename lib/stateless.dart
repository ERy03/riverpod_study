import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/my_provider.dart';

// ? What is this?
// Decalring a variable. Creating a provider that stores a value ("Hello World")
// * But why? => By creating a provider, we will be able to override the value
// You can define multiple providers
// ! Providers should always be `final`
final myProvider = Provider((ref) => "Hello World");

// ? What is a StateProvider?
// a provider that exposes a way to modify its state
// * Primarily exists to allow the modification of simple variables by the User Interface
final myProvider2 = StateProvider((ref) => 100);

// ? Extend Consumer Widget instead of StatelessWidget
// A Consumer Wiget is a Stateless Widget that can listen to providers.
// * Why?  Allows us to obtain the ref in the widget tree.
class StatelessMyApp extends ConsumerWidget {
  const StatelessMyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(myProvider);
    final int value2 = ref.watch(myProvider2);
    final int value3 = ref.watch(thirdProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                // * state provider used to update state
                onPressed: () => ref.read(myProvider2.notifier).state++,
                icon: const Icon(Icons.add),
              ),
            ],
            title: const Text("Example"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(value),
                Text(value2.toString()),
                Text(value3.toString()),
              ],
            ),
          ),
        ));
  }
}
