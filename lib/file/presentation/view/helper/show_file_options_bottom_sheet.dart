import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/name_file_page.dart';
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
      var showFileOptionsBottomSheet = true;
      return StatefulBuilder(
        builder: (context, setState) => Opacity(
          opacity: showFileOptionsBottomSheet ? 1 : 0,
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
                        UAppStrings.fileOptions_title,
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
                          title: item.isFavorited
                              ? UAppStrings.fileOptions_favorited
                              : UAppStrings.fileOptions_favorite,
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
                        title: UAppStrings.fileOptions_copy,
                        onTap: () {},
                      ),
                      OptionListTile(
                        uIconData: UIcons.edit,
                        color: UColors.white,
                        title: UAppStrings.fileOptions_rename,
                        onTap: () async {
                          final _arg = {
                            'item': item,
                            'isRename': true,
                          };
                          final _fileName =
                              await Navigator.of(context).popAndPushNamed(
                            NameFilePage.routeName,
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
                        title: UAppStrings.fileOptions_save,
                        onTap: () {},
                      ),
                      OptionListTile(
                        uIconData: UIcons.remove,
                        color: UColors.white,
                        title: UAppStrings.remove,
                        onTap: () {
                          setState(
                            () {
                              showFileOptionsBottomSheet = false;
                            },
                          );
                          UBottomSheetTwoButtons(
                            context,
                            header: UAppStrings.fileOptions_remove_item_title,
                            firstButtonText: UAppStrings.cancelButton,
                            firstButtonOnPressed: () {
                              Navigator.of(context).pop();
                              setState(
                                () {
                                  showFileOptionsBottomSheet = true;
                                },
                              );
                            },
                            secondButtonText: UAppStrings.remove,
                            secondButtonColor: UColors.termRed,
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
