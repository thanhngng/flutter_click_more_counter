# flutter_click_more_counter

**A counter click event that show message to tell the users that they need to click more to continue.**

**The case using this lib as same as active the developer mode in Android devices.**

![demo.gif](demo.gif)

## Features

Use this plugin in your Flutter when:

- Open something hidden in your app that you don't want user to know it.
- You want to open a hidden screen (logs, app information, user information, ...) for tracking
  issues when app in release mode.

## Getting started

#### Add dependency
This plugin using FlutterToast to show message, you need add this dependency as well.

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_click_more_counter: ^1.0.0
  fluttertoast: ^8.2.4
```

#### Add the following imports to your Dart code

```dart
import 'package:flutter_click_more_counter/flutter_click_more_counter.dart';
```

## Usage

#### Create ClickMoreCounter

```dart
final clickCounter = ClickMoreCounter();
```

#### Call function inside your button click event
```dart
clickCounter.run(() { });
```

#### Example
```dart

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// here
  final clickCounter = ClickMoreCounter();

  /// click event
  void onClick() {
    /// here
    clickCounter.run(() {
      showDialog(
              useSafeArea: false,
              context: context,
              builder: (BuildContext context) => const AlertDialog(
                title: Text("Flutter Click More Counter"),
                content: Text("Hello there"),
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Click the button more than 5 times',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onClick,
        tooltip: 'Click',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```

## Example code

[example demo](https://github.com/thanhngng/flutter_click_more_counter/tree/main/example)
