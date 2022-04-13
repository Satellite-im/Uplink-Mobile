import 'package:flutter/material.dart';

enum Status {
  online,
  busy,
  offline,
}

class StatusIndicator extends StatelessWidget {
  const StatusIndicator.small(
    Status status, {
    Key? key,
  })  : _status = status,
        _size = 8,
        super(key: key);

  const StatusIndicator.medium(
    Status status, {
    Key? key,
  })  : _status = status,
        _size = 12,
        super(key: key);

  const StatusIndicator.large(
    Status status, {
    Key? key,
  })  : _status = status,
        _size = 12,
        super(key: key);

  final double _size;
  final Status _status;

  @override
  Widget build(BuildContext context) {
    Map<Status, Color> _statusMap = {
      Status.online: Colors.green,
      Status.busy: Colors.green,
      Status.offline: Colors.green
    };
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _statusMap[_status],
        shape: BoxShape.circle,
      ),
    );
  }
}
