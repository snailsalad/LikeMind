// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MainModelStruct extends FFFirebaseStruct {
  MainModelStruct({
    int? id,
    String? text,
    String? name,
    String? image,
    String? year,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _text = text,
        _name = name,
        _image = image,
        _year = year,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;

  bool hasYear() => _year != null;

  static MainModelStruct fromMap(Map<String, dynamic> data) => MainModelStruct(
        id: castToType<int>(data['id']),
        text: data['text'] as String?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        year: data['year'] as String?,
      );

  static MainModelStruct? maybeFromMap(dynamic data) => data is Map
      ? MainModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'text': _text,
        'name': _name,
        'image': _image,
        'year': _year,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
      }.withoutNulls;

  static MainModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      MainModelStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MainModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MainModelStruct &&
        id == other.id &&
        text == other.text &&
        name == other.name &&
        image == other.image &&
        year == other.year;
  }

  @override
  int get hashCode => const ListEquality().hash([id, text, name, image, year]);
}

MainModelStruct createMainModelStruct({
  int? id,
  String? text,
  String? name,
  String? image,
  String? year,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MainModelStruct(
      id: id,
      text: text,
      name: name,
      image: image,
      year: year,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MainModelStruct? updateMainModelStruct(
  MainModelStruct? mainModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mainModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMainModelStructData(
  Map<String, dynamic> firestoreData,
  MainModelStruct? mainModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mainModel == null) {
    return;
  }
  if (mainModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mainModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mainModelData = getMainModelFirestoreData(mainModel, forFieldValue);
  final nestedData = mainModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mainModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMainModelFirestoreData(
  MainModelStruct? mainModel, [
  bool forFieldValue = false,
]) {
  if (mainModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mainModel.toMap());

  // Add any Firestore field values
  mainModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMainModelListFirestoreData(
  List<MainModelStruct>? mainModels,
) =>
    mainModels?.map((e) => getMainModelFirestoreData(e, true)).toList() ?? [];
