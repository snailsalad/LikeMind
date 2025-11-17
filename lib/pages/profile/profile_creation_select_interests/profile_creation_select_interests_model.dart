import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profile_creation_select_interests_widget.dart'
    show ProfileCreationSelectInterestsWidget;
import 'package:flutter/material.dart';

class ProfileCreationSelectInterestsModel
    extends FlutterFlowModel<ProfileCreationSelectInterestsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getHobbies)] action in profileCreationSelectInterests widget.
  ApiCallResponse? hobbiesRes;
  // State field(s) for InterestChips widget.
  FormFieldController<List<String>>? interestChipsValueController;
  List<String>? get interestChipsValues => interestChipsValueController?.value;
  set interestChipsValues(List<String>? val) =>
      interestChipsValueController?.value = val;
  // State field(s) for InterestsDropDown widget.
  List<String>? interestsDropDownValue;
  FormFieldController<List<String>>? interestsDropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
