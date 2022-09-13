import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uolia_app/app/data/models/folder.dart';
import 'package:uolia_app/app/data/models/resource_preview.dart';
import 'package:uolia_app/screens/account/account_routes.dart';
import 'package:uolia_app/screens/library/widgets/folder_card.dart';
import 'package:uolia_app/screens/library/widgets/resource_card.dart';
import 'package:uolia_app/utils/icons/uolia_icons.dart';

/// Library Screen
class LibraryScreen extends ConsumerWidget {
  /// Library Screen
  LibraryScreen({super.key});

  final _mainScrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    // final locale = ref.watch(localeProvider);

    const mockFolder = Folder(
      id: 0,
      title: 'A folder',
      folderId: 0,
    );

    final mockResourcePreview = ResourcePreview(
      id: 0,
      title: 'A Course',
      author: 'The author',
      folderId: 0,
      isPlaylist: false,
      lastActivityAt: DateTime.now().toUtc().subtract(const Duration(hours: 3)),
      numBookmarks: 0,
      numNotes: 0,
      numTodos: 0,
      numVideos: 0,
      progress: .6,
      singleVideoDuration: const Duration(minutes: 5),
      sourceVideoId: '0iGawG2BTVo',
    );

    final mockResourcePreviewPlaylist = mockResourcePreview.copyWith(
      isPlaylist: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.yourLibraries),
        actions: [
          IconButton(
            icon: const Icon(UoliaIcons.account),
            onPressed: () {
              context.go(AccountRoutes.route.path);
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SelectionArea(
        child: Column(
          children: [
            const SubAppBar(),
            Expanded(
              child: Scrollbar(
                controller: _mainScrollController,
                thumbVisibility: MediaQuery.of(context).size.width > 500,
                child: ListView(
                  controller: _mainScrollController,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  children: [
                    for (int i = 0; i < 2; i++)
                      const FolderCard(
                        folder: mockFolder,
                      ),
                    for (int i = 0; i < 2; i++)
                      ResourceCard(
                        resourcePreview: mockResourcePreview,
                      ),
                    for (int i = 0; i < 2; i++)
                      ResourceCard(
                        resourcePreview: mockResourcePreviewPlaylist,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
class SubAppBar extends StatelessWidget {
  ///
  const SubAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text('Library name'),
          ),
          IconButton(
            icon: const Icon(UoliaIcons.new_folder),
            color: Theme.of(context).appBarTheme.actionsIconTheme!.color,
            iconSize: 18,
            onPressed: () {
              context.go(AccountRoutes.route.path);
            },
          ),
          IconButton(
            icon: const Icon(UoliaIcons.more_vert),
            color: Theme.of(context).appBarTheme.actionsIconTheme!.color,
            iconSize: 18,
            onPressed: () {
              context.go(AccountRoutes.route.path);
            },
          ),
        ],
      ),
    );
  }
}
