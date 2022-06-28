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
    const _hintText = UAppStrings.editProfilePage_hintText;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 56,
          ),
          _TextField(
            textFieldTitle: UAppStrings.editProfilePage_usernameTitle,
            hintText: _hintText,
            onChanged: (value) {},
            controller: usernameTextFieldController,
          ),
          _TextField(
            textFieldTitle: UAppStrings.editProfilePage_statusMessageTitle,
            hintText: _hintText,
            onChanged: (value) {},
            controller: statusMessageTextFieldController,
          ),
          _TextField(
            textFieldTitle: UAppStrings.editProfilePage_locationTitle,
            hintText: _hintText,
            onChanged: (value) {},
            controller: locationTextFieldController,
          ),
          _TextField(
            textFieldTitle: UAppStrings.editProfilePage_aboutTitle,
            hintText: _hintText,
            textFieldHeight: 78,
            onChanged: (value) {},
            controller: aboutTextFieldController,
            textAlignVertical: TextAlignVertical.top,
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
              child: UButton.primary(
                label: UAppStrings.editProfilePage_saveChangesButton,
                uIconData: UIcons.checkmark,
                onPressed: () {},
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

class _TextField extends StatelessWidget {
  const _TextField({
    Key? key,
    required this.controller,
    required this.textFieldTitle,
    required this.hintText,
    required this.onChanged,
    this.textFieldHeight,
    this.textAlignVertical,
    this.maxLines,
  }) : super(key: key);

  final TextEditingController controller;
  final String textFieldTitle;
  final String hintText;
  final Function(String) onChanged;
  final double? textFieldHeight;
  final TextAlignVertical? textAlignVertical;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: UText(
              textFieldTitle,
              textStyle: UTextStyle.H3_tertiaryHeader,
            ),
          ),
          const SizedBox.square(dimension: 8.4),
          Container(
            height: textFieldHeight ?? 48,
            decoration: BoxDecoration(
              color: UColors.foregroundDark,
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextField(
              controller: controller,
              style: UTextStyle.H5_fifthHeader.style.returnTextStyleType(
                color: Colors.white,
              ),
              textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
              textInputAction: TextInputAction.done,
              cursorColor: UColors.textDark,
              autocorrect: false,
              onChanged: onChanged,
              maxLines: maxLines ?? 1,
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                fillColor: UColors.foregroundDark,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(4),
                ),
                hintText: hintText,
                hintStyle:
                    UTextStyle.H5_fifthHeader.style.returnTextStyleType(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
