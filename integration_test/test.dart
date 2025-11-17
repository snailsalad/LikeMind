import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:like_mind/flutter_flow/flutter_flow_drop_down.dart';
import 'package:like_mind/flutter_flow/flutter_flow_icon_button.dart';
import 'package:like_mind/flutter_flow/flutter_flow_widgets.dart';
import 'package:like_mind/flutter_flow/flutter_flow_theme.dart';
import 'package:like_mind/index.dart';
import 'package:like_mind/main.dart';
import 'package:like_mind/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:like_mind/backend/firebase/firebase_config.dart';
import 'package:like_mind/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  testWidgets('US1 Account Creation Unit Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.enterText(find.byKey(const ValueKey('SignUpEmail_uigm')),
        'accounttest@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('SignupPassword_5py5')), 'Password123!');
    await tester.enterText(
        find.byKey(const ValueKey('SignUpConfirm_ggcb')), 'Password123!');
    await tester.tap(find.byKey(const ValueKey('SignUpButton_2nw2')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    expect(find.text('Choose Your School'), findsWidgets);
  });

  testWidgets('US2 Account Login Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.tap(find.byKey(const ValueKey('LoginTab_giet')));
    await tester.enterText(
        find.byKey(const ValueKey('LoginEmail_z4g2')), 'dickbutt@aol.com');
    await tester.enterText(
        find.byKey(const ValueKey('LoginPassword_950w')), 'Password123!');
    await tester.tap(find.byKey(const ValueKey('LoginButton_styz')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    expect(find.text('Profile'), findsWidgets);
  });

  testWidgets('US3 Profile Creation Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.tap(find.byKey(const ValueKey('SchoolSelect_ckna')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.tap(find.byKey(const ValueKey('SchoolSelect_ckna')));
    await tester.tap(find.byKey(const ValueKey('MajorSelect_v843')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.tap(find.byKey(const ValueKey('MajorSelect_v843')));
    await tester.enterText(
        find.byKey(const ValueKey('SchoolYear_tyi1')), '2026');
    await tester.tap(find.byKey(const ValueKey('Submit_uw1s')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    await tester.enterText(
        find.byKey(const ValueKey('FirstName_89sc')), 'First Name');
    await tester.enterText(
        find.byKey(const ValueKey('LastName_it8o')), 'Last Name');
    await tester.enterText(
        find.byKey(const ValueKey('AboutMe_oycn')), 'Test bot');
    await tester.tap(find.byKey(const ValueKey('Birthday_wvtv')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.tap(find.byKey(const ValueKey('Birthday_wvtv')));
    await tester.tap(find.byKey(const ValueKey('Next_4fa6')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    await tester.tap(find.byKey(const ValueKey('InterestChips_lq6v')));
    await tester.tap(find.byKey(const ValueKey('FinishButton_dotu')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    expect(find.text('Profile'), findsWidgets);
  });

  testWidgets('US4 Golden Path Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.tap(find.byKey(const ValueKey('matchProfileComponent_ti7e')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    await tester.tap(find.byKey(const ValueKey('Button_vv2s')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    expect(find.byKey(const ValueKey('SendButton_uu4q')), findsWidgets);
  });

  testWidgets('US5 Chat Messaging Test', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => FFAppState(),
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.enterText(
        find.byKey(const ValueKey('ChatField_dxuy')), 'Test Message');
    await tester.pumpAndSettle(const Duration(milliseconds: 2));
    await tester.tap(find.byKey(const ValueKey('SendButton_uu4q')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5));
    expect(find.text('Test Message'), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
