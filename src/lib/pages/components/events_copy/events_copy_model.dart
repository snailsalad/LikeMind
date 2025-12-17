import '/flutter_flow/flutter_flow_util.dart';
import 'events_copy_widget.dart' show EventsCopyWidget;
import 'package:flutter/material.dart';

class EventsCopyModel extends FlutterFlowModel<EventsCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for EventTitle widget.
  FocusNode? eventTitleFocusNode;
  TextEditingController? eventTitleTextController;
  String? Function(BuildContext, String?)? eventTitleTextControllerValidator;
  // State field(s) for EventLocation widget.
  FocusNode? eventLocationFocusNode;
  TextEditingController? eventLocationTextController;
  String? Function(BuildContext, String?)? eventLocationTextControllerValidator;
  // State field(s) for EventStart widget.
  FocusNode? eventStartFocusNode;
  TextEditingController? eventStartTextController;
  String? Function(BuildContext, String?)? eventStartTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for EventTimeEnd widget.
  FocusNode? eventTimeEndFocusNode;
  TextEditingController? eventTimeEndTextController;
  String? Function(BuildContext, String?)? eventTimeEndTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    eventTitleFocusNode?.dispose();
    eventTitleTextController?.dispose();

    eventLocationFocusNode?.dispose();
    eventLocationTextController?.dispose();

    eventStartFocusNode?.dispose();
    eventStartTextController?.dispose();

    eventTimeEndFocusNode?.dispose();
    eventTimeEndTextController?.dispose();
  }
}
