import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_wolf_tomonokai_public/constant/card_data/card_data.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';
import 'package:word_wolf_tomonokai_public/constant/color_palette/color_palette.dart' as colorPalette;
import 'package:word_wolf_tomonokai_public/screen/button/big_button.dart';
import 'package:word_wolf_tomonokai_public/screen/card_display_screen/card_window.dart';
import 'package:word_wolf_tomonokai_public/screen/card_display_screen/player_name_display.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quickalert/quickalert.dart';

class PlayingImageDisplay extends HookConsumerWidget {
  final Image playingImage;
  const PlayingImageDisplay(this.playingImage, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 85.w,
      child : Center(
        child : Column(
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text : "Lets Play",
                    style: GoogleFonts.notoSerif(
                      fontSize: (100.w > 550 ) ? 30 : 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.65),
                    ),
                  ),
                  TextSpan(
                    text : "💪💪💪",
                    style: TextStyle(
                      fontSize: (100.w > 550 ) ? 30 : 24.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            // playingGif,
            SizedBox(
              height: (100.w > 550 ) ? 240 : 50.w,
              width: (100.w > 550 ) ? 360 : 75.w,
              child: playingImage,
            )
          ],
        ),
      ),
    );
  }
}
