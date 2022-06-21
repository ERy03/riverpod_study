import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_study/state_notifier_provider_example.dart';
import 'package:riverpod_study/stateful.dart';
import 'package:riverpod_study/stateless.dart';

void main() {
  runApp(
    // ? What is a Provider Scope and why do we need it?
    // For widgets to be able to read providers, the entire application needs to be wrapped by the "Provider Scope" widget.
    // * Without this widget, the state of our providers will not be stored.
    // ProviderScope(
    ProviderScope(
      child: StateNotifierProviderMyApp(),
    ),
  );
}
