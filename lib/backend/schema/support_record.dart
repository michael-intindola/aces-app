import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'support_record.g.dart';

abstract class SupportRecord
    implements Built<SupportRecord, SupportRecordBuilder> {
  static Serializer<SupportRecord> get serializer => _$supportRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'submitted_time')
  DateTime get submittedTime;

  @nullable
  @BuiltValueField(wireName: 'resolved_time')
  DateTime get resolvedTime;

  @nullable
  @BuiltValueField(wireName: 'issue_screenshot')
  String get issueScreenshot;

  @nullable
  @BuiltValueField(wireName: 'issue_description')
  String get issueDescription;

  @nullable
  @BuiltValueField(wireName: 'contact_number')
  String get contactNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SupportRecordBuilder builder) => builder
    ..issueScreenshot = ''
    ..issueDescription = ''
    ..contactNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('support');

  static Stream<SupportRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SupportRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SupportRecord._();
  factory SupportRecord([void Function(SupportRecordBuilder) updates]) =
      _$SupportRecord;

  static SupportRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSupportRecordData({
  DocumentReference userRef,
  DateTime submittedTime,
  DateTime resolvedTime,
  String issueScreenshot,
  String issueDescription,
  String contactNumber,
}) =>
    serializers.toFirestore(
        SupportRecord.serializer,
        SupportRecord((s) => s
          ..userRef = userRef
          ..submittedTime = submittedTime
          ..resolvedTime = resolvedTime
          ..issueScreenshot = issueScreenshot
          ..issueDescription = issueDescription
          ..contactNumber = contactNumber));
