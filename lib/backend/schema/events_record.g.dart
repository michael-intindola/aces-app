// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EventsRecord> _$eventsRecordSerializer =
    new _$EventsRecordSerializer();

class _$EventsRecordSerializer implements StructuredSerializer<EventsRecord> {
  @override
  final Iterable<Type> types = const [EventsRecord, _$EventsRecord];
  @override
  final String wireName = 'EventsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, EventsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.featured;
    if (value != null) {
      result
        ..add('featured')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.eventName;
    if (value != null) {
      result
        ..add('event_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventLocation;
    if (value != null) {
      result
        ..add('event_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventPhoto;
    if (value != null) {
      result
        ..add('event_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attendeeCount;
    if (value != null) {
      result
        ..add('attendee_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.eventTicketLink;
    if (value != null) {
      result
        ..add('event_ticket_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventDate;
    if (value != null) {
      result
        ..add('event_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.eventShortDescription;
    if (value != null) {
      result
        ..add('event_short_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eventDescription;
    if (value != null) {
      result
        ..add('event_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.aceExclusive;
    if (value != null) {
      result
        ..add('ace_exclusive')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.openToFans;
    if (value != null) {
      result
        ..add('open_to_fans')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  EventsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EventsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'featured':
          result.featured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'event_name':
          result.eventName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event_location':
          result.eventLocation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event_photo':
          result.eventPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'attendee_count':
          result.attendeeCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'event_ticket_link':
          result.eventTicketLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event_date':
          result.eventDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'event_short_description':
          result.eventShortDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event_description':
          result.eventDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ace_exclusive':
          result.aceExclusive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'open_to_fans':
          result.openToFans = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$EventsRecord extends EventsRecord {
  @override
  final bool featured;
  @override
  final String eventName;
  @override
  final String eventLocation;
  @override
  final String eventPhoto;
  @override
  final int attendeeCount;
  @override
  final String eventTicketLink;
  @override
  final DateTime eventDate;
  @override
  final String eventShortDescription;
  @override
  final String eventDescription;
  @override
  final bool aceExclusive;
  @override
  final bool openToFans;
  @override
  final DocumentReference<Object> reference;

  factory _$EventsRecord([void Function(EventsRecordBuilder) updates]) =>
      (new EventsRecordBuilder()..update(updates)).build();

  _$EventsRecord._(
      {this.featured,
      this.eventName,
      this.eventLocation,
      this.eventPhoto,
      this.attendeeCount,
      this.eventTicketLink,
      this.eventDate,
      this.eventShortDescription,
      this.eventDescription,
      this.aceExclusive,
      this.openToFans,
      this.reference})
      : super._();

  @override
  EventsRecord rebuild(void Function(EventsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventsRecordBuilder toBuilder() => new EventsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventsRecord &&
        featured == other.featured &&
        eventName == other.eventName &&
        eventLocation == other.eventLocation &&
        eventPhoto == other.eventPhoto &&
        attendeeCount == other.attendeeCount &&
        eventTicketLink == other.eventTicketLink &&
        eventDate == other.eventDate &&
        eventShortDescription == other.eventShortDescription &&
        eventDescription == other.eventDescription &&
        aceExclusive == other.aceExclusive &&
        openToFans == other.openToFans &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, featured.hashCode),
                                                eventName.hashCode),
                                            eventLocation.hashCode),
                                        eventPhoto.hashCode),
                                    attendeeCount.hashCode),
                                eventTicketLink.hashCode),
                            eventDate.hashCode),
                        eventShortDescription.hashCode),
                    eventDescription.hashCode),
                aceExclusive.hashCode),
            openToFans.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EventsRecord')
          ..add('featured', featured)
          ..add('eventName', eventName)
          ..add('eventLocation', eventLocation)
          ..add('eventPhoto', eventPhoto)
          ..add('attendeeCount', attendeeCount)
          ..add('eventTicketLink', eventTicketLink)
          ..add('eventDate', eventDate)
          ..add('eventShortDescription', eventShortDescription)
          ..add('eventDescription', eventDescription)
          ..add('aceExclusive', aceExclusive)
          ..add('openToFans', openToFans)
          ..add('reference', reference))
        .toString();
  }
}

class EventsRecordBuilder
    implements Builder<EventsRecord, EventsRecordBuilder> {
  _$EventsRecord _$v;

  bool _featured;
  bool get featured => _$this._featured;
  set featured(bool featured) => _$this._featured = featured;

  String _eventName;
  String get eventName => _$this._eventName;
  set eventName(String eventName) => _$this._eventName = eventName;

  String _eventLocation;
  String get eventLocation => _$this._eventLocation;
  set eventLocation(String eventLocation) =>
      _$this._eventLocation = eventLocation;

  String _eventPhoto;
  String get eventPhoto => _$this._eventPhoto;
  set eventPhoto(String eventPhoto) => _$this._eventPhoto = eventPhoto;

  int _attendeeCount;
  int get attendeeCount => _$this._attendeeCount;
  set attendeeCount(int attendeeCount) => _$this._attendeeCount = attendeeCount;

  String _eventTicketLink;
  String get eventTicketLink => _$this._eventTicketLink;
  set eventTicketLink(String eventTicketLink) =>
      _$this._eventTicketLink = eventTicketLink;

  DateTime _eventDate;
  DateTime get eventDate => _$this._eventDate;
  set eventDate(DateTime eventDate) => _$this._eventDate = eventDate;

  String _eventShortDescription;
  String get eventShortDescription => _$this._eventShortDescription;
  set eventShortDescription(String eventShortDescription) =>
      _$this._eventShortDescription = eventShortDescription;

  String _eventDescription;
  String get eventDescription => _$this._eventDescription;
  set eventDescription(String eventDescription) =>
      _$this._eventDescription = eventDescription;

  bool _aceExclusive;
  bool get aceExclusive => _$this._aceExclusive;
  set aceExclusive(bool aceExclusive) => _$this._aceExclusive = aceExclusive;

  bool _openToFans;
  bool get openToFans => _$this._openToFans;
  set openToFans(bool openToFans) => _$this._openToFans = openToFans;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  EventsRecordBuilder() {
    EventsRecord._initializeBuilder(this);
  }

  EventsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _featured = $v.featured;
      _eventName = $v.eventName;
      _eventLocation = $v.eventLocation;
      _eventPhoto = $v.eventPhoto;
      _attendeeCount = $v.attendeeCount;
      _eventTicketLink = $v.eventTicketLink;
      _eventDate = $v.eventDate;
      _eventShortDescription = $v.eventShortDescription;
      _eventDescription = $v.eventDescription;
      _aceExclusive = $v.aceExclusive;
      _openToFans = $v.openToFans;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventsRecord;
  }

  @override
  void update(void Function(EventsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EventsRecord build() {
    final _$result = _$v ??
        new _$EventsRecord._(
            featured: featured,
            eventName: eventName,
            eventLocation: eventLocation,
            eventPhoto: eventPhoto,
            attendeeCount: attendeeCount,
            eventTicketLink: eventTicketLink,
            eventDate: eventDate,
            eventShortDescription: eventShortDescription,
            eventDescription: eventDescription,
            aceExclusive: aceExclusive,
            openToFans: openToFans,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
