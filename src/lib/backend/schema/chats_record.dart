import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "lastMessage" field.
  DocumentReference? _lastMessage;
  DocumentReference? get lastMessage => _lastMessage;
  bool hasLastMessage() => _lastMessage != null;

  // "lastMessageUser" field.
  DocumentReference? _lastMessageUser;
  DocumentReference? get lastMessageUser => _lastMessageUser;
  bool hasLastMessageUser() => _lastMessageUser != null;

  // "messages" field.
  List<DocumentReference>? _messages;
  List<DocumentReference> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  // "lastMessageTime" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _lastMessage = snapshotData['lastMessage'] as DocumentReference?;
    _lastMessageUser = snapshotData['lastMessageUser'] as DocumentReference?;
    _messages = getDataList(snapshotData['messages']);
    _lastMessageTime = snapshotData['lastMessageTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  DocumentReference? lastMessage,
  DocumentReference? lastMessageUser,
  DateTime? lastMessageTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastMessage': lastMessage,
      'lastMessageUser': lastMessageUser,
      'lastMessageTime': lastMessageTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageUser == e2?.lastMessageUser &&
        listEquality.equals(e1?.messages, e2?.messages) &&
        e1?.lastMessageTime == e2?.lastMessageTime;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.users,
        e?.lastMessage,
        e?.lastMessageUser,
        e?.messages,
        e?.lastMessageTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
