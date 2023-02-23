
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quickalert/quickalert.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';
import 'package:word_wolf_tomonokai_public/constant/color_palette/color_palette.dart' as colorPalette;

class PlayerNameDisplay extends HookConsumerWidget {
  const PlayerNameDisplay ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerIndex = ref.watch(currentPlayerIndexProv);
    return GestureDetector(
      child: ClayContainer(
        height:(100.w > 550 ) ? 82: 15.h,
        width: (100.w > 550 ) ? 360 : 65.w,
        depth: 10,
        spread: 5,
        borderRadius: 10,
        color: const Color.fromRGBO(250, 249, 246, 1),
        child : Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClayContainer(
                    height: (100.w > 550 ) ? 20 : 4.w,
                    width: (100.w > 550 ) ? 20 :4.w,
                    borderRadius: 50,
                    depth: 20,
                    spread: 0,
                    color: colorPalette.bgWhiteShadow,
                  ),
                  Positioned(
                    top:(100.w > 550 ) ? 2.5 : (1/2).w,
                    left: (100.w > 550 ) ? 2.5 :(1/2).w,
                    child: ClayContainer(
                      color: colorPalette.colorPaletteArray[playerIndex % colorPalette.colorPaletteArray.length],
                      height: (100.w > 550 ) ? 15 :3.w,
                      width: (100.w > 550 ) ? 15 :3.w,
                      borderRadius: 50,
                      depth: 40,
                      spread: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: (100.w > 550 ) ? 20 :3.w,
              ),
              Text(
                "Player " + (playerIndex + 1).toString(),
                style: GoogleFonts.notoSerif(
                  fontSize: (100.w > 550 ) ? 30 : 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.65),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
