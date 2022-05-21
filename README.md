### Flutter Riverpod tutorial: Counter App

This project modifies the default starter app (in `main.dart` when creating a new flutter app) to use the [Hooks Riverpod](https://pub.dev/packages/hooks_riverpod "Hooks Riverpod") state management package.

Inspired by [Surgach](https://medium.com/flutter-community/flutter-riverpod-tutorial-counter-app-ed3aa758f02f).

[Hooks Riverpod](https://pub.dev/packages/hooks_riverpod "Hooks Riverpod") is a state-management library that:
- catches programming errors at compile time rather than at runtime
- removes nesting for listening/combining objects
- ensures that the code is testable

#### Setup
```dart
environment: sdk: ">=2.16.2 <3.0.0"
```

```dart
dependencies:
  cupertino_icons: ^1.0.2
  hooks_riverpod: ^1.0.3
```
#### Adding a model class
Models generally handle the logic of an app. In this case, it is the **state management** class, and it represents the state of the counter. The model is called `CounterModel` and is used to display the current valye of the counter in the middle of the screen.

#### Adding a custom counter text widget.
The text which changes on the button tap is refactored into a separate widget, `CounterTextWidget` to avoid rebuilding the entire `MyHomePage` widget.

#### Adding a state management class
The state management class is called `CounterNotifier`. it extends the `StateNotifier` class. 
A `StateNotifier` has a single internal variable, `state` that holds the current state, an instance of [CounterModel].
An `increment()` method is also added to the state management class so an outside class can call `increment` to replace state with a new instance of `CounterModel`, whose internal `count` value is one larger than the last instance of the `CounterModel`.

#### Enabling Riverpod
In the `main.dart` file, wrap `MyApp` with a new widget `ProviderScope`.

#### Creating a global provider
Create a global provider using a `StateNotifierProvider` because the `state` is in a `tateNotifier` class, `CounterNotifier`.

#### Replacing StatelessWidget with HookConsumerWidget
`CounterTextWidget` extends `HookConsumerWidget` to use the `ref` commands provided by Riverpod.

#### Listening for state changes
- `ref.watch` listens for state changes in the provider which is the current instance of `CounterModel`.  This also provides a reference to the notifier state, stored in the `CounterModel`.
- Now when the state changes, the `build` method will re-run to update the new state.

#### Showing the new state
The Text widget can easily display the new state by calling `counterModel.count` as this contains the integer value of the state.

#### Updating the state
Similarly, the value of the Text widget can be updated by calling the `increment` method using `ref.watch`.


### Testing it out
Tapping the + button only rebuilds the `CounterTextWidget` as seen from the debug console (thanks to the print statements).

![image](https://user-images.githubusercontent.com/24850031/169653801-fa3bbb42-1f49-4a3d-a68c-d3898035354c.png)



For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
