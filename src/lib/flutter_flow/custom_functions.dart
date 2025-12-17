import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? mergeLists(
  List<String>? list1,
  List<String>? list2,
) {
  List<String> mergedList = [...?list1, ...?list2].toSet().toList();

  return mergedList;
}

String? emailValidation(String email) {
  // Check if email is empty
  if (email.isEmpty) {
    return 'Please enter an email address';
  }

  // Check if email ends with .edu (case insensitive)
  if (!email.toLowerCase().endsWith('.edu')) {
    return 'Please use a valid school email ending in .edu';
  }

  // Basic email format validation
  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
  if (!emailRegex.hasMatch(email)) {
    return 'Please enter a valid email format';
  }

  // If all checks pass, return null (no error)
  return null;
}

String? verifiedEmail(String email) {
// Check if email is empty
  if (email.isEmpty) {
    return 'Please enter an email address';
  }

// Check if email ends with .edu (case insensitive)
  if (!email.toLowerCase().endsWith('.edu')) {
    return 'Please use a valid school email ending in .edu';
  }

// Basic email format validation
  final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
  if (!emailRegex.hasMatch(email)) {
    return 'Please enter a valid email format';
  }

// If all checks pass, return null (no error)
  return null;
}

/// This code will take a string of text and calculate what the width of the
/// field it is displayed in should be
int calculateWidthOfField(String textString) {
  // This code will take a string of text and calculate what the width of the field it is displayed in should be. The maximum the width can be is 450
// Calculate the width based on the length of the text
  int width = (textString.length * 10)
      .clamp(0, 375); // Assuming each character is approximately 10 pixels wide
  return width;
}

/// This code will take a string of text and calculate what the width and
/// height of the field it is displayed in should be
int calculateHeightAndWidth(String textString) {
  // This code will take a string of text and calculate what the width and height of the field it is displayed in should be. The width should be calculated from the calculateWidthOfField function and the height should be calculated from that.
// Calculate the width of the text
  int calculatedWidth = (textString.length * 10).clamp(0, 375);

  // Calculate the height based on the width of the field
  int height = (textString.length / calculatedWidth).ceil() *
      20; // Assuming 20 is the height per line

  return height;
}

String? convertListToString(List<String>? listString) {
  // convert a string that is a list to a regular string
  if (listString == null) return null; // Return null if the input list is null
  return listString.join(
      ', '); // Join the list elements into a single string separated by commas
}

List<DocumentReference> docrefFromString(
  List<String> idList,
  String docPath,
) {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  List<DocumentReference> docList = <DocumentReference>[];

  idList.forEach((e) {
    docList.add(firebase.doc(docPath + e));
  });

  return docList;
}

List<DocumentReference> removeFriendsAndBlocks(
  List<DocumentReference> usersToRemove,
  List<DocumentReference> matches,
) {
  matches.removeWhere((e) => usersToRemove.contains(e));
  return matches;
}

List<DocumentReference> mergeDocRefs(
  List<DocumentReference> blocked,
  List<DocumentReference> blockedBy,
  List<DocumentReference> friends,
  List<DocumentReference> friendedBy,
) {
  return [...blocked, ...blockedBy, ...friends, ...friendedBy].toSet().toList();
}
