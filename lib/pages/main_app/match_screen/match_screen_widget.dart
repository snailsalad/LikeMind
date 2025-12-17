import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/components/match_profile_component/match_profile_component_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_screen_model.dart';
export 'match_screen_model.dart';

class MatchScreenWidget extends StatefulWidget {
  const MatchScreenWidget({super.key});

  static String routeName = 'MatchScreen';
  static String routePath = '/matchScreen';

  @override
  State<MatchScreenWidget> createState() => _MatchScreenWidgetState();
}

class _MatchScreenWidgetState extends State<MatchScreenWidget> {
  late MatchScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchScreenModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MatchScreen'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('MATCH_SCREEN_MatchScreen_ON_INIT_STATE');
      logFirebaseEvent('MatchScreen_google_analytics_event');
      logFirebaseEvent('matched_screen_page');
      logFirebaseEvent('MatchScreen_update_app_state');
      FFAppState().insertAtIndexInEmptyList(0, currentUserReference!);
      safeSetState(() {});
      logFirebaseEvent('MatchScreen_backend_call');
      _model.apiResultlkm = await MatchingCall.call(
        userid: currentUserUid,
      );

      if ((_model.apiResultlkm?.succeeded ?? true)) {
        logFirebaseEvent('MatchScreen_update_app_state');
        FFAppState().temp = functions
            .mergeDocRefs(
                ((currentUserDocument?.blocked.toList() ?? []).isNotEmpty
                        ? (currentUserDocument?.blocked.toList() ?? [])
                        : FFAppState().emptyList)
                    .toList(),
                ((currentUserDocument?.blockedBy.toList() ?? []).isNotEmpty
                        ? (currentUserDocument?.blockedBy.toList() ?? [])
                        : FFAppState().emptyList)
                    .toList(),
                ((currentUserDocument?.friends.toList() ?? []).isNotEmpty
                        ? (currentUserDocument?.friends.toList() ?? [])
                        : FFAppState().emptyList)
                    .toList(),
                ((currentUserDocument?.friendsWithUser.toList() ?? [])
                            .isNotEmpty
                        ? (currentUserDocument?.friendsWithUser.toList() ?? [])
                        : FFAppState().emptyList)
                    .toList())
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
        logFirebaseEvent('MatchScreen_update_app_state');
        FFAppState().matchesListRefs = functions
            .removeFriendsAndBlocks(
                FFAppState().temp.toList(),
                functions
                    .docrefFromString(
                        MatchingCall.userIds(
                          (_model.apiResultlkm?.jsonBody ?? ''),
                        )!
                            .toList(),
                        '/users/')
                    .toList())
            .toList()
            .cast<DocumentReference>();
        safeSetState(() {});
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: colorFromCssString(
              getRemoteConfigString('backgroundColor'),
              defaultColor: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/LikeMindLogoOnlyTransparent.png',
                        width: 65.0,
                        height: 65.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Like',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text: 'Mind',
                              style: GoogleFonts.roboto(
                                color: Color(0xFFFFD343),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.asset(
                        'assets/images/filter-black.png',
                        width: 24.0,
                        height: 24.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MATCH_SCREEN_PAGE_Image_cj105l2b_ON_TAP');
                        logFirebaseEvent('Image_navigate_to');

                        context.pushNamed(FriendRequestPageWidget.routeName);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/black_notification.png',
                          width: 24.0,
                          height: 24.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]
                      .divide(SizedBox(width: 16.0))
                      .addToStart(SizedBox(width: 33.0))
                      .addToEnd(SizedBox(width: 16.0)),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    16.0,
                    0,
                    16.0,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final userDocRef = FFAppState()
                              .matchesListRefs
                              .toList()
                              .take(6)
                              .toList();

                          return Wrap(
                            spacing: 12.0,
                            runSpacing: 12.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(userDocRef.length,
                                (userDocRefIndex) {
                              final userDocRefItem =
                                  userDocRef[userDocRefIndex];
                              return StreamBuilder<UsersRecord>(
                                stream: UsersRecord.getDocument(userDocRefItem),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  final matchProfileComponentUsersRecord =
                                      snapshot.data!;

                                  return Container(
                                    key: ValueKey('matchProfileComponent_ti7e'),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'MATCH_SCREEN_Container_lcv9bu0s_ON_TAP');
                                        logFirebaseEvent(
                                            'matchProfileComponent_navigate_to');

                                        context.pushNamed(
                                          MatchProfileWidget.routeName,
                                          queryParameters: {
                                            'matchedUser': serializeParam(
                                              matchProfileComponentUsersRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'matchedUser':
                                                matchProfileComponentUsersRecord,
                                          },
                                        );
                                      },
                                      child: MatchProfileComponentWidget(
                                        key: Key(
                                            'Keylcv_${userDocRefIndex}_of_${userDocRef.length}'),
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              810.0) {
                                            return ((MediaQuery.sizeOf(context)
                                                        .width -
                                                    48) *
                                                1 /
                                                2);
                                          } else if ((MediaQuery.sizeOf(context)
                                                      .width >=
                                                  810.0) &&
                                              (MediaQuery.sizeOf(context)
                                                      .width <
                                                  1280.0)) {
                                            return ((MediaQuery.sizeOf(context)
                                                        .width -
                                                    80) *
                                                1 /
                                                4);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width >=
                                              1280.0) {
                                            return ((MediaQuery.sizeOf(context)
                                                        .width -
                                                    112) *
                                                1 /
                                                6);
                                          } else {
                                            return ((MediaQuery.sizeOf(context)
                                                        .width -
                                                    144) *
                                                1 /
                                                8);
                                          }
                                        }(),
                                        matches: 'Match 90%',
                                        name: matchProfileComponentUsersRecord
                                            .displayName,
                                        major: matchProfileComponentUsersRecord
                                            .major,
                                        image: matchProfileComponentUsersRecord
                                            .photoUrl,
                                        isLike: true,
                                        details:
                                            matchProfileComponentUsersRecord
                                                .aboutMe,
                                        user: matchProfileComponentUsersRecord,
                                        ontap: () async {},
                                        isLiketap: () async {},
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ].addToStart(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
