import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'aces_record.g.dart';

abstract class AcesRecord implements Built<AcesRecord, AcesRecordBuilder> {
  static Serializer<AcesRecord> get serializer => _$acesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_ref')
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: 'hobbies_interests')
  String get hobbiesInterests;

  @nullable
  @BuiltValueField(wireName: 'favorite_quote')
  String get favoriteQuote;

  @nullable
  String get website;

  @nullable
  String get instagram;

  @nullable
  String get tiktok;

  @nullable
  String get height;

  @nullable
  @BuiltValueField(wireName: 'hair_color')
  String get hairColor;

  @nullable
  @BuiltValueField(wireName: 'eye_color')
  String get eyeColor;

  @nullable
  @BuiltValueField(wireName: 'cup_size')
  String get cupSize;

  @nullable
  @BuiltValueField(wireName: 'waist_size')
  String get waistSize;

  @nullable
  @BuiltValueField(wireName: 'dress_size')
  String get dressSize;

  @nullable
  @BuiltValueField(wireName: 'shoe_size')
  String get shoeSize;

  @nullable
  bool get featured;

  @nullable
  @BuiltValueField(wireName: 'last_posted_photo_video')
  DateTime get lastPostedPhotoVideo;

  @nullable
  @BuiltValueField(wireName: 'last_posted_content')
  DateTime get lastPostedContent;

  @nullable
  @BuiltValueField(wireName: 'photo_count')
  int get photoCount;

  @nullable
  @BuiltValueField(wireName: 'video_count')
  int get videoCount;

  @nullable
  @BuiltValueField(wireName: 'content_count')
  int get contentCount;

  @nullable
  @BuiltValueField(wireName: 'subscriber_count')
  int get subscriberCount;

  @nullable
  @BuiltValueField(wireName: 'subscription_price')
  double get subscriptionPrice;

  @nullable
  @BuiltValueField(wireName: 'professional_photos')
  BuiltList<String> get professionalPhotos;

  @nullable
  @BuiltValueField(wireName: 'candid_photos')
  BuiltList<String> get candidPhotos;

  @nullable
  String get passion;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AcesRecordBuilder builder) => builder
    ..hobbiesInterests = ''
    ..favoriteQuote = ''
    ..website = ''
    ..instagram = ''
    ..tiktok = ''
    ..height = ''
    ..hairColor = ''
    ..eyeColor = ''
    ..cupSize = ''
    ..waistSize = ''
    ..dressSize = ''
    ..shoeSize = ''
    ..featured = false
    ..photoCount = 0
    ..videoCount = 0
    ..contentCount = 0
    ..subscriberCount = 0
    ..subscriptionPrice = 0.0
    ..professionalPhotos = ListBuilder()
    ..candidPhotos = ListBuilder()
    ..passion = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aces');

  static Stream<AcesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AcesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AcesRecord._();
  factory AcesRecord([void Function(AcesRecordBuilder) updates]) = _$AcesRecord;

  static AcesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAcesRecordData({
  DocumentReference userRef,
  String hobbiesInterests,
  String favoriteQuote,
  String website,
  String instagram,
  String tiktok,
  String height,
  String hairColor,
  String eyeColor,
  String cupSize,
  String waistSize,
  String dressSize,
  String shoeSize,
  bool featured,
  String applicationStatus,
  DateTime lastPostedPhotoVideo,
  DateTime lastPostedContent,
  int photoCount,
  int videoCount,
  int contentCount,
  int subscriberCount,
  double subscriptionPrice,
  String passion,
  List<String> professionalPhotos,
  List<String> candidPhotos,
}) =>
    serializers.toFirestore(
        AcesRecord.serializer,
        AcesRecord((a) => a
          ..userRef = userRef
          ..hobbiesInterests = hobbiesInterests
          ..favoriteQuote = favoriteQuote
          ..website = website
          ..instagram = instagram
          ..tiktok = tiktok
          ..height = height
          ..hairColor = hairColor
          ..eyeColor = eyeColor
          ..cupSize = cupSize
          ..waistSize = waistSize
          ..dressSize = dressSize
          ..shoeSize = shoeSize
          ..featured = featured
          ..lastPostedPhotoVideo = lastPostedPhotoVideo
          ..lastPostedContent = lastPostedContent
          ..photoCount = photoCount
          ..videoCount = videoCount
          ..contentCount = contentCount
          ..subscriberCount = subscriberCount
          ..subscriptionPrice = subscriptionPrice
          ..professionalPhotos = null
          ..candidPhotos = null
          ..passion = passion));
