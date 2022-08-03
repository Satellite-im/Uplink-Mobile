part of 'qr_code_bottom_sheet.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({
    Key? key,
    required this.currentUser,
    required this.controller,
    this.isFromBottomSheet,
    this.showHomeIndicator,
    this.showAppBar,
    this.isPage,
  }) : super(key: key);

  final MockCurrentUser currentUser;
  final ScrollController controller;
  final bool? isFromBottomSheet;
  final bool? showHomeIndicator;
  final bool? showAppBar;
  final bool? isPage;

  @override
  State<QRCodePage> createState() => QRCodePageState();
}

class QRCodePageState extends State<QRCodePage>
    with SingleTickerProviderStateMixin {
  late MockCurrentUser currentUser;
  ScrollController? controller;
  late AnimationController _animationController;
  bool showHomeIndicator = false;
  bool showAppBar = false;
  bool isPage = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    currentUser = widget.currentUser;
    controller = widget.controller;

    if (widget.isPage != null) {
      isPage = widget.isPage!;
    }
    if (widget.showHomeIndicator != null) {
      showHomeIndicator = widget.showHomeIndicator!;
    }
    if (widget.showAppBar != null) {
      showAppBar = widget.showAppBar!;
    }
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
    );
  }
}
