part of '../profile_index_page.dart';

class _EditProfileBody extends StatelessWidget {
  const _EditProfileBody({
    Key? key,
    required this.usernameTextFieldController,
    required this.statusMessageTextFieldController,
    required this.locationTextFieldController,
    required this.aboutTextFieldController,
  }) : super(key: key);

  final TextEditingController usernameTextFieldController;
  final TextEditingController statusMessageTextFieldController;
  final TextEditingController locationTextFieldController;
  final TextEditingController aboutTextFieldController;

  @override
  Widget build(BuildContext context) {
    final _isSaveChangesButtonEnabled = ValueNotifier<bool>(false);

    const _hintText = UAppStrings.editProfilePage_hintText;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 56,
          ),
          UTextField.username(
            textFieldTitle: UAppStrings.editProfilePage_usernameTitle,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            hintText: _hintText,
            onChanged: (value) {
              if (value.length >= 5) {
                _isSaveChangesButtonEnabled.value = true;
              } else {
                _isSaveChangesButtonEnabled.value = false;
              }
            },
            controller: usernameTextFieldController,
          ),
          UTextField.messageStatus(
            textFieldTitle: UAppStrings.editProfilePage_statusMessageTitle,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            hintText: _hintText,
            onChanged: (value) {},
            controller: statusMessageTextFieldController,
          ),
          UTextField(
            textFieldTitle: UAppStrings.editProfilePage_locationTitle,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            hintText: _hintText,
            onChanged: (value) {},
            controller: locationTextFieldController,
          ),
          UTextField(
            textFieldTitle: UAppStrings.editProfilePage_aboutTitle,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            hintText: _hintText,
            textFieldHeight: 78,
            onChanged: (value) {},
            controller: aboutTextFieldController,
            maxLines: 3,
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
              child: ValueListenableBuilder(
                valueListenable: _isSaveChangesButtonEnabled,
                builder: (context, object, widget) {
                  return UButton.primary(
                    label: UAppStrings.editProfilePage_saveChangesButton,
                    uIconData: UIcons.checkmark,
                    disabled: !_isSaveChangesButtonEnabled.value,
                    onPressed: () {},
                  );
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
