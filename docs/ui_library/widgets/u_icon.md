# UIcon

A Custom Widget that receives any `UIcons` as positional parameter. The size is pre setted inside the widget.

## UIcons 

This is the Uplink Icons Library, a class with all the icons that should be used in the app. 

## UIconData 

Similiar IconData in flutter, used to accept just the UIcons itens.

## Fonts

Icons and its respective codes are saved in ``UIcons.ttf``, the codes are used by UIconData. This allows for crisp fonts at small point sizes when displayed on low resolution displays besides saving space by not needing all the icons in SVG format.

``UIcons.json`` is a file that contains all the icons, its names and the orfer of them. Used to update ``UIcons``.

### How to use 

1. Import UI Library package 

```dart
import 'package:ui_library/ui_library_export.dart';
```
2. Call UIcon Widget in the code, and select any UIcons (This is customized with UIconData)

```dart
 UIcon(UIcons.back_arrow_button),
```

3. Here it is UText Show Room Page

<img width="400" src='ui_library/_media/utext_textstyles.png'></img>
