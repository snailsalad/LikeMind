import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_creation_about_me_widget.dart'
    show ProfileCreationAboutMeWidget;
import 'package:flutter/material.dart';

class ProfileCreationAboutMeModel
    extends FlutterFlowModel<ProfileCreationAboutMeWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_pfpUpload = false;
  FFUploadedFile uploadedLocalFile_pfpUpload =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_pfpUpload = '';

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'First Name is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Last Name is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for AboutMe widget.
  FocusNode? aboutMeFocusNode;
  TextEditingController? aboutMeTextController;
  String? Function(BuildContext, String?)? aboutMeTextControllerValidator;
  String? _aboutMeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'About Me is required';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }
    if (val.length > 200) {
      return 'Maximum 200 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    aboutMeTextControllerValidator = _aboutMeTextControllerValidator;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    aboutMeFocusNode?.dispose();
    aboutMeTextController?.dispose();
  }
}
