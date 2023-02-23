import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';
import 'package:word_wolf_tomonokai_public/screen/button/ellipsis_button.dart';

class GameTitleDisplay extends HookConsumerWidget {
  const GameTitleDisplay ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameCount = ref.watch(gameCountIndexProv);
    final List<String> emojis = List.generate(gameCount, (index) => "🎉");
    return SizedBox(
      height: 10.h,
      width : 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25),
            child : Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text : "Word Wolf" ,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        color: Colors.black.withOpacity(.65),
                      ),
                    ),
                    TextSpan(
                      text : emojis.join(''),
                      style: const TextStyle(
                        fontSize: 21,
                      ),
                    ),
                  ],
                )
            ),
          ),
          const EllipsisButton(),
        ],
      ),
    );
  }
}
