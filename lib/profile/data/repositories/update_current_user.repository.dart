abstract class IUpdateCurrentUserRepository {
  String getUsername();

  String getMessageStatus();

  String getProfilePicture();

  void modifyUsername(String newUsername);

  void modifyMessageStatus(String newMessageStatus);

  void modifyProfilePicture(String base64Image);
}
