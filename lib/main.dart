import 'package:counter_app/models/counter.dart';
import 'package:counter_app/widgets/counter_text_widget.dart';
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
    // ignore: avoid_print
    print('building HomePage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('You have pushed the button this many times:'),
            CounterTextWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // [ref.read] gets a reference to the state management class
          // [CounterNotifier] without listening for changes in the state.

          ref.read(provider.notifier).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
