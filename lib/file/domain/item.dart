// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

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
class Item extends Equatable {
  Item({
    required this.name,
    this.thumbnail,
    required this.type,
    required this.size,
    this.isFavorited = false,
    required this.creation,
    required this.modified,
  });
  String name;
  final String? thumbnail;
  final ItemType type;
  final int size;
  bool isFavorited;
  // dateTime when upload the item
  final DateTime creation;
  // dateTime when change the item name
  DateTime modified;

  @override
  List<Object?> get props => [
        name,
        thumbnail,
        type,
        size,
        isFavorited,
        creation,
        modified,
      ];
}
