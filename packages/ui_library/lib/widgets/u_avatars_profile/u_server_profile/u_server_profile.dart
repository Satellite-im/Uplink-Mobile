import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/placeholders/placeholder.dart';

import '../models/models_export.dart';

/// Creates an Server Profile Widget with picture
/// and no status
class UServerProfile extends StatelessWidget {
  /// Creates Server Profile Widget
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UServerProfile({
    Key? key,
    String? imagePath,
  })  : _imagePath = imagePath,
        _size = UAvatarProfileSize.normal,
        super(key: key);

  final UAvatarProfileSize _size;

  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: _size.size,
        width: _size.size,
        child: _imagePath != null
            ? Image.network(_imagePath!)
            : const UPlaceholder.serverProfile(),
      ),
    );
  }
}
