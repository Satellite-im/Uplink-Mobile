import 'package:get_it/get_it.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/raygun.dart' as warp_raygun;
import 'package:warp_dart/rg_ipfs.dart' as rg_ipfs;

late warp_raygun.Raygun raygun;

String? conversationID;

class WarpRaygun {
  final _warp = GetIt.I.get<WarpBloc>();

  void enableRayGun() {
    raygun = rg_ipfs.raygun_ipfs_temporary(_warp.multipass!);
  }

  void createConversation(String userDID) {
    // Use the other user did to create conversation
    conversationID = raygun.createConversation('did:key:$userDID');
    print(conversationID);
  }

  void sendMessage(String newMessage) {
    final _listMessages = <String>[newMessage];
    print(_listMessages);
    raygun.send(conversationID!, null, _listMessages);
  }

  // Get the current user conversations
  void getConversations() {
    // Wait for new listConversation function, because it is returning a point
    final _currentUserConversations = raygun.listConversation();
    print(_currentUserConversations);
  }

  List<String> receiveMessage() {
    final _messages = <String>[];
    final _raygunMessages = raygun.getMessages(conversationID!);
    for (final element in _raygunMessages) {
      for (final message in element.value) {
        _messages.add(message);
      }
    }
    return _messages;
  }
}
