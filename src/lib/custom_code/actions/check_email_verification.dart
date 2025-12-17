// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future checkEmailVerification(BuildContext context) async {
  // Get the current user
  User? currentUser = FirebaseAuth.instance.currentUser;

  // Check if user is logged in
  if (currentUser == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No user logged in')),
    );
    return;
  }

  // Reload user to get latest verification status
  await currentUser.reload();
  currentUser = FirebaseAuth.instance.currentUser;

  // Check if email is verified
  if (!currentUser!.emailVerified) {
    // Email NOT verified - show error and log out
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
            'Please verify your .edu email before logging in. Check your inbox!'),
        duration: Duration(seconds: 4),
      ),
    );

    // Log out the user
    await FirebaseAuth.instance.signOut();
  } else {
    // Email IS verified - navigate to profile creation
    context.pushNamed('profileCreationSchoolSelect');
  }
}
