import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.snackbar('Update', 'Your data has been updated');
          },
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.deepPurple[300],
            child: const Center(
              child: Text('Update'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.snackbar('Delete', 'Your data has been deleted');
          },
          child: Container(
            height: 50,
            width: double.infinity,
            color: Colors.deepPurple[200],
            child: const Center(
              child: Text('Delete'),
            ),
          ),
        )
      ],
    );
  }
}
