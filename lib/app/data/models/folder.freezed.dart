// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'folder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Folder _$FolderFromJson(Map<String, dynamic> json) {
  return _Folder.fromJson(json);
}

/// @nodoc
mixin _$Folder {
  int get id => throw _privateConstructorUsedError;
  int get folderId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolderCopyWith<Folder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolderCopyWith<$Res> {
  factory $FolderCopyWith(Folder value, $Res Function(Folder) then) =
      _$FolderCopyWithImpl<$Res>;
  $Res call({int id, int folderId, String title});
}

/// @nodoc
class _$FolderCopyWithImpl<$Res> implements $FolderCopyWith<$Res> {
  _$FolderCopyWithImpl(this._value, this._then);

  final Folder _value;
  // ignore: unused_field
  final $Res Function(Folder) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? folderId = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      folderId: folderId == freezed
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_FolderCopyWith<$Res> implements $FolderCopyWith<$Res> {
  factory _$$_FolderCopyWith(_$_Folder value, $Res Function(_$_Folder) then) =
      __$$_FolderCopyWithImpl<$Res>;
  @override
  $Res call({int id, int folderId, String title});
}

/// @nodoc
class __$$_FolderCopyWithImpl<$Res> extends _$FolderCopyWithImpl<$Res>
    implements _$$_FolderCopyWith<$Res> {
  __$$_FolderCopyWithImpl(_$_Folder _value, $Res Function(_$_Folder) _then)
      : super(_value, (v) => _then(v as _$_Folder));

  @override
  _$_Folder get _value => super._value as _$_Folder;

  @override
  $Res call({
    Object? id = freezed,
    Object? folderId = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_Folder(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      folderId: folderId == freezed
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Folder extends _Folder {
  const _$_Folder(
      {required this.id, required this.folderId, required this.title})
      : super._();

  factory _$_Folder.fromJson(Map<String, dynamic> json) =>
      _$$_FolderFromJson(json);

  @override
  final int id;
  @override
  final int folderId;
  @override
  final String title;

  @override
  String toString() {
    return 'Folder(id: $id, folderId: $folderId, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Folder &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.folderId, folderId) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(folderId),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  _$$_FolderCopyWith<_$_Folder> get copyWith =>
      __$$_FolderCopyWithImpl<_$_Folder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FolderToJson(
      this,
    );
  }
}

abstract class _Folder extends Folder {
  const factory _Folder(
      {required final int id,
      required final int folderId,
      required final String title}) = _$_Folder;
  const _Folder._() : super._();

  factory _Folder.fromJson(Map<String, dynamic> json) = _$_Folder.fromJson;

  @override
  int get id;
  @override
  int get folderId;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_FolderCopyWith<_$_Folder> get copyWith =>
      throw _privateConstructorUsedError;
}
