import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('Default arguments', () {
    const _uButtonLogout = 'Logout';
    const _uBottomSheetPinOptions = 'Pin Options';
    const _uBottomSheetPinDigits = 'Digits';
    const _uChatBarHintText = 'Speak Freely...';
    const _uImageCropperTitle = 'Cropper';
    const _allowCameraPermission = 'Allow Camera Permission';
    const _camera = 'camera';
    const _allowCameraRollPermission = 'Allow Camera Roll Permission';
    const _gallery = 'gallery';
    const _nextButton = 'Next';
    const _uUserPictureChangeHeader = 'Upload your avatar picture from';
    const _uUserPictureChangeFirstButtonText = 'Take Photo';
    const _uUserPictureChangeSecondButtonText = 'Camera Roll';

    then('uButtonLogout should return correct string',
        () => ULibraryStrings.uButtonLogout.should.be(_uButtonLogout),
        and: {
          'uBottomSheetPinOptions should return correct string': () =>
              ULibraryStrings.uBottomSheetPinOptions.should
                  .be(_uBottomSheetPinOptions),
          'uBottomSheetPinDigits should return correct string': () =>
              ULibraryStrings.uBottomSheetPinDigits.should
                  .be(_uBottomSheetPinDigits),
          'uChatBarHintText should return correct string': () =>
              ULibraryStrings.uChatBarHintText.should.be(_uChatBarHintText),
          'uImageCropperTitle should return correct string': () =>
              ULibraryStrings.uImageCropperTitle.should.be(_uImageCropperTitle),
          'allowCameraPermission should return correct string': () =>
              ULibraryStrings.allowCameraPermission.should
                  .be(_allowCameraPermission),
          'camera should return correct string': () =>
              ULibraryStrings.camera.should.be(_camera),
          'allowCameraRollPermission should return correct string': () =>
              ULibraryStrings.allowCameraRollPermission.should
                  .be(_allowCameraRollPermission),
          'gallery should return correct string': () =>
              ULibraryStrings.gallery.should.be(_gallery),
          'nextButton should return correct string': () =>
              ULibraryStrings.nextButton.should.be(_nextButton),
          'uUserPictureChangeHeader should return correct string': () =>
              ULibraryStrings.uUserPictureChangeHeader.should
                  .be(_uUserPictureChangeHeader),
          'uUserPictureChangeFirstButtonText should return correct string':
              () => ULibraryStrings.uUserPictureChangeFirstButtonText.should
                  .be(_uUserPictureChangeFirstButtonText),
          'uUserPictureChangeSecondButtonText should return correct string':
              () => ULibraryStrings.uUserPictureChangeSecondButtonText.should
                  .be(_uUserPictureChangeSecondButtonText),
        });
  });

  given('Non-default arguments', () {
    final argument = 'example object';

    final calledFunction = ULibraryStrings.uDialogWeNeedPermission(argument);

    then(
        'uDialogWeNeedPermission should return passed-in argument',
        () => calledFunction.should.be(
            'We need permission to access your example object! '
            'You can grant permission now or change later in your phone Settings.'));
  });
}
