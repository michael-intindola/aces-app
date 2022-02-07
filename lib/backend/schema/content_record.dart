import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'content_record.g.dart';

abstract class ContentRecord
    implements Built<ContentRecord, ContentRecordBuilder> {
  static Serializer<ContentRecord> get serializer => _$contentRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'content_type')
  String get contentType;

  @nullable
  bool get featured;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'heart_count')
  int get heartCount;

  @nullable
  @BuiltValueField(wireName: 'photo_caption')
  String get photoCaption;

  @nullable
  @BuiltValueField(wireName: 'video_caption')
  String get videoCaption;

  @nullable
  String get photo;

  @nullable
  String get video;

  @nullable
  String get content;

  @nullable
  @BuiltValueField(wireName: 'content_photo')
  String get contentPhoto;

  @nullable
  @BuiltValueField(wireName: 'content_title')
  String get contentTitle;

  @nullable
  @BuiltValueField(wireName: 'profile_preview_photo')
  bool get profilePreviewPhoto;

  @nullable
  @BuiltValueField(wireName: 'profile_preview_video')
  bool get profilePreviewVideo;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ContentRecordBuilder builder) => builder
    ..contentType = ''
    ..featured = false
    ..heartCount = 0
    ..photoCaption = ''
    ..videoCaption = ''
    ..photo = ''
    ..video = ''
    ..content = ''
    ..contentPhoto = ''
    ..contentTitle = ''
    ..profilePreviewPhoto = false
    ..profilePreviewVideo = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('content');

  static Stream<ContentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ContentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ContentRecord._();
  factory ContentRecord([void Function(ContentRecordBuilder) updates]) =
  _$ContentRecord;

  static ContentRecord getDocumentFromData(
      Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createContentRecordData({
  DocumentReference userRef,
  String contentType,
  bool featured,
  DateTime createdTime,
  int heartCount,
  String photoCaption,
  String videoCaption,
  String photo,
  String video,
  String content,
  String contentPhoto,
  String contentTitle,
  bool profilePreviewPhoto,
  bool profilePreviewVideo,
}) =>
    serializers.toFirestore(
        ContentRecord.serializer,
        ContentRecord((c) => c
          ..userRef = userRef
          ..contentType = contentType
          ..featured = featured
          ..createdTime = createdTime
          ..heartCount = heartCount
          ..photoCaption = photoCaption
          ..videoCaption = videoCaption
          ..photo = photo
          ..video = video
          ..content = content
          ..contentPhoto = contentPhoto
          ..contentTitle = contentTitle
          ..profilePreviewPhoto = profilePreviewPhoto
          ..profilePreviewVideo = profilePreviewVideo));