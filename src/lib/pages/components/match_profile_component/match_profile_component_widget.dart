import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'match_profile_component_model.dart';
export 'match_profile_component_model.dart';

class MatchProfileComponentWidget extends StatefulWidget {
  const MatchProfileComponentWidget({
    super.key,
    required this.width,
    required this.matches,
    required this.name,
    required this.major,
    required this.image,
    required this.details,
    required this.ontap,
    required this.isLiketap,
    bool? isLike,
    required this.user,
  }) : this.isLike = isLike ?? false;

  final double? width;
  final String? matches;
  final String? name;
  final String? major;
  final String? image;
  final String? details;
  final Future Function()? ontap;
  final Future Function()? isLiketap;
  final bool isLike;
  final UsersRecord? user;

  @override
  State<MatchProfileComponentWidget> createState() =>
      _MatchProfileComponentWidgetState();
}

class _MatchProfileComponentWidgetState
    extends State<MatchProfileComponentWidget> {
  late MatchProfileComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchProfileComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('MATCH_PROFILE_COMPONENT_Container_5u3wh0');
        logFirebaseEvent('Container_execute_callback');
        await widget.ontap?.call();
      },
      child: Container(
        width: valueOrDefault<double>(
          widget.width,
          165.0,
        ),
        height: 250.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(
              widget.image!,
            ).image,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('MATCH_PROFILE_COMPONENT_Column_t50wxg2l_');
            logFirebaseEvent('Column_navigate_to');

            context.pushNamed(
              MatchProfileWidget.routeName,
              queryParameters: {
                'matchedUser': serializeParam(
                  widget.user,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'matchedUser': widget.user,
              },
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'MATCH_PROFILE_COMPONENT_Container_o2rait');
                        logFirebaseEvent('Container_navigate_to');

                        context.pushNamed(
                          MatchProfileWidget.routeName,
                          queryParameters: {
                            'matchedUser': serializeParam(
                              widget.user,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'matchedUser': widget.user,
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD343),
                          borderRadius: BorderRadius.circular(999.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 4.0, 8.0, 4.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.matches,
                              'Match 90%',
                            ),
                            style: FlutterFlowTheme.of(context)
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
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.name,
                        'Student',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryYellow,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.major,
                        'Major',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).accentOchre,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
