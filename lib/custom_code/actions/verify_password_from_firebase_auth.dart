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

// verify the old password referencing the authenticated user's credentials from Firebase Authentication. import the firebase auth if needed
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> verifyPasswordFromFirebaseAuth(
  String email,
  String password,
) async {
  try {
    // Get the current user
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return false;
    }

    // Create credential with the provided email and password
    AuthCredential credential = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    // Re-authenticate the user with the provided credentials
    await currentUser.reauthenticateWithCredential(credential);

    // If re-authentication succeeds, return true
    return true;
  } on FirebaseAuthException catch (e) {
    // Handle specific Firebase Auth errors
    print('Firebase Auth Error: ${e.code} - ${e.message}');
    return false;
  } catch (e) {
    // Handle any other errors
    print('Error verifying password: $e');
    return false;
  }
}
