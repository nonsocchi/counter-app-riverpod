import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A [StateNotifier] has a single internal variable, [state]
/// that holds the current state, an instance of [CounterModel].
///
/// The [CounterModel] in [StateNotifier<CounterModel>] determines
/// the type of the [state].
class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier() : super(_initialValue);

  /// Initialise the state by passing an [_initialValue].
  static const _initialValue = CounterModel(0);

  /// An outside class can call [increment] to replace [state] with a new
  /// instance of [CounterModel], whose internal [count] value is one larger
  /// than the last instance of the [CounterModel].
  void increment() {
    state = CounterModel(state.count + 1);
  }
}

class CounterModel {
  const CounterModel(this.count);

  final int count;
}
