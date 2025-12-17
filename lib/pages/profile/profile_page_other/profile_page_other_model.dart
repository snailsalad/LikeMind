import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_other_widget.dart' show ProfilePageOtherWidget;
import 'package:flutter/material.dart';

class ProfilePageOtherModel extends FlutterFlowModel<ProfilePageOtherWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> usersForChat = [];
  void addToUsersForChat(DocumentReference item) => usersForChat.add(item);
  void removeFromUsersForChat(DocumentReference item) =>
      usersForChat.remove(item);
  void removeAtIndexFromUsersForChat(int index) => usersForChat.removeAt(index);
  void insertAtIndexInUsersForChat(int index, DocumentReference item) =>
      usersForChat.insert(index, item);
  void updateUsersForChatAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      usersForChat[index] = updateFn(usersForChat[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
