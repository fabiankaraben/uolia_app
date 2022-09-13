// Importing foundation.dart also imports classes to make an object
// nicely readable in Flutter's devtool.
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'folder.freezed.dart';
part 'folder.g.dart';

///
@freezed
class Folder with _$Folder {
  ///
  const factory Folder({
    required int id,
    required int folderId,
    required String title,
  }) = _Folder;

  const Folder._();

  ///
  factory Folder.fromJson(Map<String, Object?> json) => _$FolderFromJson(json);

  ///
  int getNumSubfolders() {
    return 0;
  }

  ///
  int getNumResources() {
    return 0;
  }
}
