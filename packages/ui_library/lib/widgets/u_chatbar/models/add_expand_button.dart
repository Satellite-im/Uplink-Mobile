part of '../u_chatbar.dart';

class _AddExpandButton extends StatelessWidget {
  const _AddExpandButton({
    Key? key,
    required Duration duration,
    required bool isSendMessageState,
    required this.expandButtonOnTap,
    required this.addButtonOnTap,
  })  : _duration = duration,
        _isSendMessageState = isSendMessageState,
        super(key: key);

  final Duration _duration;
  final bool _isSendMessageState;
  final Function expandButtonOnTap;
  final Function addButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedPadding(
        duration: _duration,
        padding: _isSendMessageState
            ? const EdgeInsets.only(bottom: 8)
            : const EdgeInsets.only(bottom: 0),
        child: AnimatedSwitcher(
          duration: _duration,
          transitionBuilder: (child, animation) => RotationTransition(
            turns: child.key == const ValueKey('add_button')
                ? Tween<double>(begin: 1, end: 0.75).animate(animation)
                : Tween<double>(begin: 0.75, end: 1).animate(animation),
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          ),
          child: !_isSendMessageState
              ? UIconButton.add(
                  onPressed: () {
                    addButtonOnTap();
                  },
                )
              : InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    expandButtonOnTap();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: UIcon(
                      UIcons.right_arrow_inline_row,
                      color: UColors.ctaBlue,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
