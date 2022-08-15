abstract class IUpdateProfileRepository {
  String getUsername();

  String getMessageStatus();

  void modifyUsername(String newUsername);

  void modifyMessageStatus(String newMessageStatus);
}
