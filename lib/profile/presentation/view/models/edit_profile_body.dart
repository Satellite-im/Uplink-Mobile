part of '../profile_index_page.dart';

class _EditProfileBody extends StatefulWidget {
  const _EditProfileBody({
    Key? key,
    required this.controller,
    required this.usernameTextFieldController,
    required this.statusMessageTextFieldController,
    required this.locationTextFieldController,
    required this.aboutTextFieldController,
    required this.scrollController,
    required this.onSaveChanges,
  }) : super(key: key);

  final TextEditingController usernameTextFieldController;
  final TextEditingController statusMessageTextFieldController;
  final TextEditingController locationTextFieldController;
  final TextEditingController aboutTextFieldController;
  final ScrollController scrollController;
  final Function(bool) onSaveChanges;
  final CurrentUserBloc controller;

  @override
  State<_EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<_EditProfileBody> {
  @override
  Widget build(BuildContext context) {
    var newUsername = widget.controller.currentUser?.username ?? '';
    var newMessageStatus = widget.controller.currentUser?.statusMessage ?? '';
    const _hintText = UAppStrings.editProfilePage_hintText;
    widget.usernameTextFieldController.text =
        widget.controller.currentUser?.username ?? '';
    widget.statusMessageTextFieldController.text =
        widget.controller.currentUser?.statusMessage ?? '';
    widget.locationTextFieldController.text = '';
    widget.aboutTextFieldController.text = '';

    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 56,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                UTextInput.singleLineWithTitle(
                  key: _uTextInputStateForUsernameField,
                  controller: widget.usernameTextFieldController,
                  uTextInputRules: UTextInputRules.username,
                  textFieldTitle: UAppStrings.editProfilePage_usernameTitle,
                  hintText: _hintText,
                  onChanged: (value) {
                    newUsername = value;
                  },
                ),
                const SizedBox.square(
                  dimension: 32,
                ),
                UTextInput.singleLineWithTitle(
                  key: _uTextInputStateForMessageStatusField,
                  controller: widget.statusMessageTextFieldController,
                  uTextInputRules: UTextInputRules.messageStatus,
                  textFieldTitle:
                      UAppStrings.editProfilePage_statusMessageTitle,
                  hintText: _hintText,
                  onChanged: (value) {
                    newMessageStatus = value;
                  },
                ),
                const SizedBox.square(
                  dimension: 32,
                ),
                UTextInput.singleLineWithTitle(
                  controller: widget.locationTextFieldController,
                  textFieldTitle: UAppStrings.editProfilePage_locationTitle,
                  hintText: _hintText,
                  onChanged: (value) {},
                ),
                const SizedBox.square(
                  dimension: 32,
                ),
                UTextInput.multiLinesWithTitle(
                  controller: widget.aboutTextFieldController,
                  textFieldTitle: UAppStrings.editProfilePage_aboutTitle,
                  hintText: _hintText,
                  onChanged: (value) {},
                ),
                const SizedBox.square(
                  dimension: 24,
                ),
              ],
            ),
          ),
          const UDivider(),
          _ProfileOptions(
            text: UAppStrings.editProfilePage_displayLocation,
            icon: UIcons.location,
            onSwitch: (value) {},
          ),
          const UDivider(),
          _ProfileOptions(
            text: UAppStrings.editProfilePage_makeProfilePublic,
            icon: UIcons.menu_bar_contacts,
            onSwitch: (value) {},
          ),
          const UDivider(),
          const SizedBox.square(
            dimension: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: UButton.primary(
                label: UAppStrings.editProfilePage_saveChangesButton,
                uIconData: UIcons.checkmark_1,
                onPressed: () {
                  if (widget.usernameTextFieldController.text.trim().length <
                      5) {
                    _uTextInputStateForUsernameField.currentState!
                        .startCheckingShortUsernameError();
                    widget.scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.ease,
                    );
                  } else {
                    if (newUsername.trim() !=
                            widget.controller.currentUser?.username &&
                        newUsername.isNotEmpty) {
                      widget.controller.add(
                        UpdateUsername(
                          newUsername: newUsername,
                        ),
                      );
                    }
                    if (newMessageStatus.trim() !=
                        widget.controller.currentUser?.statusMessage) {
                      widget.controller.add(
                        UpdateMessageStatus(
                          newMessageStatus: newMessageStatus,
                        ),
                      );
                    }
                    _uTextInputStateForUsernameField.currentState!
                        .resetValues();
                    _uTextInputStateForMessageStatusField.currentState!
                        .resetValues();
                    widget.onSaveChanges(true);
                  }
                },
              ),
            ),
          ),
          const SizedBox.square(
            dimension: 20,
          ),
        ],
      ),
    );
  }
}

class _ProfileOptions extends StatelessWidget {
  const _ProfileOptions({
    Key? key,
    required this.text,
    required this.icon,
    required this.onSwitch,
  }) : super(key: key);

  final String text;
  final UIconData icon;
  final Function(bool) onSwitch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UIconText(
                icon: icon,
                text: text,
                color: UColors.textMed,
              ),
              USwitcher(
                switchValue: true,
                onSwitch: onSwitch,
              ),
            ],
          ),
          const SizedBox.square(
            dimension: 20,
          ),
        ],
      ),
    );
  }
}
