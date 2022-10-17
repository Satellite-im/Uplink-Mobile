// ignore_for_file: lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class NameFilePage extends StatefulWidget {
  const NameFilePage({super.key, this.item, this.isRename});

  static const routeName = '/NameFilePage';

  final Item? item;
  final bool? isRename;

  @override
  State<NameFilePage> createState() => _NameFilePageState();
}

class _NameFilePageState extends State<NameFilePage> {
  bool _isFABLight = false;

  late TextEditingController _textEditingController;
  late GlobalKey<FormFieldState<String>> _formfieldKey;
  final _itemListController = GetIt.I.get<ItemListBloc>();

  @override
  void initState() {
    super.initState();
    _formfieldKey = GlobalKey<FormFieldState<String>>();
    _textEditingController = TextEditingController(text: widget.item?.name);
    _textEditingController.addListener(() {
      if (_textEditingController.text.length > 2) {
        setState(() {
          _isFABLight = true;
        });
      } else {
        setState(() {
          _isFABLight = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
      bloc: _itemListController,
      builder: (context, state) {
        if (state is ItemListLoadSuccess) {
          final _nameList = state.itemList.map((e) => e.name).toList();
          return Scaffold(
            appBar: UAppBar.back(
              title: widget.isRename == true
                  ? UAppStrings.fileOptions_rename
                  : UAppStrings.name_file_page_upload_file,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: UText(
                      UAppStrings.name_file_page_name,
                      textStyle: UTextStyle.H3_tertiaryHeader,
                    ),
                  ),
                  const SizedBox(height: 12),
                  FormField<String>(
                    key: _formfieldKey,
                    validator: (value) {
                      var _hasSameName = false;
                      for (final oldItemName in _nameList) {
                        if (value == oldItemName) {
                          if (widget.isRename == true) {
                            if (value != widget.item!.name) {
                              _hasSameName = true;
                            }
                          } else {
                            _hasSameName = true;
                          }
                        }
                      }
                      if (_hasSameName == true) {
                        return UAppStrings.name_file_page_name_exist;
                      }
                      return null;
                    },
                    builder: (FormFieldState<String> state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: UColors.foregroundDark,
                            ),
                            child: TextField(
                              autofocus: true,
                              controller: _textEditingController,
                              onChanged: (value) {
                                state.didChange(value);
                                // remove the error message when user change the text
                                // by running the validatation again
                                if (state.hasError) {
                                  _formfieldKey.currentState!.validate();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: UAppStrings.name_file_page_hint,
                              ),
                              keyboardType: TextInputType.text,
                              style:
                                  UTextStyle.M1_micro.style.returnTextStyleType(
                                color: UColors.white,
                              ),
                            ),
                          ),
                          if (state.hasError) ...[
                            const SizedBox(
                              height: 24,
                            ),
                            UText(
                              state.errorText.toString(),
                              textStyle: UTextStyle.B1_body,
                              textColor: UColors.termRed,
                            )
                          ]
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: Opacity(
              opacity: _isFABLight ? 1 : 0.5,
              child: UFAB.large(
                onPressed: _isFABLight == false
                    ? () {}
                    : () {
                        if (widget.isRename == true) {
                          if (widget.item!.name ==
                              _textEditingController.text) {
                            // when user didn't change name
                            Navigator.of(context).pop();
                          } else {
                            final _fileName =
                                _formfieldKey.currentState!.value!;
                            if (_fileName == widget.item!.name) {
                              // when user type the same name as old one
                              Navigator.of(context).pop();
                            } else {
                              if (_formfieldKey.currentState!.validate()) {
                                // To prevent keyboard poping up after renaming is done
                                FocusManager.instance.primaryFocus?.unfocus();
                                _showConfirmBottomSheet(context, _fileName)
                                    .show();
                              }
                            }
                          }
                        } else {
                          // the length is already > 2
                          if (_formfieldKey.currentState!.validate()) {
                            final _fileName =
                                _formfieldKey.currentState!.value!;
                            Navigator.of(context).pop(_fileName);
                          }
                        }
                      },
                uIconData: UIcons.checkmark_1,
              ),
            ),
          );
        }
        // TODO(yijing): update loading/error widget
        return const Center(
          child: ULoadingIndicator(),
        );
      },
    );
  }

  UBottomSheetTwoButtons _showConfirmBottomSheet(
    BuildContext context,
    String fileName,
  ) {
    return UBottomSheetTwoButtons(
      context,
      firstButtonOnPressed: () {
        Navigator.of(context).pop();
      },
      secondButtonOnPressed: () {
        Navigator.of(context)
          ..pop()
          ..pop(fileName);
      },
      header: UAppStrings.name_file_page_confirm_title,
      firstButtonText: UAppStrings.cancelButton,
      secondButtonText: UAppStrings.fileOptions_save,
    );
  }
}
