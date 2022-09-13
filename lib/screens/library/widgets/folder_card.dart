import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uolia_app/app/data/models/folder.dart';
import 'package:uolia_app/utils/icons/uolia_icons.dart';

///
class FolderCard extends StatelessWidget {
  ///
  const FolderCard({
    super.key,
    required this.folder,
  });

  ///
  final Folder folder;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
          child: Row(
            children: [
              _FolderIcon(letter: folder.title[0].toUpperCase()),
              const SizedBox(width: 15),
              Expanded(
                child: _DetailsSection(folder: folder),
              ),
              _FolderCardMenuButton(folder: folder),
            ],
          ),
        ),
      ),
    );
  }
}

class _FolderIcon extends StatelessWidget {
  const _FolderIcon({
    required this.letter,
  });

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 53,
          child: Icon(
            UoliaIcons.folder,
            size: 41,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.only(bottom: kIsWeb ? 2 : 4),
            child: Text(
              letter,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Theme.of(context).primaryColor,
                    height: 1,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailsSection extends StatelessWidget {
  const _DetailsSection({
    required this.folder,
  });

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          folder.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 5),
        Text(
          '${l10n.numItems(folder.getNumResources())}'
          ' ${l10n.and} '
          '${l10n.numFolders(folder.getNumSubfolders())}',
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}

enum _MenuOptions {
  rename,
  remove,
}

class _FolderCardMenuButton extends StatelessWidget {
  const _FolderCardMenuButton({
    required this.folder,
  });

  final Folder folder;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return PopupMenuButton<_MenuOptions>(
      icon: const Icon(UoliaIcons.more_vert, size: 15),
      offset: const Offset(0, 35),
      onSelected: (_MenuOptions result) async {
        if (result == _MenuOptions.rename) {
          //
          // await _homeCtrl.showEditFolderDialog(folder);
        } else if (result == _MenuOptions.remove) {
          //
          // await _homeCtrl.showDeleteFolderDialog(folder);
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
            l10n.deleteFolder,
            style: TextStyle(color: Theme.of(context).errorColor),
          ),
        ),
      ],
    );
  }
}
