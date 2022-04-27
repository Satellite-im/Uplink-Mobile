import 'package:flutter/material.dart';

import '../models/models_export.dart';

/// Creates an Group Profile Widget with picture
/// and no status
class UGroupProfile extends StatelessWidget {
  /// Creates Group Profile Widget
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UGroupProfile({
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
            : Image.asset(
                'packages/ui_library/images/placeholders/server_avatar_1.png',
              ),
      ),
    );
  }
}
