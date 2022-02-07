import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'events_record.g.dart';

abstract class EventsRecord
    implements Built<EventsRecord, EventsRecordBuilder> {
  static Serializer<EventsRecord> get serializer => _$eventsRecordSerializer;

  @nullable
  bool get featured;

  @nullable
  @BuiltValueField(wireName: 'event_name')
  String get eventName;

  @nullable
  @BuiltValueField(wireName: 'event_location')
  String get eventLocation;

  @nullable
  @BuiltValueField(wireName: 'event_photo')
  String get eventPhoto;

  @nullable
  @BuiltValueField(wireName: 'attendee_count')
  int get attendeeCount;

  @nullable
  @BuiltValueField(wireName: 'event_ticket_link')
  String get eventTicketLink;

  @nullable
  @BuiltValueField(wireName: 'event_date')
  DateTime get eventDate;

  @nullable
  @BuiltValueField(wireName: 'event_short_description')
  String get eventShortDescription;

  @nullable
  @BuiltValueField(wireName: 'event_description')
  String get eventDescription;

  @nullable
  @BuiltValueField(wireName: 'ace_exclusive')
  bool get aceExclusive;

  @nullable
  @BuiltValueField(wireName: 'open_to_fans')
  bool get openToFans;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EventsRecordBuilder builder) => builder
    ..featured = false
    ..eventName = ''
    ..eventLocation = ''
    ..eventPhoto = ''
    ..attendeeCount = 0
    ..eventTicketLink = ''
    ..eventShortDescription = ''
    ..eventDescription = ''
    ..aceExclusive = false
    ..openToFans = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('events');

  static Stream<EventsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EventsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EventsRecord._();
  factory EventsRecord([void Function(EventsRecordBuilder) updates]) =
  _$EventsRecord;

  static EventsRecord getDocumentFromData(
      Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEventsRecordData({
  bool featured,
  String eventName,
  String eventLocation,
  String eventPhoto,
  int attendeeCount,
  String eventTicketLink,
  DateTime eventDate,
  String eventShortDescription,
  String eventDescription,
  bool aceExclusive,
  bool openToFans,
}) =>
    serializers.toFirestore(
        EventsRecord.serializer,
        EventsRecord((e) => e
          ..featured = featured
          ..eventName = eventName
          ..eventLocation = eventLocation
          ..eventPhoto = eventPhoto
          ..attendeeCount = attendeeCount
          ..eventTicketLink = eventTicketLink
          ..eventDate = eventDate
          ..eventShortDescription = eventShortDescription
          ..eventDescription = eventDescription
          ..aceExclusive = aceExclusive
          ..openToFans = openToFans));
