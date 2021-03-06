// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aces_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AcesRecord> _$acesRecordSerializer = new _$AcesRecordSerializer();

class _$AcesRecordSerializer implements StructuredSerializer<AcesRecord> {
  @override
  final Iterable<Type> types = const [AcesRecord, _$AcesRecord];
  @override
  final String wireName = 'AcesRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AcesRecord object,
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
    value = object.hobbiesInterests;
    if (value != null) {
      result
        ..add('hobbies_interests')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favoriteQuote;
    if (value != null) {
      result
        ..add('favorite_quote')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.website;
    if (value != null) {
      result
        ..add('website')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instagram;
    if (value != null) {
      result
        ..add('instagram')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tiktok;
    if (value != null) {
      result
        ..add('tiktok')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hairColor;
    if (value != null) {
      result
        ..add('hair_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.eyeColor;
    if (value != null) {
      result
        ..add('eye_color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cupSize;
    if (value != null) {
      result
        ..add('cup_size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.waistSize;
    if (value != null) {
      result
        ..add('waist_size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dressSize;
    if (value != null) {
      result
        ..add('dress_size')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shoeSize;
    if (value != null) {
      result
        ..add('shoe_size')
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
    value = object.lastPostedPhotoVideo;
    if (value != null) {
      result
        ..add('last_posted_photo_video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lastPostedContent;
    if (value != null) {
      result
        ..add('last_posted_content')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photoCount;
    if (value != null) {
      result
        ..add('photo_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.videoCount;
    if (value != null) {
      result
        ..add('video_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.contentCount;
    if (value != null) {
      result
        ..add('content_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subscriberCount;
    if (value != null) {
      result
        ..add('subscriber_count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.subscriptionPrice;
    if (value != null) {
      result
        ..add('subscription_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.professionalPhotos;
    if (value != null) {
      result
        ..add('professional_photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.candidPhotos;
    if (value != null) {
      result
        ..add('candid_photos')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.passion;
    if (value != null) {
      result
        ..add('passion')
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
  AcesRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AcesRecordBuilder();

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
        case 'hobbies_interests':
          result.hobbiesInterests = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'favorite_quote':
          result.favoriteQuote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'website':
          result.website = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instagram':
          result.instagram = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tiktok':
          result.tiktok = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'hair_color':
          result.hairColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'eye_color':
          result.eyeColor = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cup_size':
          result.cupSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'waist_size':
          result.waistSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dress_size':
          result.dressSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'shoe_size':
          result.shoeSize = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'featured':
          result.featured = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'last_posted_photo_video':
          result.lastPostedPhotoVideo = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'last_posted_content':
          result.lastPostedContent = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'photo_count':
          result.photoCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'video_count':
          result.videoCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'content_count':
          result.contentCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subscriber_count':
          result.subscriberCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subscription_price':
          result.subscriptionPrice = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'professional_photos':
          result.professionalPhotos.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'candid_photos':
          result.candidPhotos.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'passion':
          result.passion = serializers.deserialize(value,
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

class _$AcesRecord extends AcesRecord {
  @override
  final DocumentReference<Object> userRef;
  @override
  final String hobbiesInterests;
  @override
  final String favoriteQuote;
  @override
  final String website;
  @override
  final String instagram;
  @override
  final String tiktok;
  @override
  final String height;
  @override
  final String hairColor;
  @override
  final String eyeColor;
  @override
  final String cupSize;
  @override
  final String waistSize;
  @override
  final String dressSize;
  @override
  final String shoeSize;
  @override
  final bool featured;
  @override
  final DateTime lastPostedPhotoVideo;
  @override
  final DateTime lastPostedContent;
  @override
  final int photoCount;
  @override
  final int videoCount;
  @override
  final int contentCount;
  @override
  final int subscriberCount;
  @override
  final double subscriptionPrice;
  @override
  final BuiltList<String> professionalPhotos;
  @override
  final BuiltList<String> candidPhotos;
  @override
  final String passion;
  @override
  final DocumentReference<Object> reference;

  factory _$AcesRecord([void Function(AcesRecordBuilder) updates]) =>
      (new AcesRecordBuilder()..update(updates)).build();

  _$AcesRecord._(
      {this.userRef,
      this.hobbiesInterests,
      this.favoriteQuote,
      this.website,
      this.instagram,
      this.tiktok,
      this.height,
      this.hairColor,
      this.eyeColor,
      this.cupSize,
      this.waistSize,
      this.dressSize,
      this.shoeSize,
      this.featured,
      this.lastPostedPhotoVideo,
      this.lastPostedContent,
      this.photoCount,
      this.videoCount,
      this.contentCount,
      this.subscriberCount,
      this.subscriptionPrice,
      this.professionalPhotos,
      this.candidPhotos,
      this.passion,
      this.reference})
      : super._();

  @override
  AcesRecord rebuild(void Function(AcesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcesRecordBuilder toBuilder() => new AcesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcesRecord &&
        userRef == other.userRef &&
        hobbiesInterests == other.hobbiesInterests &&
        favoriteQuote == other.favoriteQuote &&
        website == other.website &&
        instagram == other.instagram &&
        tiktok == other.tiktok &&
        height == other.height &&
        hairColor == other.hairColor &&
        eyeColor == other.eyeColor &&
        cupSize == other.cupSize &&
        waistSize == other.waistSize &&
        dressSize == other.dressSize &&
        shoeSize == other.shoeSize &&
        featured == other.featured &&
        lastPostedPhotoVideo == other.lastPostedPhotoVideo &&
        lastPostedContent == other.lastPostedContent &&
        photoCount == other.photoCount &&
        videoCount == other.videoCount &&
        contentCount == other.contentCount &&
        subscriberCount == other.subscriberCount &&
        subscriptionPrice == other.subscriptionPrice &&
        professionalPhotos == other.professionalPhotos &&
        candidPhotos == other.candidPhotos &&
        passion == other.passion &&
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc(0, userRef.hashCode), hobbiesInterests.hashCode), favoriteQuote.hashCode), website.hashCode), instagram.hashCode), tiktok.hashCode),
                                                                                height.hashCode),
                                                                            hairColor.hashCode),
                                                                        eyeColor.hashCode),
                                                                    cupSize.hashCode),
                                                                waistSize.hashCode),
                                                            dressSize.hashCode),
                                                        shoeSize.hashCode),
                                                    featured.hashCode),
                                                lastPostedPhotoVideo.hashCode),
                                            lastPostedContent.hashCode),
                                        photoCount.hashCode),
                                    videoCount.hashCode),
                                contentCount.hashCode),
                            subscriberCount.hashCode),
                        subscriptionPrice.hashCode),
                    professionalPhotos.hashCode),
                candidPhotos.hashCode),
            passion.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AcesRecord')
          ..add('userRef', userRef)
          ..add('hobbiesInterests', hobbiesInterests)
          ..add('favoriteQuote', favoriteQuote)
          ..add('website', website)
          ..add('instagram', instagram)
          ..add('tiktok', tiktok)
          ..add('height', height)
          ..add('hairColor', hairColor)
          ..add('eyeColor', eyeColor)
          ..add('cupSize', cupSize)
          ..add('waistSize', waistSize)
          ..add('dressSize', dressSize)
          ..add('shoeSize', shoeSize)
          ..add('featured', featured)
          ..add('lastPostedPhotoVideo', lastPostedPhotoVideo)
          ..add('lastPostedContent', lastPostedContent)
          ..add('photoCount', photoCount)
          ..add('videoCount', videoCount)
          ..add('contentCount', contentCount)
          ..add('subscriberCount', subscriberCount)
          ..add('subscriptionPrice', subscriptionPrice)
          ..add('professionalPhotos', professionalPhotos)
          ..add('candidPhotos', candidPhotos)
          ..add('passion', passion)
          ..add('reference', reference))
        .toString();
  }
}

class AcesRecordBuilder implements Builder<AcesRecord, AcesRecordBuilder> {
  _$AcesRecord _$v;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  String _hobbiesInterests;
  String get hobbiesInterests => _$this._hobbiesInterests;
  set hobbiesInterests(String hobbiesInterests) =>
      _$this._hobbiesInterests = hobbiesInterests;

  String _favoriteQuote;
  String get favoriteQuote => _$this._favoriteQuote;
  set favoriteQuote(String favoriteQuote) =>
      _$this._favoriteQuote = favoriteQuote;

  String _website;
  String get website => _$this._website;
  set website(String website) => _$this._website = website;

  String _instagram;
  String get instagram => _$this._instagram;
  set instagram(String instagram) => _$this._instagram = instagram;

  String _tiktok;
  String get tiktok => _$this._tiktok;
  set tiktok(String tiktok) => _$this._tiktok = tiktok;

  String _height;
  String get height => _$this._height;
  set height(String height) => _$this._height = height;

  String _hairColor;
  String get hairColor => _$this._hairColor;
  set hairColor(String hairColor) => _$this._hairColor = hairColor;

  String _eyeColor;
  String get eyeColor => _$this._eyeColor;
  set eyeColor(String eyeColor) => _$this._eyeColor = eyeColor;

  String _cupSize;
  String get cupSize => _$this._cupSize;
  set cupSize(String cupSize) => _$this._cupSize = cupSize;

  String _waistSize;
  String get waistSize => _$this._waistSize;
  set waistSize(String waistSize) => _$this._waistSize = waistSize;

  String _dressSize;
  String get dressSize => _$this._dressSize;
  set dressSize(String dressSize) => _$this._dressSize = dressSize;

  String _shoeSize;
  String get shoeSize => _$this._shoeSize;
  set shoeSize(String shoeSize) => _$this._shoeSize = shoeSize;

  bool _featured;
  bool get featured => _$this._featured;
  set featured(bool featured) => _$this._featured = featured;

  DateTime _lastPostedPhotoVideo;
  DateTime get lastPostedPhotoVideo => _$this._lastPostedPhotoVideo;
  set lastPostedPhotoVideo(DateTime lastPostedPhotoVideo) =>
      _$this._lastPostedPhotoVideo = lastPostedPhotoVideo;

  DateTime _lastPostedContent;
  DateTime get lastPostedContent => _$this._lastPostedContent;
  set lastPostedContent(DateTime lastPostedContent) =>
      _$this._lastPostedContent = lastPostedContent;

  int _photoCount;
  int get photoCount => _$this._photoCount;
  set photoCount(int photoCount) => _$this._photoCount = photoCount;

  int _videoCount;
  int get videoCount => _$this._videoCount;
  set videoCount(int videoCount) => _$this._videoCount = videoCount;

  int _contentCount;
  int get contentCount => _$this._contentCount;
  set contentCount(int contentCount) => _$this._contentCount = contentCount;

  int _subscriberCount;
  int get subscriberCount => _$this._subscriberCount;
  set subscriberCount(int subscriberCount) =>
      _$this._subscriberCount = subscriberCount;

  double _subscriptionPrice;
  double get subscriptionPrice => _$this._subscriptionPrice;
  set subscriptionPrice(double subscriptionPrice) =>
      _$this._subscriptionPrice = subscriptionPrice;

  ListBuilder<String> _professionalPhotos;
  ListBuilder<String> get professionalPhotos =>
      _$this._professionalPhotos ??= new ListBuilder<String>();
  set professionalPhotos(ListBuilder<String> professionalPhotos) =>
      _$this._professionalPhotos = professionalPhotos;

  ListBuilder<String> _candidPhotos;
  ListBuilder<String> get candidPhotos =>
      _$this._candidPhotos ??= new ListBuilder<String>();
  set candidPhotos(ListBuilder<String> candidPhotos) =>
      _$this._candidPhotos = candidPhotos;

  String _passion;
  String get passion => _$this._passion;
  set passion(String passion) => _$this._passion = passion;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AcesRecordBuilder() {
    AcesRecord._initializeBuilder(this);
  }

  AcesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userRef = $v.userRef;
      _hobbiesInterests = $v.hobbiesInterests;
      _favoriteQuote = $v.favoriteQuote;
      _website = $v.website;
      _instagram = $v.instagram;
      _tiktok = $v.tiktok;
      _height = $v.height;
      _hairColor = $v.hairColor;
      _eyeColor = $v.eyeColor;
      _cupSize = $v.cupSize;
      _waistSize = $v.waistSize;
      _dressSize = $v.dressSize;
      _shoeSize = $v.shoeSize;
      _featured = $v.featured;
      _lastPostedPhotoVideo = $v.lastPostedPhotoVideo;
      _lastPostedContent = $v.lastPostedContent;
      _photoCount = $v.photoCount;
      _videoCount = $v.videoCount;
      _contentCount = $v.contentCount;
      _subscriberCount = $v.subscriberCount;
      _subscriptionPrice = $v.subscriptionPrice;
      _professionalPhotos = $v.professionalPhotos?.toBuilder();
      _candidPhotos = $v.candidPhotos?.toBuilder();
      _passion = $v.passion;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AcesRecord;
  }

  @override
  void update(void Function(AcesRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AcesRecord build() {
    _$AcesRecord _$result;
    try {
      _$result = _$v ??
          new _$AcesRecord._(
              userRef: userRef,
              hobbiesInterests: hobbiesInterests,
              favoriteQuote: favoriteQuote,
              website: website,
              instagram: instagram,
              tiktok: tiktok,
              height: height,
              hairColor: hairColor,
              eyeColor: eyeColor,
              cupSize: cupSize,
              waistSize: waistSize,
              dressSize: dressSize,
              shoeSize: shoeSize,
              featured: featured,
              lastPostedPhotoVideo: lastPostedPhotoVideo,
              lastPostedContent: lastPostedContent,
              photoCount: photoCount,
              videoCount: videoCount,
              contentCount: contentCount,
              subscriberCount: subscriberCount,
              subscriptionPrice: subscriptionPrice,
              professionalPhotos: _professionalPhotos?.build(),
              candidPhotos: _candidPhotos?.build(),
              passion: passion,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'professionalPhotos';
        _professionalPhotos?.build();
        _$failedField = 'candidPhotos';
        _candidPhotos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AcesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
