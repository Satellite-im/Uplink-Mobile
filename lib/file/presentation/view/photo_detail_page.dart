import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class PhotoDetailPage extends StatefulWidget {
  const PhotoDetailPage({super.key, required this.item});

  final Item item;

  @override
  State<PhotoDetailPage> createState() => _PhotoDetailPageState();
}

class _PhotoDetailPageState extends State<PhotoDetailPage> {
  final _itemListController = GetIt.I.get<ItemListBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
      bloc: _itemListController,
      builder: (context, state) => Scaffold(
        appBar: UAppBar.back(title: widget.item.name),
        body: Center(child: Image.file(widget.item.file)),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomAppBar(
            color: UColors.backgroundDark,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _itemListController
                          .add(SwitchFavoriteStatus(widget.item));
                    });
                  },
                  icon: UIcon(
                    UIcons.favorite,
                    color: widget.item.isFavorited
                        ? UColors.ctaBlue
                        : UColors.textMed,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final _arg = {
                      'item': widget.item,
                      'isRename': true,
                    };
                    final _fileName = await Navigator.of(context).pushNamed(
                      '/NameFilePage',
                      arguments: _arg,
                    ) as String?;

                    if (_fileName != null) {
                      setState(() {
                        _itemListController.add(
                          RenameItem(item: widget.item, name: _fileName),
                        );
                      });
                    }
                  },
                  icon: const UIcon(
                    UIcons.edit,
                    color: UColors.textMed,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO(yijing): Download item feature
                  },
                  icon: const UIcon(
                    UIcons.download,
                    color: UColors.textMed,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    UBottomSheetTwoButtons(
                      context,
                      header: 'Are you sure you want to remove this file?',
                      firstButtonText: UAppStrings.cancelButton,
                      firstButtonOnPressed: () {
                        Navigator.of(context).pop();
                      },
                      secondButtonText: UAppStrings.remove,
                      secondButtonColor: UColors.termRed,
                      secondButtonOnPressed: () {
                        _itemListController.add(RemoveSingleItem(widget.item));
                        Navigator.of(context)
                          ..pop()
                          ..pop();
                      },
                    ).show();
                  },
                  icon: const UIcon(
                    UIcons.remove,
                    color: UColors.textMed,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
