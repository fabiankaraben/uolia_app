// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResourcePreview _$$_ResourcePreviewFromJson(Map<String, dynamic> json) =>
    _$_ResourcePreview(
      id: json['id'] as int,
      folderId: json['folderId'] as int,
      title: json['title'] as String,
      author: json['author'] as String,
      sourceVideoId: json['sourceVideoId'] as String,
      isPlaylist: json['isPlaylist'] as bool,
      numVideos: json['numVideos'] as int,
      numBookmarks: json['numBookmarks'] as int,
      numNotes: json['numNotes'] as int,
      numTodos: json['numTodos'] as int,
      progress: (json['progress'] as num).toDouble(),
      lastActivityAt: DateTime.parse(json['lastActivityAt'] as String),
      singleVideoDuration:
          Duration(microseconds: json['singleVideoDuration'] as int),
    );

Map<String, dynamic> _$$_ResourcePreviewToJson(_$_ResourcePreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'folderId': instance.folderId,
      'title': instance.title,
      'author': instance.author,
      'sourceVideoId': instance.sourceVideoId,
      'isPlaylist': instance.isPlaylist,
      'numVideos': instance.numVideos,
      'numBookmarks': instance.numBookmarks,
      'numNotes': instance.numNotes,
      'numTodos': instance.numTodos,
      'progress': instance.progress,
      'lastActivityAt': instance.lastActivityAt.toIso8601String(),
      'singleVideoDuration': instance.singleVideoDuration.inMicroseconds,
    };
