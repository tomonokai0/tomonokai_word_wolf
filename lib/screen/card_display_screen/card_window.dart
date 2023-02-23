import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_wolf_tomonokai_public/constant/card_data/card_data.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';

class CardDisplayTile extends HookConsumerWidget {
  const CardDisplayTile ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayerIndex = ref.watch(currentPlayerIndexProv);
    final currentWolfArray = ref.watch(wolfBoolArrayProv);
    final currentGameIndex = ref.watch(currentGameIndexProv);
    final isPassingScreen = ref.watch(isPassingScreenProv);
    return  Stack(
      children: [
        ClayContainer(
          height: (100.w > 550 ) ? 178 : 32.h,
          width: (100.w > 550 ) ? 430 : 77.w,
          color: const Color.fromRGBO(250, 249, 246, 1),
          borderRadius: 25,
          depth: 25,
          spread: 0,
          emboss: true,
        ),
        Positioned(
          top: (100.w > 550 ) ? 5 : 1.h,
          left: (100.w > 550 ) ? 5 : 1.w,
          child: ClayContainer(
            height: (100.w > 550 ) ? 168 : 30.h,
            width: (100.w > 550 ) ? 420 : 75.w,
            color: const Color.fromRGBO(250, 249, 246, 1),
            borderRadius: 25,
            depth: 25,
            spread: 3,
            emboss: true,
            child : Center(
              child : Text(
                playableCardSets[currentGameIndex][currentWolfArray[currentPlayerIndex]],
                style: GoogleFonts.playfairDisplay(
                  fontSize: (100.w > 550 ) ? 48 : 27.sp,
                  fontWeight: FontWeight.w800,
                  color: (isPassingScreen) ? Colors.black.withOpacity(0) : Colors.black.withOpacity(.65),
                ),
                overflow: TextOverflow.visible,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
