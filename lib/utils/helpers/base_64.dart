import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as path_provider;

class Base64Convert {
  Future<File?> transformBase64ImageIntoFileImage(
    String _base64Image,
    String _fileName,
  ) async {
    try {
      if (_base64Image.isEmpty) {
        return null;
      } else {
        File? _fileToSaveImage;
        final _imageBytes = base64.decode(_base64Image);

        final _dir = await path_provider.getTemporaryDirectory();

        _fileToSaveImage = File(
          '${_dir.path}/$_fileName.jpg',
        );
        await _fileToSaveImage.writeAsBytes(_imageBytes);

        return _fileToSaveImage;
      }
    } catch (error) {
      return null;
    }
  }
}
