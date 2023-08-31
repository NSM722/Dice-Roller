# Dice Roller

To run this Linux app locally just type this command on the terminal

```terminal
flutter run
```

Flutter run key commands:

- r Hot reload 🔥🔥🔥
- R Hot restart
- h List all available interactive commands.
- d Detach (terminate "flutter run" but leave application running)
- c Clear the screen
- q Quit (terminate the application on the device)

A new Flutter project.

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## My Notes

- **MaterialApp()** is the main wrapper
- **Scaffold()** ensures the status bar is set up correctly but you don't have to use it
  
### Building Custom Widgets

Widgets are classes used to build UIs

Widgets are used for both layout and UI elements

Dart automatically adds a constructor function to every custom widget

Basically, all widgets are classes in flutter. To create a custom widget one needs to extend `StatelessWidget`

**Named key word/parameter** - The super key needs to be applied something like this:

`const GradientWrapper({super.key})`

```dart
class GradientWrapper extends StatelessWidget {
  const GradientWrapper({super.key}); // this is a constructor function

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: beginAlignment,
            end: endAlignment,
            colors: const [Colors.amber, Color.fromARGB(255, 197, 63, 221)]),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}
```

The **@override** statement should be added after the above statement, it just means this custom widget will override some methods also it's for metadata purposes

This line of code `Widget build(context)` just means that the return type of the custom class is a **Widget** and `build(context)` is an automatic function that Flutter calls with the `context OR ctx` parameter included(a must) under the hood once it encounters your **Widget** nested under other widgets which in return makes sure that this particular **Widget** is visible on the UI

### Final vs Const

[Difference between Const and Final in Dart](https://itnext.io/difference-between-const-and-final-in-dart-78c129d0c573 "Medium Article")

**final** - is a run-time constant

**const** -  a compile-time constant

### Named Parameters

By default these parameters are optional

```dart
class GradientWrapper extends StatelessWidget {
  const GradientWrapper({super.key, required this.colors});

  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: beginAlignment, end: endAlignment, colors: colors),
      ),
      child: const Center(
        child: StyledText('Hey there, Jane Doe'),
      ),
    );
  }
}
```

To set a named parameter as required one needs to use the **required`** keyword or **!** non-null operator

### Positional Parameters

By default these parameters are required

```dart
class GradientWrapper extends StatelessWidget {
  const GradientWrapper(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: beginAlignment, end: endAlignment, colors: [color1, color2]),
      ),
      child: Center(
        // child: StyledText('Hey there, Jane Doe'),
        child: Image.asset(
          'assets/images/dice-1.png',
          width: 170,
        ),
      ),
    );
  }
}
```

### Displaying Images

[Flutter Pub: Expected a key while parsing a block mapping. path:](https://stackoverflow.com/questions/50171766/flutter-pub-expected-a-key-while-parsing-a-block-mapping-path "Stack overflow thread")

One must register the images relative paths in the `pubspec.yaml` file in order for them to show in the UI

```yaml
  assets:
    - assets/images/dice-1.png
    - assets/images/dice-2.png
    - assets/images/dice-3.png
    - assets/images/dice-4.png
    - assets/images/dice-5.png
    - assets/images/dice-6.png
```

### Layout Widgets - Column & Row

**Column** - A widget that displays its children in a vertical array

**Row** - A widget that displays its children in a horizontal array

### Buttons

A common pattern in flutter is to keep the  widget arguments last:

```dart
TextButton(
  onPressed: rollDice,
  style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 24)),
  child: const Text('Roll')) // this argument is last
```

You can use a `SizedBox()` widget or padding inside the `TextButton.styleFrom(padding: 20,)` method:

The `SizedBox` widget only takes up space(in this case the height) in the UI, it wont show anything. It has a fixed width and height therefore it won't grow to fit the contents of any widgets nested in it

```dart
style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(top: 20),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 24)),
              child: const Text('Roll Dice')
```

### Stateful Widget

It is a common pattern to associate a state class with its parent class in the same file

The `setState()` function will cause flutter to re-execute the build method which will listen for any changes in state and re-render the UI

```dart
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState(); // execute the DiceRollerState
  }
}

// private class only for use in this file(dice_roller.dart)
class _DiceRollerState extends State<DiceRoller> {
  var currentDiceImage = 'assets/images/dice-1.png';

  void rollDice() {
    setState(
      () {
        currentDiceImage = 'assets/images/dice-3.png';
      },
    );
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // centers the dice vertically
      children: [
        Image.asset(
          currentDiceImage,
          width: 170,
        ),
        const SizedBox(height: 20),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                // padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 24)),
            child: const Text('Roll Dice'))
      ],
    );
  }
}
```
