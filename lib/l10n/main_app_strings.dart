// ignore_for_file: constant_identifier_names

class UAppStrings {
  /// General Strings
  static const continueButton = 'Continue';
  static const cancelButton = 'Cancel';
  static const agreeButton = 'Agree';
  static const goBackButton = 'Go back';
  static const moreOptions = 'More Options';
  static const remove = 'Remove';
  static const okay = 'Okay';

  /// Strings for OnboardPinPage
  static const pinPage_pageTitle = 'Create Account Pin';
  static const pinPage_createPinToProtectYourAccount =
      'Create a pin to protect your account. '
      '\nThe pin can be anything you want, just don’t forget it.';
  static const pinPage_pinOptions = 'Pin Options';

  /// Strings for OnboardCreateAccountPage
  static const createAccountPage_appBarTitle = 'Create Account';
  static const createAccountPage_pageDescription =
      'We’re going to create an account for you. On the next screen, '
      'you’ll see a set of words. Screenshot this or write it down.';
  static const createAccountPage_onlyWayBackupYourAccount =
      'This is the only way to back up your account.';
  static const createAccountPage_importAccountButton = 'Import Account';
  static const createAccountPage_storePin = 'Store Pin? (Less Secure)';
  static const createAccountPage_allowNotifications = 'Allow Notifications';

  /// Strings for Privacy Settings Pages
  static const privacySetting_appBarTitle = 'Privacy Settings';

  /// Strings for OnboardPrivacySettingFirstPage
  static const privacySettingFirstPage_chooseWhichFeaturesToEnable =
      'Choose which features to enable to best suit your privacy preferences.';
  static const privacySettingFirstPage_firstOptionTitle =
      'Register Username Publicly';
  static const privacySettingFirstPage_firstOptionSubTitle =
      'Publicly associate your account ID with a human readable username. '
      'Anyone can see this association.';
  static const privacySettingFirstPage_secondOptionTitle = 'Store Account Pin';
  static const privacySettingFirstPage_secondOptionSubTitle =
      'Store your account pin locally so you don’t have to enter '
      'it manually every time. This is not recommended. ';
  static const privacySettingFirstPage_thirdOptionTitle =
      'Enable External Embeds';
  static const privacySettingFirstPage_thirdOptionSubTitle =
      'Allow Satellite.im to fetch data from external sites in order to expand '
      'links like Spotify, Youtube, and more.';
  static const privacySettingFirstPage_fourthOptionTitle =
      'Display Current Activity';
  static const privacySettingFirstPage_fourthOptionSubTitle =
      'Allow Satellite.im to see what games you’re playing and show '
      'them off on your profile so friends can jump in.';

  /// Strings for OnboardPrivacySettingSecondPage
  static const privacySettingSecondPage_subTitle = 'Signaling Servers';
  static const privacySettingSecondPage_pageDescription = '''
Choose which signaling server group you want to use.

If you use ‘Satellite.im + Public Signaling Servers’, you are using public servers and Satellite.im hosted servers to connect with your friends. We do not track connections. We only track server utilization (memory and cpu usage) to know if we need to turn on more signaling servers.

If you opt to use ‘Only Public Signaling Servers’, those are completely outside of Satellite.im control, so we cannot see any insight into their operation, logging, or data sharing practices. You may experience difficulties connecting with friends if the signaling servers are overloaded.
''';

  /// Strings for OnboardRecoverySeedPage
  static const recoverySeedPage_appBarTitle = 'Recovery Seed';
  static const recoverySeedPage_pageDescription =
      'Write this down in the order that they appear. Having the correct '
      'order is crucial when you are recovering your account.';
  static const recoverySeedPage_iSavedItButton = 'I Saved It';
  static const recoverySeedPage_areYouSureBottomSheetHeader = '''
    Are you sure you want to continue
    (You can view your passphrase from your account settings)''';
  static const recoverySeedPage_screenshotButton = 'Screenshot';
  static const recoverySeedPage_screenshotAdvice =
      'Save this in a safe place or write it down. To recover your '
      'account, you’ll need your 12 passphrases '
      'in the order that they '
      'appear. Please do not share these passphrases with anybody.';

  static const recoverySeedPage_screenshotCapturedBottomSheetHeader = '''
Screenshot captured!
Would you like to give Satellite.im access to your camera roll?''';
  static const recoverySeedPage_imageNameToSave = 'recovery_seed_words';
  static const recoverySeedPage_uDialogTitle = 'Saved!';
  static const recoverySeedPage_uDialogDescription =
      'This screenshot was saved to your phone gallery.';

  /// Strings for OnboardCreateProfilePage
  static const createProfilePage_appBarTitle = 'Create Profile';
  static const createProfilePage_description =
      'Sed ut perspiciatis unde omnis iste natus error sit '
      'voluptatem accusantium doloremque laudantium.';
  static const createProfilePage_usernameTextFieldTitle = 'Username';
  static const createProfilePage_usernameTextFieldHintText =
      'Digit your username...';
  static const createProfilePage_statusMessageTextFieldTitle = 'Status Message';
  static const createProfilePage_statusMessageTextFieldHintText =
      'Digit your status message...';
  static const createProfilePage_signinButton = 'Sign in';
  static const createProfilePage_bottomSheetTitle1 =
      'Do you want to save your changes? \n'
      'You can always add your avatar and status message later.';
  static const createProfilePage_bottomSheetTitle2 =
      'Do you want to save your changes? \n'
      'You can always add your status message later.';
  static const createProfilePage_bottomSheetTitle3 =
      'Do you want to save your changes? ';
  static const createProfilePage_allDoneButton = 'All done';

  /// Strings for LinkingSatellitesPage
  static const linkingSatellitesPage_title = 'Linking Satellites...';
  static const linkingSatellitesPage_subTitle =
      'Making contact, requesting entry to Realm...';

