part of '../u_chatbar.dart';

class _UChatBarItems extends StatelessWidget {
  const _UChatBarItems({
    Key? key,
    required bool isSendMessageState,
    required this.onTap,
    required this.icon,
    required this.duration,
  })  : _isSendMessageState = isSendMessageState,
        super(key: key);

  final bool _isSendMessageState;
  final UIconData icon;
  final Duration duration;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: duration,
            width: _isSendMessageState ? 0 : 24,
            child: AnimatedOpacity(
              duration: duration,
              opacity: _isSendMessageState ? 0 : 1,
              child: InkWell(
                onTap: onTap,
                child: UIcon(
                  icon,
                  color: UColors.textDark,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            width: _isSendMessageState ? 0 : 17,
          ),
        ],
      ),
    );
  }
}
