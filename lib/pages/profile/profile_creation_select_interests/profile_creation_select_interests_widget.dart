import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_creation_select_interests_model.dart';
export 'profile_creation_select_interests_model.dart';

class ProfileCreationSelectInterestsWidget extends StatefulWidget {
  const ProfileCreationSelectInterestsWidget({super.key});

  static String routeName = 'profileCreationSelectInterests';
  static String routePath = '/profileCreationSelectInterests';

  @override
  State<ProfileCreationSelectInterestsWidget> createState() =>
      _ProfileCreationSelectInterestsWidgetState();
}

class _ProfileCreationSelectInterestsWidgetState
    extends State<ProfileCreationSelectInterestsWidget> {
  late ProfileCreationSelectInterestsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCreationSelectInterestsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'profileCreationSelectInterests'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROFILE_CREATION_SELECT_INTERESTS_profil');
      logFirebaseEvent('profileCreationSelectInterests_google_an');
      logFirebaseEvent('select_interests_page');
      if (FFAppState().HobbiesList.length == 0) {
        logFirebaseEvent('profileCreationSelectInterests_backend_c');
        _model.hobbiesRes = await GetHobbiesCall.call();

        if ((_model.hobbiesRes?.succeeded ?? true)) {
          logFirebaseEvent('profileCreationSelectInterests_update_ap');
          FFAppState().HobbiesList =
              ((_model.hobbiesRes?.jsonBody ?? '') as List)
                  .map<String>((e) => e.toString())
                  .toList()
                  .cast<String>()
                  .toList()
                  .cast<String>();
        }
      }
      if ((currentUserDocument?.interests.toList() ?? []).isNotEmpty) {
        logFirebaseEvent('profileCreationSelectInterests_set_form_');
        _model.interestsDropDownValueController?.value =
            (currentUserDocument?.interests.toList() ?? []);
        _model.interestsDropDownValue =
            List.from((currentUserDocument?.interests.toList() ?? []));
        logFirebaseEvent('profileCreationSelectInterests_set_form_');
        _model.interestChipsValueController?.value =
            (currentUserDocument?.interests.toList() ?? []);
      }
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
    context.watch<FFAppState>();

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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AuthUserStreamWidget(
                  builder: (context) => Text(
                    'Welcome ${currentUserDisplayName}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Text(
                  'Please select your interests',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                FlutterFlowChoiceChips(
                  key: ValueKey('InterestChips_lq6v'),
                  options: [
                    ChipData('Reading'),
                    ChipData('Baking'),
                    ChipData('Hiking'),
                    ChipData('Video Games'),
                    ChipData('Music'),
                    ChipData('Photography'),
                    ChipData('Cycling'),
                    ChipData('Working out'),
                    ChipData('Fishing'),
                    ChipData('Traveling'),
                    ChipData('Pets'),
                    ChipData('Cars')
                  ],
                  onChanged: (val) =>
                      safeSetState(() => _model.interestChipsValues = val),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    iconColor: FlutterFlowTheme.of(context).info,
                    iconSize: 16.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 16.0,
                    elevation: 0.0,
                    borderColor: Color(0xFFB7410E),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  chipSpacing: 8.0,
                  rowSpacing: 8.0,
                  multiselect: true,
                  initialized: _model.interestChipsValues != null,
                  alignment: WrapAlignment.start,
                  controller: _model.interestChipsValueController ??=
                      FormFieldController<List<String>>(
                    [],
                  ),
                  wrapped: true,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  child: FlutterFlowDropDown<String>(
                    multiSelectController:
                        _model.interestsDropDownValueController ??=
                            FormListFieldController<String>(null),
                    options: FFAppState().HobbiesList,
                    width: double.infinity,
                    height: 40.0,
                    searchHintTextStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                    searchTextStyle: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                    hintText: 'Additional Interests...',
                    searchHintText: 'Search...',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFFB7410E),
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: Color(0xFFB7410E),
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: true,
                    isMultiSelect: true,
                    onMultiSelectChanged: (val) =>
                        safeSetState(() => _model.interestsDropDownValue = val),
                  ),
                ),
                FFButtonWidget(
                  key: ValueKey('FinishButton_dotu'),
                  onPressed: () async {
                    logFirebaseEvent(
                        'PROFILE_CREATION_SELECT_INTERESTS_Finish');
                    logFirebaseEvent('FinishButton_backend_call');

                    await currentUserReference!.update({
                      ...createUsersRecordData(
                        finishedOnboarding: true,
                      ),
                      ...mapToFirestore(
                        {
                          'Interests': functions.mergeLists(
                              _model.interestChipsValues?.toList(),
                              _model.interestsDropDownValue?.toList()),
                        },
                      ),
                    });
                    logFirebaseEvent('FinishButton_google_analytics_event');
                    logFirebaseEvent('interests_finish_button');
                    logFirebaseEvent('FinishButton_navigate_to');

                    context.pushNamed(ProfilePageWidget.routeName);
                  },
                  text: 'Finish',
                  options: FFButtonOptions(
                    width: 100.0,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFFFFD343),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Color(0xFFB7410E),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
