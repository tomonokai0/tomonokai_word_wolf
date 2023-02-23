import 'dart:html';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:word_wolf_tomonokai_public/screen/modal/modal_sheet.dart';

class  EllipsisButton extends HookConsumerWidget {
  const EllipsisButton ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      child: GestureDetector(
        onTap: () async{
          await showCupertinoModalBottomSheet<bool ?>(
              context: context,
              backgroundColor: const Color.fromRGBO(250, 249, 246, 1),
              isDismissible: true,
              enableDrag: false,
              elevation: 10,
              builder: (context) {
                return const WWDrawer();
              });
        },
        child: Stack(
          children: [
            ClayContainer(
              height: 60,
              width: 60,
              depth: 75,
              spread: 0,
              borderRadius: 360,
              color: const Color.fromRGBO(250, 249, 246, 1),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: ClayContainer(
                height: 50,
                width: 50,
                depth: 60,
                spread: 3,
                borderRadius: 360,
                color: const Color.fromRGBO(250, 249, 246, 1),
                child: Center(
                  child:Icon(
                    Ionicons.ellipsis_vertical_sharp,
                    color: Colors.black.withOpacity(.65),
                    size: 27,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
