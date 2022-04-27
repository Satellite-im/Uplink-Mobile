# UColors

Customized Flutter `Color` Class used in the app. 

The following example is a `UText` widget that using `UColors.backgroundDark` as its text color.

```dart
  Widget build(BuildContext context) {
   return UText(
     'Color example',
     textStyle: UTextStyle.H1_primaryHeader,
          color: UColors.backgroundDark,// same as Color(0xFF0D0E16)
    );
  }
 ```

 ### Color palettes

 All colors are 100% opaque.

 <table>
  <tr>
    <th>Color Name</th>
    <th>Hex Value</th>
    <th>Color</th>
  </tr>
  <tr >
    <td>UColors.backgroundDark</td>
    <td>0D0E16</td>
    <td style="background-color:#0D0E16"></td>
  </tr>
   <tr >
    <td>UColors.foregroundDark</td>
    <td>232838</td>
    <td style="background-color:#232838"></td>
  </tr>
   <tr >
    <td>UColors.modalDark</td>
    <td>1A1E2E</td>
    <td style="background-color:#1A1E2E"></td>
  </tr>
   <tr >
    <td>UColors.white</td>
    <td>EEF0F2</td>
    <td style="background-color:#EEF0F2"></td>
  </tr>
   <tr >
    <td>UColors.ctaBlue</td>
    <td>205FFA</td>
    <td style="background-color:#205FFA"></td>
  </tr>
   <tr >
    <td>UColors.ctaDark</td>
    <td>31353D</td>
    <td style="background-color:#31353D"></td>
  </tr>

   <tr >
    <td>UColors.onlineGreen</td>
    <td>00B894</td>
    <td style="background-color:#00B894"></td>
  </tr>
   <tr >
    <td>UColors.idleYellow</td>
    <td>FECA57</td>
    <td style="background-color:#FECA57"></td>
  </tr>
   <tr >
    <td>UColors.termRed</td>
    <td>F93854</td>
    <td style="background-color:#576574"></td>
  </tr>
   <tr >
    <td>UColors.textMed</td>
    <td>A8AABE</td>
    <td style="background-color:#A8AABE"></td>
  </tr>
   <tr >
    <td>UColors.textDark</td>
    <td>6F748A</td>
    <td style="background-color:#6F748A"></td>
  </tr>
</table>