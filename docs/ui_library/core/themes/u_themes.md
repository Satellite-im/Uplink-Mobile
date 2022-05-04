# UThemes

Customized Flutter `ThemeData` Class used in the app. 

Currently, there are three themes in UI Library: `UThemes.light`, `UThemes.dark` and `UThemes.tbd`.

When the user first opens the app, the theme will be `UThemes.dark`.

### How to add new Theme

1. Add the new ThemeData in the `packages/ui_library/lib/core/theme/models/u_themes.dart` file.

2. Link the new ThemeData to `ThemeModel` in `packages/ui_library/lib/core/theme/theme_model.dart` file. `ThemeModel` is a `ChangeNotifier` that carry the current theme that is used in the app.