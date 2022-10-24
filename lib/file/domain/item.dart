// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// ItemType is for different types of objects are used in File session
///
/// It only contains photos in the MVP version.
///
/// Other type may be needed in the future.
enum ItemType {
  photo,
  directory,
  file,
  others,
}

/// Item is the object used in file session
/// thumbnail is a base64 string
/// preview(Uint8List) is for PhotoDetailPage to show image
/// file is the File with the path to upload/download
class Item extends Equatable {
  Item({
    required this.name,
    this.thumbnail,
    this.preview,
    required this.type,
    required this.size,
    this.file,
    this.isFavorited = false,
    this.creationDateTime,
    this.modifiedDateTime,
  });
  String name;
  final String? thumbnail;
  final Uint8List? preview;
  final ItemType type;
  final int size;
  final File? file;
  bool isFavorited;

  /// DateTime when upload the item
  final DateTime? creationDateTime;

  /// DateTime when change the item name
  DateTime? modifiedDateTime;

  @override
  List<Object?> get props => [
        name,
        thumbnail,
        preview,
        type,
        size,
        isFavorited,
        creationDateTime,
        modifiedDateTime,
      ];
}
