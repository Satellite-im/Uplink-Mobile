# UI Showroom
UI Showroom is a package that includes all the example screens to show all the components of the UI Library. This package is for demonstration purposes only, **do not use it in the production environment**.

### How to use UI Showroom package

1. Installation:

Add the `ui_showroom` package to the `pubspec.yaml` as a dependency.

```yaml
dependencies:
    ui_showroom:
        path: 'packages/ui_showroom'
```

2. Import

Now that we have successfully installed UI showroom, we can import it in `lib/app/view/app.dart`.

```dart
import 'package:ui_showroom/ui_showroom_export.dart';
```

3. In the `lib/app/view/app.dart`, set `_appToBuild` to `App.uiShowroom`, then run the app. It will switch to the showroom app to show all the UI components by their categories.

<img width="400" src='ui_showroom/_media/showroom_app.png'></img>

### How to add new widget page(screen) in UI Showroom package

1. Create a widget page and set its routeName to '/widgetName', in this example is `/UColors`.

![image](https://user-images.githubusercontent.com/14248245/162667180-5f619cd0-def4-4dcf-93f6-3decc394031e.png)
![image](https://user-images.githubusercontent.com/14248245/162667270-276a933f-72ab-4db8-8d6f-88236d67e615.png)

2. Export the widget page into ui_pages_export.dart

![image](https://user-images.githubusercontent.com/14248245/162667989-23d7d9b4-48af-4481-94e7-8783ef02a1bd.png)

3. Go to  ui_showroom_page.dart, add widgetPage route and WidgetPageButton with the same widget name.

![image](https://user-images.githubusercontent.com/14248245/162667569-d8a3cff9-a99f-41d3-83ce-9c310e208686.png)
![image](https://user-images.githubusercontent.com/14248245/162667639-06523d65-179a-4b0f-8ed6-44abee9cc981.png)

4. You are done! Run the app to check if it works well.