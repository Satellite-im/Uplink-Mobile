// ignore_for_file: prefer_final_locals, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/remove_list_page/models/selected_item_list.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class RemoveListPage extends StatefulWidget {
  const RemoveListPage({super.key});

  @override
  State<RemoveListPage> createState() => _RemoveListPageState();
}

class _RemoveListPageState extends State<RemoveListPage> {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedItemList(),
      builder: (context, child) {
        var _selectedItemList =
            context.watch<SelectedItemList>().selectedItemList;
        final _selectedItemListRead = context.read<SelectedItemList>();

        return Scaffold(
          appBar: UAppBar.back(title: UAppStrings.remove),
          body: const FileIndexBody.removeList(),
          persistentFooterButtons: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UText(
                    _selectedItemList.length.toString() +
                        UAppStrings.remove_list_page_selected,
                    textStyle: UTextStyle.H5_fifthHeader,
                  ),
                  IconButton(
                    onPressed: _selectedItemList.isNotEmpty
                        ? () {
                            UBottomSheetTwoButtons(
                              context,
                              header: UAppStrings
                                      .remove_list_page_confirm_title_1 +
                                  _selectedItemList.length.toString() +
                                  UAppStrings.remove_list_page_confirm_title_2,
                              firstButtonText: UAppStrings.cancelButton,
                              firstButtonOnPressed: () =>
                                  Navigator.of(context).pop(),
                              secondButtonText: UAppStrings.remove,
                              secondButtonColor: UColors.termRed,
                              secondButtonOnPressed: () {
                                Navigator.of(context).pop();
                                _itemListController.add(
                                  RemoveItems(
                                    _selectedItemListRead.selectedItemList,
                                  ),
                                );
                                // wait until ItemListBloc finish RemoveItems
                                _itemListController.stream
                                    .firstWhere(
                                      (element) =>
                                          element is ItemListLoadSuccess,
                                    )
                                    .whenComplete(
                                      _selectedItemListRead.clear,
                                    );
                              },
                            ).show();
                          }
                        : null,
                    icon: UIcon(
                      UIcons.remove,
                      color: _selectedItemList.isNotEmpty
                          ? UColors.termRed
                          : UColors.textMed,
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
