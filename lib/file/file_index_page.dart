import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/widgets/widgets_export.dart';
import 'package:uplink/utils/mock/data/mock_base64_str.dart';
import 'package:uplink/utils/mock/helpers/loading_photos.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class FileIndexPage extends StatefulWidget {
  const FileIndexPage({Key? key}) : super(key: key);

  @override
  State<FileIndexPage> createState() => _FileIndexPageState();
}

class _FileIndexPageState extends State<FileIndexPage> {
  late bool gridViewIsSelected;
  @override
  void initState() {
    super.initState();
    gridViewIsSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: FileIndexAppbar(),
      ),
      body: FutureBuilder<List<MockPhoto>>(
        future: loadingPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final photosList = snapshot.data!;
            return Column(
              children: [
//Item layout bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        UText(
                          photosList.isEmpty
                              ? 'No items'
                              : '${photosList.length} items',
                          textStyle: UTextStyle.H5_fifthHeader,
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        ItemLayoutButton(
                          onPressed: () {
                            setState(() {
                              gridViewIsSelected = true;
                              log('grid view selected');
                            });
                          },
                          isSelected: gridViewIsSelected,
                          uIconData: UIcons.grid_view,
                        ),
                        const SizedBox(width: 12),
                        ItemLayoutButton(
                          onPressed: () {
                            setState(() {
                              gridViewIsSelected = false;
                              log('list view selected');
                            });
                          },
                          isSelected: !gridViewIsSelected,
                          uIconData: UIcons.list_view,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
// photos list
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: photosList.isEmpty
                        ? const NoItemBody()
                        : gridViewIsSelected
                            ? const PhotesGridView()
                            : PhotosListView(
                                photosList: photosList,
                              ),
                  ),
                ),
              ],
            );
          }
          // TODO(yijing): update to shimmer effect
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class PhotosListView extends StatelessWidget {
  const PhotosListView({
    Key? key,
    required this.photosList,
  }) : super(key: key);

  final List<MockPhoto> photosList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        final _photoName = photosList[index].name;
        final _photoSize = photosList[index].size;
        return Column(
          children: [
            Card(
              color: UColors.backgroundDark,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: UColors.foregroundDark),
                borderRadius: BorderRadius.circular(4),
              ),
              margin: EdgeInsets.zero,
              child: ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: UImage(
                      imageSource: ImageSource.local,
                      imagePath: photosList[index].path,
                    ),
                  ),
                ),
                title: UText(
                  _photoName,
                  textStyle: UTextStyle.H5_fifthHeader,
                  textColor: UColors.white,
                ),
                // TODO(yijing): update size unit
                subtitle: UText(
                  '${_photoSize.toString()} KB',
                  textStyle: UTextStyle.M1_micro,
                ),
                trailing: IconButton(
                  icon: const UIcon(UIcons.hamburger_menu),
                  onPressed: () {},
                  visualDensity: const VisualDensity(horizontal: -2),
                ),
                contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 24,
      ),
    );
  }
}

class PhotesGridView extends StatelessWidget {
  const PhotesGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imageUint8List = base64.decode(mockBase64Str);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 160 / 168,
      ),
      // TODO(yijing): update to the length of photo list
      itemCount: 10,
      itemBuilder: (context, index) => UImageButton.unit8ListImage(
        unit8ListImage: _imageUint8List,
        isFavored: true,
        isShared: true,
      ),
    );
  }
}

class ItemLayoutButton extends StatelessWidget {
  const ItemLayoutButton({
    Key? key,
    required this.onPressed,
    required this.isSelected,
    required this.uIconData,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isSelected;
  final UIconData uIconData;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected ? UColors.ctaDark : UColors.backgroundDark,
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: UIcon(
            uIconData,
            color: isSelected ? UColors.white : UColors.textMed,
          ),
        ),
      ),
    );
  }
}
