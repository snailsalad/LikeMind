import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'messaging_widget.dart' show MessagingWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MessagingModel extends FlutterFlowModel<MessagingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for OldListView widget.

  PagingController<DocumentSnapshot?, MessagesRecord>?
      oldListViewPagingController;
  Query? oldListViewPagingQuery;

  // State field(s) for ChatField widget.
  FocusNode? chatFieldFocusNode;
  TextEditingController? chatFieldTextController;
  String? Function(BuildContext, String?)? chatFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in SendButton widget.
  MessagesRecord? lastMsgOut;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    oldListViewPagingController?.dispose();

    chatFieldFocusNode?.dispose();
    chatFieldTextController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, MessagesRecord> setOldListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    oldListViewPagingController ??= _createOldListViewController(query, parent);
    if (oldListViewPagingQuery != query) {
      oldListViewPagingQuery = query;
      oldListViewPagingController?.refresh();
    }
    return oldListViewPagingController!;
  }

  PagingController<DocumentSnapshot?, MessagesRecord>
      _createOldListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, MessagesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryMessagesRecordPage(
          parent: parent,
          queryBuilder: (_) => oldListViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 15,
          isStream: false,
        ),
      );
  }
}
