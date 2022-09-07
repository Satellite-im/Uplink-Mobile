import 'package:uplink/shared/domain/entities/current_user.entity.dart';

abstract class IUserProfileRepository {
  Future<CurrentUser> getCurrentUserInfo();

  String getDid();

  String getUsername();

  String getMessageStatus();

  String getProfilePicture();

  String getBannerPicture();

  void modifyUsername(String newUsername);

  void modifyMessageStatus(String newMessageStatus);

  void modifyProfilePicture(String base64Image);

  void modifyBannerPicture(String base64Image);
}
