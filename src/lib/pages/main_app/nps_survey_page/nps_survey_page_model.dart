import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/nps_survey/nps_survey_widget.dart';
import 'nps_survey_page_widget.dart' show NpsSurveyPageWidget;
import 'package:flutter/material.dart';

class NpsSurveyPageModel extends FlutterFlowModel<NpsSurveyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for npsSurvey component.
  late NpsSurveyModel npsSurveyModel;

  @override
  void initState(BuildContext context) {
    npsSurveyModel = createModel(context, () => NpsSurveyModel());
  }

  @override
  void dispose() {
    npsSurveyModel.dispose();
  }
}
