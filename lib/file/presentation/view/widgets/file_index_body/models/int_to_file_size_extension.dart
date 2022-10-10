import 'dart:math';

extension FileSizeParsing on int {
  String toFileSize({int decimals = 0}) {
    final suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (log(this) / log(1024)).floor();
    return '${(this / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
