import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes_app/components/bottom_sheet_widget.dart';
import 'package:quotes_app/providers/background_image_provider.dart';
import 'package:quotes_app/screens/tabs_screen.dart';

class ImageGridItem extends StatefulWidget {
  const ImageGridItem({
    super.key,
    required this.imageUrl,
    required this.isSelected,
    required this.isUnlocked,
    required this.index,
  });

  final String imageUrl;
  final bool isSelected;
  final bool isUnlocked;
  final int index;

  @override
  State<ImageGridItem> createState() => _ImageGridItemState();
}

class _ImageGridItemState extends State<ImageGridItem>
    with AutomaticKeepAliveClientMixin<ImageGridItem> {
      
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () async {
        if (widget.isSelected) return;

        if (widget.isUnlocked) {
          final backgroundImageProvider =
              Provider.of<BackgroundImageProvider>(context, listen: false);

          await backgroundImageProvider.toggleImage(widget.imageUrl);
        }

        if (!widget.isUnlocked) {
          showModalBottomSheet(
            context: TabsScreen.scaffoldKey.currentContext!,
            builder: (ctx) {
              return BottomSheetWidget(
                imageUrl: widget.imageUrl,
                index: widget.index,
              );
            },
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: widget.isSelected
            ? BoxDecoration(
                border: Border.all(color: Colors.green.shade900, width: 1),
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                height: double.infinity,
                // width: double.infinity,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) {
                  final downloaded = progress.downloaded.toDouble();
                  final total = progress.totalSize?.toDouble() ?? 1.0;
                  final percentage = (downloaded / total) * 100;

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.grey.shade700,
                      ),
                      if (percentage.toStringAsFixed(0) != '0')
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: downloaded / total,
                              color: Colors.blue,
                              strokeWidth: 2,
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${percentage.toStringAsFixed(0)}%',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                    ],
                  );
                },
                fadeInDuration:
                    Duration(milliseconds: 100), // Reduce fade-in duration
                errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
              if (!widget.isUnlocked)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(128, 0, 0, 0),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(16)),
                    ),
                    child: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
