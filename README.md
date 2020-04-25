<!-- Language: [English](README.md) | [Português](translation/pt-BR/README.md) -->

# flutter_util_widgets.dart
<a href="https://pub.dev/packages/flutter_util_widgets" rel="nofollow" target="_blank"><img src="https://img.shields.io/badge/flutter__util__widgets-v1.0.0-blue" alt="pub package" data-canonical-src="https://img.shields.io/badge/flutter__util__widgets-v1.0.0-blue" style="max-width:100%;"></a>

A flutter package that provides a variety of useful widgets. It&#x27;s constantly updated.

## Install the package

### 1. Add this to your package's pubspec.yaml file:
```dart
flutter_util_widgets: ^1.0.5
```
### 2. Update dependencies:
You can install packages from the command line:
```sh
$ flutter pub get
```

### 3. Import it on your app
Now in your Dart code, you can use:
```dart
import 'package:flutter_util_widgets/flutter_util_widgets.dart';
```

## Using the package

#### 1. Switcher widget:
##### Screenshot:
<img src="https://github.com/luizjacomn/flutter_util_widgets/raw/master/screenshots/switcher.gif" height="300em" />

##### Code:
```dart
import 'package:flutter/material.dart';

import 'package:flutter_util_widgets/flutter_util_widgets.dart';

class TestWidget extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Util Widgets'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Squared',
                    ),
                  ),
                  Switcher(onChange: print),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Rounded',
                    ),
                  ),
                  Switcher.rounded(
                    initialValue: true,
                    onChange: print,
                  ),
                ],
              ),
              Switcher.label(
                label: 'With label',
                onChange: print,
              ),
              Switcher.labelAndRounded(
                label: 'With label and rounded',
                onChange: print,
              ),
              Switcher.label(
                initialValue: true,
                label: 'Customizing active color and label style',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                activeColor: Colors.amber,
                onChange: print,
              ),
              Switcher.labelAndRounded(
                mainAxisAlignment: MainAxisAlignment.end,
                label: 'Customizing disabled color and alignment',
                disableColor: Colors.blueGrey[300],
                onChange: print,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```