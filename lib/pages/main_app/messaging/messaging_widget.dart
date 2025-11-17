import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/message/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'messaging_model.dart';
export 'messaging_model.dart';

class MessagingWidget extends StatefulWidget {
  const MessagingWidget({
    super.key,
    required this.chatRef,
    required this.viewedTime,
  });

  final DocumentReference? chatRef;
  final DateTime? viewedTime;

  static String routeName = 'messaging';
  static String routePath = '/messaging';

  @override
  State<MessagingWidget> createState() => _MessagingWidgetState();
}

class _MessagingWidgetState extends State<MessagingWidget> {
  late MessagingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessagingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'messaging'});
    _model.chatFieldTextController ??= TextEditingController();
    _model.chatFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    reverse: true,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      StreamBuilder<List<MessagesRecord>>(
                        stream: queryMessagesRecord(
                          parent: widget.chatRef,
                          queryBuilder: (messagesRecord) => messagesRecord
                              .where(
                                'timestamp',
                                isGreaterThanOrEqualTo: widget.viewedTime,
                              )
                              .orderBy('timestamp', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<MessagesRecord> newListViewMessagesRecordList =
                              snapshot.data!;

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            reverse: true,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: newListViewMessagesRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(height: 4.0),
                            itemBuilder: (context, newListViewIndex) {
                              final newListViewMessagesRecord =
                                  newListViewMessagesRecordList[
                                      newListViewIndex];
                              return MessageWidget(
                                key: Key(
                                    'Key0v2_${newListViewIndex}_of_${newListViewMessagesRecordList.length}'),
                                message: newListViewMessagesRecord,
                              );
                            },
                          );
                        },
                      ),
                      PagedListView<DocumentSnapshot<Object?>?,
                          MessagesRecord>.separated(
                        pagingController: _model.setOldListViewController(
                            MessagesRecord.collection(widget.chatRef)
                                .where(
                                  'timestamp',
                                  isLessThan: widget.viewedTime,
                                )
                                .orderBy('timestamp', descending: true),
                            parent: widget.chatRef),
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        reverse: true,
                        scrollDirection: Axis.vertical,
                        separatorBuilder: (_, __) => SizedBox(height: 4.0),
                        builderDelegate:
                            PagedChildBuilderDelegate<MessagesRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),
                          // Customize what your widget looks like when it's loading another page.
                          newPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, oldListViewIndex) {
                            final oldListViewMessagesRecord = _model
                                .oldListViewPagingController!
                                .itemList![oldListViewIndex];
                            return MessageWidget(
                              key: Key(
                                  'Keyqk2_${oldListViewIndex}_of_${_model.oldListViewPagingController!.itemList!.length}'),
                              message: oldListViewMessagesRecord,
                            );
                          },
                        ),
                      ),
                    ].divide(SizedBox(height: 4.0)),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 200.0,
                        child: TextFormField(
                          key: ValueKey('ChatField_dxuy'),
                          controller: _model.chatFieldTextController,
                          focusNode: _model.chatFieldFocusNode,
                          autofocus: false,
                          enabled: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                            hintText: 'Message',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          enableInteractiveSelection: true,
                          validator: _model.chatFieldTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    FFButtonWidget(
                      key: ValueKey('SendButton_uu4q'),
                      onPressed: () async {
                        logFirebaseEvent('MESSAGING_PAGE_SendButton_ON_TAP');
                        logFirebaseEvent('SendButton_backend_call');

                        var messagesRecordReference =
                            MessagesRecord.createDoc(widget.chatRef!);
                        await messagesRecordReference
                            .set(createMessagesRecordData(
                          senderID: currentUserReference,
                          content: _model.chatFieldTextController.text,
                          timestamp: getCurrentTimestamp,
                        ));
                        _model.lastMsgOut = MessagesRecord.getDocumentFromData(
                            createMessagesRecordData(
                              senderID: currentUserReference,
                              content: _model.chatFieldTextController.text,
                              timestamp: getCurrentTimestamp,
                            ),
                            messagesRecordReference);
                        logFirebaseEvent('SendButton_backend_call');

                        await widget.chatRef!.update(createChatsRecordData(
                          lastMessageUser: currentUserReference,
                          lastMessage: _model.lastMsgOut?.reference,
                          lastMessageTime: getCurrentTimestamp,
                        ));
                        logFirebaseEvent('SendButton_reset_form_fields');
                        safeSetState(() {
                          _model.chatFieldTextController?.clear();
                        });

                        safeSetState(() {});
                      },
                      text: 'Send',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
