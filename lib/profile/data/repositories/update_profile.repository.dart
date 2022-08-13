import 'package:uplink/profile/domain/entities/profile.entity.dart';

abstract class IUpdateProfileRepository {
  Future<String> getUsername();

  Future<String> getMessageStatus();

  Future<void> modifyUsername(String newUsername);

  Future<void> modifyMessageStatus(String newMessageSat);
}
