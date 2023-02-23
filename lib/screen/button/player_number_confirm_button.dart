import 'dart:html';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';

class  PlayConfirmButton extends HookConsumerWidget {
  const PlayConfirmButton ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ClayContainer(
            height: (100.w > 550) ? 80 : 17.w,
            width: (100.w > 550) ? 180 : 37.w,
            depth: 120,
            spread: 0,
            borderRadius: 360,
            color: const Color.fromRGBO(250, 249, 246, 1),
          ),
        ),
        Positioned(
          top: (100.w > 550) ? 5 :1.w,
          left: (100.w > 550) ? 10 :1.w,
          child: GestureDetector(
            onTap: () {
              ref.watch(gameStateModelProvider.notifier).confirmPlayerCount();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ClayContainer(
                height: (100.w > 550) ? 70 :15.w,
                width: (100.w > 550) ? 160 : 35.w,
                depth: 90,
                spread: 3,
                borderRadius: 360,
                color: const Color.fromRGBO(250, 249, 246, 1),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text : "Lets Play",
                          style: GoogleFonts.notoSerif(
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                            color: Colors.black.withOpacity(.65),
                          ),
                        ),
                        const TextSpan(
                          text : "👑",
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
