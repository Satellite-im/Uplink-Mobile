import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/models_export.dart';
import 'package:uplink/contacts/add_friend_page/widgets/found_user_body.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/models_export.dart';
import 'package:uplink/utils/utils_export.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({Key? key}) : super(key: key);

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage>
    with TickerProviderStateMixin {
  final layerLink = LayerLink();
  late AnimationController? _animationController;
  late Animation<double> _animation;
  late GlobalKey<FormFieldState<String>> _formfieldKey;
  bool _disableSearchButton = true;
  //In search mode,someone is found
  bool _isFound = false;
  //In search mode, no user is found
  bool _showNoUserError = false;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!);
    _formfieldKey = GlobalKey<FormFieldState<String>>();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _textController.addListener(() {
      if (_textController.text.length == UAppNums.accountIdLength &&
          _disableSearchButton == true) {
        //when text length is 43, light up button
        setState(() {
          _disableSearchButton = false;
        });
      } else if (_textController.value.text.length !=
              UAppNums.accountIdLength &&
          _disableSearchButton == false) {
        //after user search the wrong user and want to change the text
        setState(() {
          _disableSearchButton = true;
        });
      }
    });

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildCopyAccountID(),
                  const UDivider(),
                  const SizedBox(height: 16),
                  const UText(
                    UAppStrings.addFriendPage_userAccount,
                    textStyle: UTextStyle.B1_body,
                  ),
                  const SizedBox(height: 24),
                  _buildIDFormField(),
                  if (_showNoUserError) ...[
                    const SizedBox(
                      height: 24,
                    ),
                    const UText(
                      UAppStrings.addFriendPage_noAccountFound,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.termRed,
                    )
                  ] else
                    const SizedBox.shrink(),
                  if (!_isFound) ...[
                    const SizedBox(height: 56),
                    UButton.primary(
                      disabled: _disableSearchButton,
                      label: UAppStrings.search,
                      uIconData: UIcons.search,
                      onPressed: () async {
                        if (_formfieldKey.currentState!.validate()) {
                          // TODO(yijing): update search account ID
                          setState(() {
                            if (_textController.text ==
                                'pBr8xM9WKfbGnLK8EJEiKEivBhBos5EDdJv5Wzbib94') {
                              _isFound = true;
                            } else {
                              _showNoUserError = true;
                            }
                          });
                        }
                      },
                    )
                  ]
                ],
              ),
            ),
            // TODO(demo): change user type here to see different scenarios
            if (_isFound)
              ChangeNotifierProvider(
                create: (context) =>
                    UserNotifier(blockedUserWithoutFriendRequest),
                builder: (context, child) => const FoundUserBody(),
              ),
          ],
        ),
      ),
    );
  }

  UAppBar _buildAppBar(BuildContext context) {
    return UAppBar.actions(
      title: UAppStrings.addFriendPage_addFriend,
      actionList: [
        IconButton(
          icon: const UIcon(
            UIcons.qr_code,
            color: UColors.textMed,
          ),
          onPressed: () {
            qrCodeBottomSheet(
              context,
              null,
            ).show();
          },
        )
      ],
    );
  }

  FormField<String> _buildIDFormField() {
    return FormField<String>(
      key: _formfieldKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.length < UAppNums.accountIdLength && value.isNotEmpty) {
          return UAppStrings.addFriendPage_lessCharacters;
        } else if (value.length > UAppNums.accountIdLength &&
            value.isNotEmpty) {
          return UAppStrings.addFriendPage_moreCharacters;
        }
        return null;
      },
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: UColors.foregroundDark,
              ),
              child: TextField(
                controller: _textController,
                onChanged: (value) {
                  state.didChange(value);
                  if (_isFound) _isFound = false;
                  if (_showNoUserError) _showNoUserError = false;
                },
                decoration: const InputDecoration(
                  hintText: UAppStrings.addFriendPage_hint,
                ),
                keyboardType: TextInputType.none,
              ),
            ),
            if (state.hasError) ...[
              const SizedBox(
                height: 24,
              ),
              UText(
                state.errorText.toString(),
                textStyle: UTextStyle.B1_body,
                textColor: UColors.termRed,
              )
            ]
          ],
        );
      },
    );
  }

//Copied animated label
  Future<void> _showOverlay(
    BuildContext context, {
    required String text,
  }) async {
    final overlay = Overlay.of(context);
    final leftOffset = MediaQuery.of(context).size.width / 2 - 50;

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 72,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          //overlay won't show on the screen when move to other pages
          offset: Offset(leftOffset, 64),
          child: Material(
            color: Colors.transparent,
            child: Opacity(
              opacity: _animation.value,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(painter: FatTriangle()),
                      const SizedBox(width: 16),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: UColors.ctaBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: UText(
                      text,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    _animationController?.addListener(() {
      overlay!.setState(() {});
    });
    overlay!.insert(overlayEntry);
    await _animationController?.forward();
    await Future<void>.delayed(const Duration(milliseconds: 1250)).whenComplete(
      () => _animationController?.reverse().whenComplete(
            overlayEntry.remove,
          ),
    );
  }

  List<Widget> _buildCopyAccountID() {
    // TODO(yijing): update account id
    const userId = 'pBr8xM9WKfbGnLK8EJEiKEivBhBos5EDdJv5Wzbib94';
    return [
      Row(
        children: const [
          UIcon(
            UIcons.account_id,
            color: UColors.textMed,
          ),
          SizedBox(width: 9),
          UText(
            UAppStrings.addFriendPage_yourAccount,
            textStyle: UTextStyle.H3_tertiaryHeader,
          )
        ],
      ),
      const SizedBox(height: 16),
      const UText(
        UAppStrings.addFriendPage_copyAccountID,
        textStyle: UTextStyle.B1_body,
        textColor: UColors.white,
      ),
      const SizedBox(height: 24),
      CompositedTransformTarget(
        link: layerLink,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: UColors.foregroundDark,
          ),
          padding: const EdgeInsets.all(16),
          child: InkWell(
            child: const UText(
              userId,
              textStyle: UTextStyle.H5_fifthHeader,
              textColor: UColors.white,
            ),
            onTap: () {
              Clipboard.setData(const ClipboardData(text: userId)).whenComplete(
                () => _showOverlay(
                  context,
                  text: UAppStrings.addFriendPage_copied,
                ),
              );
            },
          ),
        ),
      ),
      const SizedBox(height: 24),
    ];
  }
}
