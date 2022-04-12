import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  const StatusIndicator.small({
    Key? key,
  })  : _size = 8,
        super(key: key);

  const StatusIndicator.medium({
    Key? key,
  })  : _size = 12,
        super(key: key);

  const StatusIndicator.large({
    Key? key,
  })  : _size = 16,
        super(key: key);

  final double _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );
  }
}
