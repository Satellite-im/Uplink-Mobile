// ignore_for_file: avoid_dynamic_calls

import 'dart:math';

class MockPhoto {
  MockPhoto({required this.name, required this.path});
  MockPhoto.fromJson(dynamic json) {
    name = json['name'] as String;

//get a random local image path
    final _random = 1 + Random().nextInt(8);
    path = 'packages/ui_library/images/placeholders/photo_$_random.png';
  }
  late String name;
  late String path;
  int size = 389;
  bool isShared = false;
  bool isFavored = false;
  bool isDeleting = false;
}
