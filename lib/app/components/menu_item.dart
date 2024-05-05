import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MenuItems extends StatelessWidget {
  final Function()? onTapUpdate;
  final Function()? onTapDelete;
  const MenuItems({
    super.key,
    required this.onTapUpdate,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapUpdate,
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
          onTap: onTapDelete,
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
