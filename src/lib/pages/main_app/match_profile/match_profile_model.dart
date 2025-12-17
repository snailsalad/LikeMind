import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'match_profile_widget.dart' show MatchProfileWidget;
import 'package:flutter/material.dart';

class MatchProfileModel extends FlutterFlowModel<MatchProfileWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chatDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
