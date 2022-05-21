import 'dart:developer';

import 'package:counter_app/models/counter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    // Wrap [MyApp] in [ProviderScope] to listen for changes.
    const ProviderScope(child: MyApp()),
  );
}

// Create a global provider
// Using a [StateNotifierProvider] because the [state] is in a [StateNotifier]
// class, [CounterNotifier].
final provider = StateNotifierProvider<CounterNotifier, CounterModel>(
    (ref) => CounterNotifier());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

// Replacing [statelessWidget] with [HookWidget] allows for the use of
// [useProvider] method.
class MyHomePage extends HookConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // [ref.watch] listens for [state] changes in [provider] which is the
    // current instance of [CounterModel].
    // This also provides a reference to the notifier state, stored in the
    // [CounterModel].

    // Now when the [state] changes, the [build] method will re-run to update
    // the new [state].
    final counterModel = ref.watch(provider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              // [counterModel.count] contains the current integer value of the
              // state.
              '${counterModel.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
