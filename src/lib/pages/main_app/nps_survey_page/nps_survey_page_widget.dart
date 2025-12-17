import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/nps_survey/nps_survey_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'nps_survey_page_model.dart';
export 'nps_survey_page_model.dart';

class NpsSurveyPageWidget extends StatefulWidget {
  const NpsSurveyPageWidget({super.key});

  static String routeName = 'npsSurveyPage';
  static String routePath = '/npsSurveyPage';

  @override
  State<NpsSurveyPageWidget> createState() => _NpsSurveyPageWidgetState();
}

class _NpsSurveyPageWidgetState extends State<NpsSurveyPageWidget> {
  late NpsSurveyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NpsSurveyPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'npsSurveyPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('NPS_SURVEY_npsSurveyPage_ON_INIT_STATE');
      logFirebaseEvent('npsSurveyPage_google_analytics_event');
      logFirebaseEvent('survey_page');
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: colorFromCssString(
          getRemoteConfigString('backgroundColor'),
          defaultColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 500.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF1EFED),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: wrapWithModel(
                    model: _model.npsSurveyModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NpsSurveyWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
