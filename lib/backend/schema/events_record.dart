import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsRecord extends FirestoreRecord {
  EventsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_location" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  bool hasEventLocation() => _eventLocation != null;

  // "event_start" field.
  DateTime? _eventStart;
  DateTime? get eventStart => _eventStart;
  bool hasEventStart() => _eventStart != null;

  // "event_end" field.
  DateTime? _eventEnd;
  DateTime? get eventEnd => _eventEnd;
  bool hasEventEnd() => _eventEnd != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _eventLocation = snapshotData['event_location'] as String?;
    _eventStart = snapshotData['event_start'] as DateTime?;
    _eventEnd = snapshotData['event_end'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('events')
          : FirebaseFirestore.instance.collectionGroup('events');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('events').doc(id);

  static Stream<EventsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventsRecord.fromSnapshot(s));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventsRecord.fromSnapshot(s));

  static EventsRecord fromSnapshot(DocumentSnapshot snapshot) => EventsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventsRecordData({
  String? eventName,
  String? eventLocation,
  DateTime? eventStart,
  DateTime? eventEnd,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'event_location': eventLocation,
      'event_start': eventStart,
      'event_end': eventEnd,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventsRecordDocumentEquality implements Equality<EventsRecord> {
  const EventsRecordDocumentEquality();

  @override
  bool equals(EventsRecord? e1, EventsRecord? e2) {
    return e1?.eventName == e2?.eventName &&
        e1?.eventLocation == e2?.eventLocation &&
        e1?.eventStart == e2?.eventStart &&
        e1?.eventEnd == e2?.eventEnd;
  }

  @override
  int hash(EventsRecord? e) => const ListEquality()
      .hash([e?.eventName, e?.eventLocation, e?.eventStart, e?.eventEnd]);

  @override
  bool isValidKey(Object? o) => o is EventsRecord;
}
