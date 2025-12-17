import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "Birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "Interests" field.
  List<String>? _interests;
  List<String> get interests => _interests ?? const [];
  bool hasInterests() => _interests != null;

  // "AboutMe" field.
  String? _aboutMe;
  String get aboutMe => _aboutMe ?? '';
  bool hasAboutMe() => _aboutMe != null;

  // "School" field.
  String? _school;
  String get school => _school ?? '';
  bool hasSchool() => _school != null;

  // "SchoolYear" field.
  int? _schoolYear;
  int get schoolYear => _schoolYear ?? 0;
  bool hasSchoolYear() => _schoolYear != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "Major" field.
  String? _major;
  String get major => _major ?? '';
  bool hasMajor() => _major != null;

  // "finishedOnboarding" field.
  bool? _finishedOnboarding;
  bool get finishedOnboarding => _finishedOnboarding ?? false;
  bool hasFinishedOnboarding() => _finishedOnboarding != null;

  // "loginCount" field.
  int? _loginCount;
  int get loginCount => _loginCount ?? 0;
  bool hasLoginCount() => _loginCount != null;

  // "blocked" field.
  List<DocumentReference>? _blocked;
  List<DocumentReference> get blocked => _blocked ?? const [];
  bool hasBlocked() => _blocked != null;

  // "blockedBy" field.
  List<DocumentReference>? _blockedBy;
  List<DocumentReference> get blockedBy => _blockedBy ?? const [];
  bool hasBlockedBy() => _blockedBy != null;

  // "friends" field.
  List<DocumentReference>? _friends;
  List<DocumentReference> get friends => _friends ?? const [];
  bool hasFriends() => _friends != null;

  // "friendsWithUser" field.
  List<DocumentReference>? _friendsWithUser;
  List<DocumentReference> get friendsWithUser => _friendsWithUser ?? const [];
  bool hasFriendsWithUser() => _friendsWithUser != null;

  // "pendingFriendRequest" field.
  List<DocumentReference>? _pendingFriendRequest;
  List<DocumentReference> get pendingFriendRequest =>
      _pendingFriendRequest ?? const [];
  bool hasPendingFriendRequest() => _pendingFriendRequest != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _firstName = snapshotData['FirstName'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _birthday = snapshotData['Birthday'] as DateTime?;
    _interests = getDataList(snapshotData['Interests']);
    _aboutMe = snapshotData['AboutMe'] as String?;
    _school = snapshotData['School'] as String?;
    _schoolYear = castToType<int>(snapshotData['SchoolYear']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _major = snapshotData['Major'] as String?;
    _finishedOnboarding = snapshotData['finishedOnboarding'] as bool?;
    _loginCount = castToType<int>(snapshotData['loginCount']);
    _blocked = getDataList(snapshotData['blocked']);
    _blockedBy = getDataList(snapshotData['blockedBy']);
    _friends = getDataList(snapshotData['friends']);
    _friendsWithUser = getDataList(snapshotData['friendsWithUser']);
    _pendingFriendRequest = getDataList(snapshotData['pendingFriendRequest']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? firstName,
  String? lastName,
  DateTime? birthday,
  String? aboutMe,
  String? school,
  int? schoolYear,
  String? phoneNumber,
  String? major,
  bool? finishedOnboarding,
  int? loginCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'FirstName': firstName,
      'LastName': lastName,
      'Birthday': birthday,
      'AboutMe': aboutMe,
      'School': school,
      'SchoolYear': schoolYear,
      'phone_number': phoneNumber,
      'Major': major,
      'finishedOnboarding': finishedOnboarding,
      'loginCount': loginCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.birthday == e2?.birthday &&
        listEquality.equals(e1?.interests, e2?.interests) &&
        e1?.aboutMe == e2?.aboutMe &&
        e1?.school == e2?.school &&
        e1?.schoolYear == e2?.schoolYear &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.major == e2?.major &&
        e1?.finishedOnboarding == e2?.finishedOnboarding &&
        e1?.loginCount == e2?.loginCount &&
        listEquality.equals(e1?.blocked, e2?.blocked) &&
        listEquality.equals(e1?.blockedBy, e2?.blockedBy) &&
        listEquality.equals(e1?.friends, e2?.friends) &&
        listEquality.equals(e1?.friendsWithUser, e2?.friendsWithUser) &&
        listEquality.equals(e1?.pendingFriendRequest, e2?.pendingFriendRequest);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.firstName,
        e?.lastName,
        e?.birthday,
        e?.interests,
        e?.aboutMe,
        e?.school,
        e?.schoolYear,
        e?.phoneNumber,
        e?.major,
        e?.finishedOnboarding,
        e?.loginCount,
        e?.blocked,
        e?.blockedBy,
        e?.friends,
        e?.friendsWithUser,
        e?.pendingFriendRequest
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
