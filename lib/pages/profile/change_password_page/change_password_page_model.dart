import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'change_password_page_widget.dart' show ChangePasswordPageWidget;
import 'package:flutter/material.dart';

class ChangePasswordPageModel
    extends FlutterFlowModel<ChangePasswordPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for newPasswordConfirm widget.
  FocusNode? newPasswordConfirmFocusNode;
  TextEditingController? newPasswordConfirmTextController;
  late bool newPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      newPasswordConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    newPasswordVisibility = false;
    newPasswordConfirmVisibility = false;
  }

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    newPasswordConfirmFocusNode?.dispose();
    newPasswordConfirmTextController?.dispose();
  }
}
