# UText

It is a custom Text Widget for Uplink. It has its own text styles. It should be used in all texts inside the app.

## UTextStyle 

The [font family](ui_library/fonts/text.md), size, weight and type are defined in the UTextStyles, is a enum that returns all necessary settings to build UText.

### Properties

There are another properties in UText, like max lines, text overflow, text align and so on.

### How to use 

Call UText in the code, the required parameters are the text, and the textStyle, the other parameters are optional.

```dart
 UText('Text Example', textStyle: UTextStyle.H4_fourthHeader,),
```

### UText with differents UTextStyles

<img src='ui_library/_media/utext_with_utextstyles.png'></img>
