// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContentRecord> _$contentRecordSerializer =
    new _$ContentRecordSerializer();

class _$ContentRecordSerializer implements StructuredSerializer<ContentRecord> {
  @override
  final Iterable<Type> types = const [ContentRecord, _$ContentRecord];
  @override
  final String wireName = 'ContentRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ContentRecord object,
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
    value = object.contentType;
    if (value != null) {
      result
        ..add('content_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.featured;
    if (value != null) {
      result
        ..add('featured')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.heartCount;
    if (value != null) {
      result
        ..add('heart_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.photoCaption;
    if (value != null) {
      result
        ..add('photo_caption')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.videoCaption;
    if (value != null) {
      result
        ..add('video_caption')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.content;
    if (value != null) {
      result
        ..add('content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contentPhoto;
    if (value != null) {
      result
        ..add('content_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.contentTitle;
    if (value != null) {
      result
        ..add('content_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profilePreviewPhoto;
    if (value != null) {
      result
        ..add('profile_preview_photo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.profilePreviewVideo;
    if (value != null) {
      result
        ..add('profile_preview_video')
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
  ContentRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentRecordBuilder();

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
        case 'content_type':
          result.contentType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'featured':
          result.featured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'heart_count':
          result.heartCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'photo_caption':
          result.photoCaption = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video_caption':
          result.videoCaption = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content':
          result.content = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content_photo':
          result.contentPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'content_title':
          result.contentTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profile_preview_photo':
          result.profilePreviewPhoto = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'profile_preview_video':
          result.profilePreviewVideo = serializers.deserialize(value,
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

class _$ContentRecord extends ContentRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final String contentType;
  @override
  final bool featured;
  @override
  final DateTime createdTime;
  @override
  final int heartCount;
  @override
  final String photoCaption;
  @override
  final String videoCaption;
  @override
  final String photo;
  @override
  final String video;
  @override
  final String content;
  @override
  final String contentPhoto;
  @override
  final String contentTitle;
  @override
  final bool profilePreviewPhoto;
  @override
  final bool profilePreviewVideo;
  @override
  final DocumentReference<Object> reference;

  factory _$ContentRecord([void Function(ContentRecordBuilder) updates]) =>
      (new ContentRecordBuilder()..update(updates)).build();

  _$ContentRecord._(
      {this.userRef,
      this.contentType,
      this.featured,
      this.createdTime,
      this.heartCount,
      this.photoCaption,
      this.videoCaption,
      this.photo,
      this.video,
      this.content,
      this.contentPhoto,
      this.contentTitle,
      this.profilePreviewPhoto,
      this.profilePreviewVideo,
      this.reference})
      : super._();

  @override
  ContentRecord rebuild(void Function(ContentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentRecordBuilder toBuilder() => new ContentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentRecord &&
        userRef == other.userRef &&
        contentType == other.contentType &&
        featured == other.featured &&
        createdTime == other.createdTime &&
        heartCount == other.heartCount &&
        photoCaption == other.photoCaption &&
        videoCaption == other.videoCaption &&
        photo == other.photo &&
        video == other.video &&
        content == other.content &&
        contentPhoto == other.contentPhoto &&
        contentTitle == other.contentTitle &&
        profilePreviewPhoto == other.profilePreviewPhoto &&
        profilePreviewVideo == other.profilePreviewVideo &&
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                0,
                                                                userRef
                                                                    .hashCode),
                                                            contentType
                                                                .hashCode),
                                                        featured.hashCode),
                                                    createdTime.hashCode),
                                                heartCount.hashCode),
                                            photoCaption.hashCode),
                                        videoCaption.hashCode),
                                    photo.hashCode),
                                video.hashCode),
                            content.hashCode),
                        contentPhoto.hashCode),
                    contentTitle.hashCode),
                profilePreviewPhoto.hashCode),
            profilePreviewVideo.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContentRecord')
          ..add('userRef', userRef)
          ..add('contentType', contentType)
          ..add('featured', featured)
          ..add('createdTime', createdTime)
          ..add('heartCount', heartCount)
          ..add('photoCaption', photoCaption)
          ..add('videoCaption', videoCaption)
          ..add('photo', photo)
          ..add('video', video)
          ..add('content', content)
          ..add('contentPhoto', contentPhoto)
          ..add('contentTitle', contentTitle)
          ..add('profilePreviewPhoto', profilePreviewPhoto)
          ..add('profilePreviewVideo', profilePreviewVideo)
          ..add('reference', reference))
        .toString();
  }
}

class ContentRecordBuilder
    implements Builder<ContentRecord, ContentRecordBuilder> {
  _$ContentRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  String _contentType;
  String get contentType => _$this._contentType;
  set contentType(String contentType) => _$this._contentType = contentType;

  bool _featured;
  bool get featured => _$this._featured;
  set featured(bool featured) => _$this._featured = featured;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  int _heartCount;
  int get heartCount => _$this._heartCount;
  set heartCount(int heartCount) => _$this._heartCount = heartCount;

  String _photoCaption;
  String get photoCaption => _$this._photoCaption;
  set photoCaption(String photoCaption) => _$this._photoCaption = photoCaption;

  String _videoCaption;
  String get videoCaption => _$this._videoCaption;
  set videoCaption(String videoCaption) => _$this._videoCaption = videoCaption;

  String _photo;
  String get photo => _$this._photo;
  set photo(String photo) => _$this._photo = photo;

  String _video;
  String get video => _$this._video;
  set video(String video) => _$this._video = video;

  String _content;
  String get content => _$this._content;
  set content(String content) => _$this._content = content;

  String _contentPhoto;
  String get contentPhoto => _$this._contentPhoto;
  set contentPhoto(String contentPhoto) => _$this._contentPhoto = contentPhoto;

  String _contentTitle;
  String get contentTitle => _$this._contentTitle;
  set contentTitle(String contentTitle) => _$this._contentTitle = contentTitle;

  bool _profilePreviewPhoto;
  bool get profilePreviewPhoto => _$this._profilePreviewPhoto;
  set profilePreviewPhoto(bool profilePreviewPhoto) =>
      _$this._profilePreviewPhoto = profilePreviewPhoto;

  bool _profilePreviewVideo;
  bool get profilePreviewVideo => _$this._profilePreviewVideo;
  set profilePreviewVideo(bool profilePreviewVideo) =>
      _$this._profilePreviewVideo = profilePreviewVideo;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ContentRecordBuilder() {
    ContentRecord._initializeBuilder(this);
  }

  ContentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _contentType = $v.contentType;
      _featured = $v.featured;
      _createdTime = $v.createdTime;
      _heartCount = $v.heartCount;
      _photoCaption = $v.photoCaption;
      _videoCaption = $v.videoCaption;
      _photo = $v.photo;
      _video = $v.video;
      _content = $v.content;
      _contentPhoto = $v.contentPhoto;
      _contentTitle = $v.contentTitle;
      _profilePreviewPhoto = $v.profilePreviewPhoto;
      _profilePreviewVideo = $v.profilePreviewVideo;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContentRecord;
  }

  @override
  void update(void Function(ContentRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContentRecord build() {
    final _$result = _$v ??
        new _$ContentRecord._(
            userRef: userRef,
            contentType: contentType,
            featured: featured,
            createdTime: createdTime,
            heartCount: heartCount,
            photoCaption: photoCaption,
            videoCaption: videoCaption,
            photo: photo,
            video: video,
            content: content,
            contentPhoto: contentPhoto,
            contentTitle: contentTitle,
            profilePreviewPhoto: profilePreviewPhoto,
            profilePreviewVideo: profilePreviewVideo,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
