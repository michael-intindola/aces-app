// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SupportRecord> _$supportRecordSerializer =
    new _$SupportRecordSerializer();

class _$SupportRecordSerializer implements StructuredSerializer<SupportRecord> {
  @override
  final Iterable<Type> types = const [SupportRecord, _$SupportRecord];
  @override
  final String wireName = 'SupportRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SupportRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userRef;
    if (value != null) {
      result
        ..add('user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.submittedTime;
    if (value != null) {
      result
        ..add('submitted_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.resolvedTime;
    if (value != null) {
      result
        ..add('resolved_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.issueScreenshot;
    if (value != null) {
      result
        ..add('issue_screenshot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.issueDescription;
    if (value != null) {
      result
        ..add('issue_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contactNumber;
    if (value != null) {
      result
        ..add('contact_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  SupportRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupportRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user_ref':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'submitted_time':
          result.submittedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'resolved_time':
          result.resolvedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'issue_screenshot':
          result.issueScreenshot = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'issue_description':
          result.issueDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contact_number':
          result.contactNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$SupportRecord extends SupportRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final DateTime submittedTime;
  @override
  final DateTime resolvedTime;
  @override
  final String issueScreenshot;
  @override
  final String issueDescription;
  @override
  final String contactNumber;
  @override
  final DocumentReference<Object> reference;

  factory _$SupportRecord([void Function(SupportRecordBuilder) updates]) =>
      (new SupportRecordBuilder()..update(updates)).build();

  _$SupportRecord._(
      {this.userRef,
      this.submittedTime,
      this.resolvedTime,
      this.issueScreenshot,
      this.issueDescription,
      this.contactNumber,
      this.reference})
      : super._();

  @override
  SupportRecord rebuild(void Function(SupportRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupportRecordBuilder toBuilder() => new SupportRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupportRecord &&
        userRef == other.userRef &&
        submittedTime == other.submittedTime &&
        resolvedTime == other.resolvedTime &&
        issueScreenshot == other.issueScreenshot &&
        issueDescription == other.issueDescription &&
        contactNumber == other.contactNumber &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, userRef.hashCode), submittedTime.hashCode),
                        resolvedTime.hashCode),
                    issueScreenshot.hashCode),
                issueDescription.hashCode),
            contactNumber.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SupportRecord')
          ..add('userRef', userRef)
          ..add('submittedTime', submittedTime)
          ..add('resolvedTime', resolvedTime)
          ..add('issueScreenshot', issueScreenshot)
          ..add('issueDescription', issueDescription)
          ..add('contactNumber', contactNumber)
          ..add('reference', reference))
        .toString();
  }
}

class SupportRecordBuilder
    implements Builder<SupportRecord, SupportRecordBuilder> {
  _$SupportRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DateTime _submittedTime;
  DateTime get submittedTime => _$this._submittedTime;
  set submittedTime(DateTime submittedTime) =>
      _$this._submittedTime = submittedTime;

  DateTime _resolvedTime;
  DateTime get resolvedTime => _$this._resolvedTime;
  set resolvedTime(DateTime resolvedTime) =>
      _$this._resolvedTime = resolvedTime;

  String _issueScreenshot;
  String get issueScreenshot => _$this._issueScreenshot;
  set issueScreenshot(String issueScreenshot) =>
      _$this._issueScreenshot = issueScreenshot;

  String _issueDescription;
  String get issueDescription => _$this._issueDescription;
  set issueDescription(String issueDescription) =>
      _$this._issueDescription = issueDescription;

  String _contactNumber;
  String get contactNumber => _$this._contactNumber;
  set contactNumber(String contactNumber) =>
      _$this._contactNumber = contactNumber;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SupportRecordBuilder() {
    SupportRecord._initializeBuilder(this);
  }

  SupportRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _submittedTime = $v.submittedTime;
      _resolvedTime = $v.resolvedTime;
      _issueScreenshot = $v.issueScreenshot;
      _issueDescription = $v.issueDescription;
      _contactNumber = $v.contactNumber;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupportRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SupportRecord;
  }

  @override
  void update(void Function(SupportRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SupportRecord build() {
    final _$result = _$v ??
        new _$SupportRecord._(
            userRef: userRef,
            submittedTime: submittedTime,
            resolvedTime: resolvedTime,
            issueScreenshot: issueScreenshot,
            issueDescription: issueDescription,
            contactNumber: contactNumber,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
