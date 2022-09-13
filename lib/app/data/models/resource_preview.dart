// Importing foundation.dart also imports classes to make an object
// nicely readable in Flutter's devtool.
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_preview.freezed.dart';
part 'resource_preview.g.dart';

///
@freezed
class ResourcePreview with _$ResourcePreview {
  ///
  const factory ResourcePreview({
    required int id,
    required int folderId,
    required String title,
    required String author,
    required String sourceVideoId,
    required bool isPlaylist,
    required int numVideos,
    required int numBookmarks,
    required int numNotes,
    required int numTodos,
    required double progress,
    required DateTime lastActivityAt,
    required Duration singleVideoDuration,
  }) = _ResourcePreview;

  ///
  factory ResourcePreview.fromJson(Map<String, Object?> json) =>
      _$ResourcePreviewFromJson(json);
}
