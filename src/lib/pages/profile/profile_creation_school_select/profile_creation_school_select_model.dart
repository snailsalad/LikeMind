import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'profile_creation_school_select_widget.dart'
    show ProfileCreationSchoolSelectWidget;
import 'package:flutter/material.dart';

class ProfileCreationSchoolSelectModel
    extends FlutterFlowModel<ProfileCreationSchoolSelectWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getMajors)] action in profileCreationSchoolSelect widget.
  ApiCallResponse? majorCallResult;
  // State field(s) for SchoolSelect widget.
  String? schoolSelectValue;
  FormFieldController<String>? schoolSelectValueController;
  // State field(s) for MajorSelect widget.
  String? majorSelectValue;
  FormFieldController<String>? majorSelectValueController;
  // State field(s) for SchoolYear widget.
  FocusNode? schoolYearFocusNode;
  TextEditingController? schoolYearTextController;
  String? Function(BuildContext, String?)? schoolYearTextControllerValidator;
  String? _schoolYearTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'School Year is required';
    }

    if (val.length < 4) {
      return 'Invalid Year';
    }
    if (val.length > 4) {
      return 'Invalid Year';
    }
    if (!RegExp('20(2[5-9]|3[0-5])').hasMatch(val)) {
      return 'Invalid Year';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    schoolYearTextControllerValidator = _schoolYearTextControllerValidator;
  }

  @override
  void dispose() {
    schoolYearFocusNode?.dispose();
    schoolYearTextController?.dispose();
  }
}
