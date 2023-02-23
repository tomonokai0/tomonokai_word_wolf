import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:word_wolf_tomonokai_public/constant/color_palette/color_palette.dart' as colorPalette;
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quickalert/quickalert.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';

class BigButton extends HookConsumerWidget {
 final Text         label;
 final Icon?        icon;
 final VoidCallback onPressed;
 final int          innerDepth;
 final int          outerDepth;
 final int          innerSpread;
 final int          outerSpread;
  const BigButton ({required this.label, required this.icon, required this.onPressed,
    required this.innerDepth, required this.outerDepth, required this.outerSpread,
    required this.innerSpread, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        ClayContainer(
          color: const Color.fromRGBO(250, 249, 246, 1),
          depth: outerDepth,
          spread: outerSpread.toDouble(),
          borderRadius: 45,
          child: SizedBox(
            height: (100.w > 550 ) ? 96 : 15.w,
            width: (100.w > 550 ) ? 440 : 75.w,
            child : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               label,
                if (icon != null) ... [
                  icon!,
                ] else ... [
                  Container(),
                ]
              ],
            ),
          ),
        ),
        Positioned(
          top: (100.w > 550 ) ? 10 : 1.w,
          left: (100.w > 550 ) ? 6 : 1.w,
          child: GestureDetector(
            onTap: () async{
              onPressed();
            },
            child: ClayContainer(
              color: const Color.fromRGBO(250, 249, 246, 1),
              depth: innerDepth,
              spread: innerSpread.toDouble(),
              borderRadius: 45,
              child: SizedBox(
                height: (100.w > 550 ) ? 76.3 : 13.w,
                width: (100.w > 550 ) ? 428.2 : 73.w,
                // padding: (100.w > 550 ) ?
                // const EdgeInsets.symmetric(horizontal: 20, vertical: 12) : EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                child : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    label,
                    if (icon != null) ... [
                      icon!,
                    ] else ... [
                      Container(),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
