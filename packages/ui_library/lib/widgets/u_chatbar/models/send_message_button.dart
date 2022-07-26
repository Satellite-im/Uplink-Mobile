part of '../u_chatbar.dart';

class _SendMessageButton extends StatelessWidget {
  const _SendMessageButton({
    Key? key,
    required Duration duration,
    required this.onTextSubmitted,
    required this.isTextEmpty,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final Function onTextSubmitted;
  final bool isTextEmpty;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      width: isTextEmpty ? 0 : 41,
      padding: const EdgeInsets.only(bottom: 8),
      child: AnimatedOpacity(
        duration: _duration,
        opacity: isTextEmpty ? 0 : 1,
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const SizedBox.square(dimension: 17),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  onTextSubmitted.call();
                },
                child: const UIcon(
                  UIcons.chatbar_send,
                  color: UColors.ctaBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
