import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

Future<void> showFileOptionsBottomSheet(BuildContext context, Item item) async {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(USizes.barAboveBottomSheetBorderRadius),
        topRight: Radius.circular(USizes.barAboveBottomSheetBorderRadius),
      ),
    ),
    builder: (context) {
      var opacity = 1.0;
      return StatefulBuilder(
        builder: (context, setState) => Opacity(
          opacity: opacity,
          child: Wrap(
            children: [
              const UHomeIndicator(),
              Container(
                decoration: const BoxDecoration(
                  color: UColors.modalDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      USizes.bottomSheetTemplateBorderRadius,
                    ),
                    topRight: Radius.circular(
                      USizes.bottomSheetTemplateBorderRadius,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 36, 16, 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UText(
                        'File Options',
                        textStyle: UTextStyle.H3_tertiaryHeader,
                      ),
                      const SizedBox(
                        height: 9.4,
                      ),
                      BlocBuilder<ItemListBloc, ItemListState>(
                        bloc: _itemListController,
                        builder: (context, state) => OptionListTile(
                          uIconData: UIcons.favorite,
                          color: item.isFavorited
                              ? UColors.ctaBlue
                              : UColors.white,
                          title: item.isFavorited ? 'Favorited' : 'Favorite',
                          onTap: () {
                            setState(
                              () {
                                _itemListController
                                    .add(SwitchFavoriteStatus(item));
                              },
                            );
                          },
                        ),
                      ),
                      OptionListTile(
                        uIconData: UIcons.copy_or_clone_button,
                        color: UColors.white,
                        title: 'Copy',
                        onTap: () {},
                      ),
                      OptionListTile(
                        uIconData: UIcons.edit,
                        color: UColors.white,
                        title: 'Rename',
                        onTap: () async {
                          final _arg = {
                            'item': item,
                            'isRename': true,
                          };
                          final _fileName =
                              await Navigator.of(context).popAndPushNamed(
                            '/NameFilePage',
                            arguments: _arg,
                          ) as String?;

                          if (_fileName != null) {
                            _itemListController.add(
                              RenameItem(item: item, name: _fileName),
                            );
                          }
                        },
                      ),
                      OptionListTile(
                        uIconData: UIcons.download,
                        color: UColors.white,
                        title: 'Save',
                        onTap: () {},
                      ),
                      OptionListTile(
                        uIconData: UIcons.remove,
                        color: UColors.white,
                        title: 'Remove',
                        onTap: () {
                          setState(
                            () {
                              //hide file options bottom sheet
                              opacity = 0;
                            },
                          );
                          UBottomSheetTwoButtons(
                            context,
                            header:
                                'Are you sure you want to remove this file?',
                            firstButtonText: UAppStrings.cancelButton,
                            firstButtonOnPressed: () {
                              Navigator.of(context).pop();
                              setState(
                                () {
                                  //show file options bottom sheet
                                  opacity = 1;
                                },
                              );
                            },
                            secondButtonText: UAppStrings.remove,
                            secondButtonOnPressed: () {
                              _itemListController.add(RemoveSingleItem(item));
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                          ).show();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