  /// OnboardImportAccountPage
  static const onboardImportAccountPage_title = 'Import Account';
  static const onboardImportAccountPage_body =
      'Enter your 12 word passphrase in exactly the same order your recovery '
      'seed was generated.';
  static const onboardImportAccountPage_error = 'error. account not registered';
  static const onboardImportAccountPage_tryAgain = 'Try Again';
  static const onboardImportAccountPage_recover = 'Recover Account';
  static const onboardImportAccountPage_hint = 'Enter Passphrase';

  /// SigninPage
  static const signinPage_enterPin = 'Enter Pin Code';
  static const signinPage_enterPinBody =
      'Enter your Pin to unlock your account.';
  static const signinPage_forgotPin = 'Forgot Your Pin Code';
  static const signinPage_switchAccount = 'Switch Account';
  static const signinPage_newAccount = 'New Account';

  /// ContactsIndexPage
  static const contactsIndexPage_appBarTitle = 'Contacts';
  static const contactsIndexPage_friendRequests = 'Friend Requests';
  static const contactsIndexPage_outgoingRequests = 'Outgoing Requests';
  static const contactsIndexPage_blocked = 'Blocked';

  /// NoFriendBody
  static const noFriendBody_title = 'No Friends Yet';
  static const noFriendBody_body =
      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem '
      'accusantium doloremque laudantium.';
  static const noFriendBody_addFriend = 'Add a Friend';

  ///FriendRequestPage
  static const friendRequestPage_appBarTitle = 'Friend Requests';
  static const friendRequestPage_emptyBody =
      'No one is here, you have 0 friend request!';
  static const friendRequestPage_received = 'Received - ';

  ///FriendRequestListTile
  static const friendRequestListTile_bottomSheetHeader =
      'Are you sure you want to remove this friend request?';
  static const friendRequestListTile_dialogTitle = 'Friend Request Deleted';
  static const friendRequestListTile_text1 = 'The friend request from ';
  static const friendRequestListTile_text2 = ' was deleted.';

  ///OutgoingRequestPage
  static const outgoingRequestPage_appBarTitle = 'Outgoing Requests';
  static const outgoingRequestPage_emptyBody =
      'No one is here, you have 0 outgoing request!';
  static const outgoingRequestPage_sent = 'Sent - ';

  ///OutgoingRequestListTile
  static const outgoingRequestListTile_bottomSheetHeader =
      'Are you sure you want to unsend this friend request?';
  static const outgoingRequestListTile_dialogTitle = 'Friend Request Removed';
  static const outgoingRequestListTile_text1 = 'Your request to ';
  static const outgoingRequestListTile_text2 = ' was removed.';

  ///BlockedPage
  static const blockedPage_appBarTitle = 'Block';
  static const blockedPage_emptyBody =
      'No one is here, you have 0 blocked contacts!';

  /// FilesIndexPage
  static const filesIndexPage_appBarTitle = 'Files';

  /// ChatIndexPage
  static const chatIndexPage_appBarTitle = 'Chats';
  static const chatIndexPage_startConversationTitle = 'Start a Conversation';
  static const chatIndexPage_startConversationBody =
      'Sed ut perspiciatis unde omnis iste natus error '
      'sit voluptatem accusantium doloremque laudantium.';
  static const chatIndexPage_addFriendButton = 'Add a Friend';
  static const chatIndexPage_favoritesTitle = 'Favorites';
  static const chatIndexPage_newChat = 'New Chat';

  /// ProfileIndexPage
  static const profileIndexPage_username = 'username';
  static const profileIndexPage_statusMessage =
      'Something something space station';
  static const profileIndexPage_editProfile = 'Edit Profile';
  static const profileIndexPage_badges = 'Badges';
  static const profileIndexPage_location = 'Location';
  static const profileIndexPage_locationValue = 'State, USA';
  static const profileIndexPage_friends = 'Friends';
  static const profileIndexPage_friendsNumber = '24';
  static const profileIndexPage_aboutTitle = 'About';
  static const profileIndexPage_aboutDescription =
      'Sed ut perspiciatis unde omnis '
      'iste natus error sit voluptatem accusantium doloremque laudantium, '
      'totam rem aperiam, eaque ipsa quae beatae vitae dicta sunt explicabo. ';
  static const profileIndexPage_setStatus = 'Set Status';
  static const profileIndexPage_spotifyUsername = 'username12';
  static const profileIndexPage_twitchUsername = 'username_plays';
  static const profileIndexPage_qrCodeData = 'QR CODE DATA';
  static const profileIndexPage_bannerPhotoHeader =
      'Update your banner picture from';
  static const profileIndexPage_bannerPhotoFirstButtonText = 'Take Photo';
  static const profileIndexPage_bannerPhotoSecondButtonText = 'Camera Roll';

  /// EditProfilePage
  static const editProfilePage_hintText = 'Text Input Field';
  static const editProfilePage_usernameTitle = 'Username';
  static const editProfilePage_statusMessageTitle = 'Status Message';
  static const editProfilePage_locationTitle = 'Location';
  static const editProfilePage_aboutTitle = 'About';
  static const editProfilePage_displayLocation = 'Display Location';
  static const editProfilePage_makeProfilePublic = 'Make Profile Public';
  static const editProfilePage_saveChangesButton = 'Save Changes';

  /// QRCodePage
  static const qrCodePage_appBarTitle = 'Scan QR Code';
  static const qrCodePage_pageDescription =
      'Sed ut perspiciatis unde omnis iste natus error sit '
      'voluptatem accusantium doloremque laudantium.';
  static const qrCodePage_buttonText = 'Allow Camera Scan';
}
