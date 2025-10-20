import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'load_in_page_model.dart';
export 'load_in_page_model.dart';

class LoadInPageWidget extends StatefulWidget {
  const LoadInPageWidget({super.key});

  static String routeName = 'loadInPage';
  static String routePath = '/loadInPage';

  @override
  State<LoadInPageWidget> createState() => _LoadInPageWidgetState();
}

class _LoadInPageWidgetState extends State<LoadInPageWidget> {
  late LoadInPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadInPageModel());
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
