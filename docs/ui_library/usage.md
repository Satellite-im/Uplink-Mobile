# UI Library

UI Library is an in-app package that includes reusable components, like widgets, constants, fonts, icons, placeholders, etc. It is for building the user interfaces in the Uplink app.

Access [Uplink Design System](https://www.figma.com/file/u39Gdsq7qgNe59SQy9HQNu/Satellite.im-Uplink-Library?node-id=10%3A3) to check all the components in the UI Library.

#### UI Library Structure

- Fonts: The custom fonts used in the app like texts and icons.

- Core: All the code that are shared by more than one widget, it can be constants as sizes, colors, some helpers as date and coin formatters and more.

- Widgets: All the customized widgets for Uplink. It includes all the components that are used in the app.

### How to use UI Library package

1. Installation:

Add the `ui_library` package to the `pubspec.yaml` as a dependency.

```yaml
dependencies:
    ui_library:
        path: 'packages/ui_library'
```

2. Import
Now that we have successfully installed UI Library, we can import it in our code.

```dart
import 'package:ui_library/ui_library_export.dart';
```



