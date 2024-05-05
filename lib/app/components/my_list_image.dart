import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_project_10/app/components/menu_item.dart';
import 'package:popover/popover.dart';

class MyListImage extends StatelessWidget {
  final String flowerName;
  final String flowerImage;
  final Function()? onTapUpdate;
  final Function()? onTapDelete;

  const MyListImage({
    super.key,
    required this.flowerName,
    required this.flowerImage,
    required this.onTapUpdate,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      imageUrl: flowerImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //show options
                GestureDetector(
                  onTap: () {
                    showPopover(
                      context: context,
                      bodyBuilder: (context) => MenuItems(
                        onTapUpdate: onTapUpdate,
                        onTapDelete: onTapDelete,
                      ),
                      width: 250,
                      height: 100,
                      backgroundColor: Color.fromRGBO(149, 117, 205, 1),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.more_vert_outlined),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(flowerName),
            ),
          ],
        ),
      ),
    );
  }
}
