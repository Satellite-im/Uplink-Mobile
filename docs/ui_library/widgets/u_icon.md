# UIcon

A Custom Widget that receives any `UIcons` as positional parameter. The size is pre setted inside the widget.

## UIcons 

This is the Uplink Icons Library, a class with all the icons that should be used in the app. To see the icons in Figma, [click here](https://www.figma.com/file/u39Gdsq7qgNe59SQy9HQNu/Satellite.im-Uplink-Library?node-id=184%3A846).

## UIconData 

Similiar IconData in flutter, used to accept just the UIcons itens.

### Fonts

Icons and its respective codes are saved in ``UIcons.ttf``, these codes are used inside UIconData. This allows for crisp fonts at small point sizes when displayed on low resolution displays besides saving space by not needing all the icons in SVG format.

``UIcons.json`` is a file that contains all the icons, its names and the order of them. Used to update ``UIcons``.

To generate new `.json` and `.ttf` files to update the app icons, there is a [step by step guide](https://docs.google.com/document/d/1dFHWPLT_k5WGoImKciAFJyqpFvpJc_PO/edit#heading=h.30j0zll).

### How to use 

1. Import UI Library package 

```dart
import 'package:ui_library/ui_library_export.dart';
```
2. Call UIcon Widget in the code, and select any UIcons (This is customized with UIconData)

```dart
 UIcon(UIcons.back_arrow_button),
```

3. UIcons and its names

<img src='ui_library/_media/uicons.png'></img>
