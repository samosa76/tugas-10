import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
            color: const Color.fromRGBO(213, 103, 205, 1),
            child: Center(
              child: Text(
                'Update',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapDelete,
          child: Container(
            height: 50,
            width: double.infinity,
            color: Color.fromARGB(255, 250, 139, 243),
            child: Center(
              child: Text(
                'Delete',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
