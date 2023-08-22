# my_app

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
