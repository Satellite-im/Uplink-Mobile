// ignore_for_file: prefer_final_locals

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/remove_list_page/models/selected_item_list.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';

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
            appBar: UAppBar.back(title: 'Remove'),
            body: const FileIndexBody.removeList(),
            persistentFooterButtons: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UText(
                      '${_selectedItemList.length} Selected',
                      textStyle: UTextStyle.H5_fifthHeader,
                    ),
                    IconButton(
                      onPressed: _selectedItemList.isNotEmpty
                          ? () {
                              _itemListController.add(
                                RemoveItems(
                                  _selectedItemListRead.selectedItemList,
                                ),
                              );
                              // wait until ItemListBloc finish RemoveItems
                              _itemListController.stream
                                  .firstWhere(
                                    (element) => element is ItemListLoadSuccess,
                                  )
                                  .whenComplete(
                                    _selectedItemListRead.clear,
                                  );
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
        });
  }
}
