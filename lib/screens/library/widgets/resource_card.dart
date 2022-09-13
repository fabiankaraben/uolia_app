import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uolia_app/app/data/models/resource_preview.dart';
import 'package:uolia_app/utils/extensions/duration.dart';
import 'package:uolia_app/utils/icons/uolia_icons.dart';

///
class ResourceCard extends StatelessWidget {
  ///
  const ResourceCard({
    super.key,
    required this.resourcePreview,
  });

  ///
  final ResourcePreview resourcePreview;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            _ImageSection(resourcePreview: resourcePreview),
            _DetailsAndMenuSection(resourcePreview: resourcePreview),
          ],
        ),
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({
    required this.resourcePreview,
  });

  final ResourcePreview resourcePreview;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _ResourceImage(videoId: resourcePreview.sourceVideoId),
        if (resourcePreview.isPlaylist)
          _PlaylistResourceImageInformation(resourcePreview: resourcePreview)
        else
          _OneVideoResourceImageInformation(resourcePreview: resourcePreview),
        _ResourceProgressIndicator(value: resourcePreview.progress),
      ],
    );
  }
}

class _ResourceImage extends StatelessWidget {
  const _ResourceImage({
    required this.videoId,
  });

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 320 / 180,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
        child: Image.network(
          'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}

class _PlaylistResourceImageInformation extends StatelessWidget {
  const _PlaylistResourceImageInformation({
    required this.resourcePreview,
  });

  final ResourcePreview resourcePreview;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 0,
      child: Container(
        color: Colors.black.withOpacity(.8),
        width: 140,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    resourcePreview.numVideos.toString(),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 5),
                  const Icon(
                    UoliaIcons.playlist,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _ProgressAsString(resourcePreview: resourcePreview),
            ),
          ],
        ),
      ),
    );
  }
}

class _OneVideoResourceImageInformation extends StatelessWidget {
  const _OneVideoResourceImageInformation({
    required this.resourcePreview,
  });

  final ResourcePreview resourcePreview;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      bottom: 12,
      child: Container(
        // Note: the space over and under the text is different on web
        padding: const EdgeInsets.fromLTRB(12, kIsWeb ? 13 : 15, 12, 9),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.8),
          borderRadius: BorderRadius.circular(3),
        ),
        child: _ProgressAsString(resourcePreview: resourcePreview),
      ),
    );
  }
}

class _ProgressAsString extends StatelessWidget {
  const _ProgressAsString({
    required this.resourcePreview,
  });

  final ResourcePreview resourcePreview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          resourcePreview.isPlaylist
              ? (resourcePreview.numVideos * resourcePreview.progress)
                  .toInt()
                  .toString()
              : (resourcePreview.singleVideoDuration * resourcePreview.progress)
                  .hHMMSSFormat(),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.white,
                height: .2,
              ),
        ),
        const SizedBox(width: 5),
        Text(
          l10n.ofLower,
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: const Color(0xFFC3C3C3),
                height: .2,
              ),
        ),
        const SizedBox(width: 5),
        Text(
          resourcePreview.isPlaylist
              ? resourcePreview.numVideos.toString()
              : resourcePreview.singleVideoDuration.hHMMSSFormat(),
          style: Theme.of(context).textTheme.caption!.copyWith(
                color: Colors.white,
                height: .2,
              ),
        ),
      ],
    );
  }
}

class _ResourceProgressIndicator extends StatelessWidget {
  const _ResourceProgressIndicator({
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: LinearProgressIndicator(
        backgroundColor: Colors.black.withOpacity(.3),
        color: Colors.red,
        value: value,
        minHeight: 3.5,
      ),
    );
  }
}

class _DetailsAndMenuSection extends StatelessWidget {
  const _DetailsAndMenuSection({
    required this.resourcePreview,
  });

  final ResourcePreview resourcePreview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 10, 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resourcePreview.title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 5),
                DefaultTextStyle(
                  style: Theme.of(context).textTheme.caption!,
                  child: Row(
                    children: [
                      Tooltip(
                        message: l10n.author,
                        child: Text(resourcePreview.author),
                      ),
                      const Text(' · '),
                      Tooltip(
                        message: l10n.lastActivity,
                        child: Text(
                          resourcePreview.lastActivityAt
                              .subtract(const Duration(seconds: 1))
                              .relative(appendIfAfter: 'ago'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _ResourceCardMenuButton(resourcePreview: resourcePreview),
        ],
      ),
    );
  }
}

enum _MenuOptions {
  rename,
  remove,
}

class _ResourceCardMenuButton extends StatelessWidget {
  const _ResourceCardMenuButton({
    required this.resourcePreview,
  });

  final ResourcePreview resourcePreview;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopupMenuButton<_MenuOptions>(
      icon: const Icon(UoliaIcons.more_vert, size: 15),
      offset: const Offset(0, 35),
      onSelected: (_MenuOptions result) {
        if (result == _MenuOptions.rename) {
          //
          // _homeCtrl.showRenameResourceDialog(resource);
        } else if (result == _MenuOptions.remove) {
          //
          // _homeCtrl.showDeleteResourceDialog(resource);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_MenuOptions>>[
        PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.rename,
          child: Text(l10n.rename),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.remove,
          child: Text(
            l10n.deleteResource,
            style: TextStyle(color: Theme.of(context).errorColor),
          ),
        ),
      ],
    );
  }
}
