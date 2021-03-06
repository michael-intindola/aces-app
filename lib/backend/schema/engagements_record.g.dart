// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engagements_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<EngagementsRecord> _$engagementsRecordSerializer =
    new _$EngagementsRecordSerializer();

class _$EngagementsRecordSerializer
    implements StructuredSerializer<EngagementsRecord> {
  @override
  final Iterable<Type> types = const [EngagementsRecord, _$EngagementsRecord];
  @override
  final String wireName = 'EngagementsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, EngagementsRecord object,
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
    value = object.contentRef;
    if (value != null) {
      result
        ..add('content_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.isFavorite;
    if (value != null) {
      result
        ..add('is_favorite')
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
  EngagementsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EngagementsRecordBuilder();

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
        case 'content_ref':
          result.contentRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'is_favorite':
          result.isFavorite = serializers.deserialize(value,
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

class _$EngagementsRecord extends EngagementsRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final DocumentReference<Object> contentRef;
  @override
  final bool isFavorite;
  @override
  final DocumentReference<Object> reference;

  factory _$EngagementsRecord(
          [void Function(EngagementsRecordBuilder) updates]) =>
      (new EngagementsRecordBuilder()..update(updates)).build();

  _$EngagementsRecord._(
      {this.userRef, this.contentRef, this.isFavorite, this.reference})
      : super._();

  @override
  EngagementsRecord rebuild(void Function(EngagementsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EngagementsRecordBuilder toBuilder() =>
      new EngagementsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EngagementsRecord &&
        userRef == other.userRef &&
        contentRef == other.contentRef &&
        isFavorite == other.isFavorite &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, userRef.hashCode), contentRef.hashCode),
            isFavorite.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EngagementsRecord')
          ..add('userRef', userRef)
          ..add('contentRef', contentRef)
          ..add('isFavorite', isFavorite)
          ..add('reference', reference))
        .toString();
  }
}

class EngagementsRecordBuilder
    implements Builder<EngagementsRecord, EngagementsRecordBuilder> {
  _$EngagementsRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  DocumentReference<Object> _contentRef;
  DocumentReference<Object> get contentRef => _$this._contentRef;
  set contentRef(DocumentReference<Object> contentRef) =>
      _$this._contentRef = contentRef;

  bool _isFavorite;
  bool get isFavorite => _$this._isFavorite;
  set isFavorite(bool isFavorite) => _$this._isFavorite = isFavorite;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  EngagementsRecordBuilder() {
    EngagementsRecord._initializeBuilder(this);
  }

  EngagementsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _contentRef = $v.contentRef;
      _isFavorite = $v.isFavorite;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EngagementsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EngagementsRecord;
  }

  @override
  void update(void Function(EngagementsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EngagementsRecord build() {
    final _$result = _$v ??
        new _$EngagementsRecord._(
            userRef: userRef,
            contentRef: contentRef,
            isFavorite: isFavorite,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
