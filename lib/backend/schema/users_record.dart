import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get username;

  @nullable
  String get city;

  @nullable
  String get state;

  @nullable
  String get dob;

  @nullable
  @BuiltValueField(wireName: 'ace_ref')
  DocumentReference get aceRef;

  @nullable
  @BuiltValueField(wireName: 'fan_ref')
  DocumentReference get fanRef;

  @nullable
  @BuiltValueField(wireName: 'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: 'last_name')
  String get lastName;

  @nullable
  String get country;

  @nullable
  @BuiltValueField(wireName: 'ace_approved')
  bool get aceApproved;

  @nullable
  @BuiltValueField(wireName: 'fan_approved')
  bool get fanApproved;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..username = ''
    ..city = ''
    ..state = ''
    ..dob = ''
    ..firstName = ''
    ..lastName = ''
    ..country = ''
    ..aceApproved = false
    ..fanApproved = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
  _$UsersRecord;

  static UsersRecord getDocumentFromData(
      Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String username,
  String city,
  String state,
  String dob,
  DocumentReference aceRef,
  DocumentReference fanRef,
  String firstName,
  String lastName,
  String country,
  bool aceApproved,
  bool fanApproved,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..username = username
          ..city = city
          ..state = state
          ..dob = dob
          ..aceRef = aceRef
          ..fanRef = fanRef
          ..firstName = firstName
          ..lastName = lastName
          ..country = country
          ..aceApproved = aceApproved
          ..fanApproved = fanApproved));
