import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'engagements_record.g.dart';

abstract class EngagementsRecord
    implements Built<EngagementsRecord, EngagementsRecordBuilder> {
  static Serializer<EngagementsRecord> get serializer =>
      _$engagementsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'content_ref')
  DocumentReference get contentRef;

  @nullable
  @BuiltValueField(wireName: 'is_favorite')
  bool get isFavorite;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EngagementsRecordBuilder builder) =>
      builder..isFavorite = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('engagements');

  static Stream<EngagementsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EngagementsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EngagementsRecord._();
  factory EngagementsRecord([void Function(EngagementsRecordBuilder) updates]) =
  _$EngagementsRecord;

  static EngagementsRecord getDocumentFromData(
      Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEngagementsRecordData({
  DocumentReference userRef,
  DocumentReference contentRef,
  bool isFavorite,
}) =>
    serializers.toFirestore(
        EngagementsRecord.serializer,
        EngagementsRecord((e) => e
          ..userRef = userRef
          ..contentRef = contentRef
          ..isFavorite = isFavorite));
