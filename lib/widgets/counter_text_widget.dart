import 'package:counter_app/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterTextWidget extends HookConsumerWidget {
  const CounterTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print method to see every time the widget's [build] method gets called.
    // ignore: avoid_print
    print('building CounterTextWidget');

    // [ref.watch] listens for [state] changes in [provider] which is the
    // current instance of [CounterModel].
    // This also provides a reference to the notifier state, stored in the
    // [CounterModel].

    // Now when the [state] changes, the [build] method will re-run to update
    // the new [state].
    final counterModel = ref.watch(provider);

    return Text(
      // [counterModel.count] contains the current integer value of the
      // state.
      '${counterModel.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
