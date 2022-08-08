part of 'qr_code_bottom_sheet.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({
    Key? key,
    required this.currentUser,
    required this.controller,
  }) : super(key: key);

  final MockCurrentUser currentUser;
  final ScrollController controller;

  @override
  State<QRCodePage> createState() => QRCodePageState();
}

class QRCodePageState extends State<QRCodePage>
    with SingleTickerProviderStateMixin {
  late MockCurrentUser currentUser;
  ScrollController? controller;
  late AnimationController _animationController;
  bool showHomeIndicator = true;
  bool showAppBar = false;
  bool isPage = false;
  bool isHalfPage = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    currentUser = widget.currentUser;
    controller = widget.controller;

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
          .animate(_animationController),
      child: WillPopScope(
        onWillPop: () async {
          if (showHomeIndicator == false) {
            await _animationController.forward().whenComplete(
                  () => Navigator.of(context).pop(),
                );
          }

          return true;
        },
        child: Container(
          color: showAppBar ? UColors.backgroundDark : Colors.transparent,
          padding: EdgeInsets.only(
            top: MediaQueryData.fromWindow(
              WidgetsBinding.instance!.window,
            ).padding.top,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              controller: controller,
              slivers: [
                SliverToBoxAdapter(
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 250),
                    crossFadeState: showAppBar
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: const UHomeIndicator(),
                    secondChild: const SizedBox.shrink(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: UColors.backgroundDark,
                    ),
                    child: _QRCodeBottomSheet(
                      currentUser: currentUser,
                      isHalfPage: isHalfPage,
                      animationController: _animationController,
                      isPage: isPage,
                      showAppBar: showAppBar,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
