import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';

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
      return StatefulBuilder(
        builder: (context, setState) => Wrap(
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
                        color:
                            item.isFavorited ? UColors.ctaBlue : UColors.white,
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
                      onTap: () {},
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
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
