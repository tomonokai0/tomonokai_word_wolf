import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';

class  NumberInputButton extends HookConsumerWidget {
  final int num;
  const NumberInputButton ({required this.num, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.watch(gameStateModelProvider.notifier).inputPlayerCount(num);
      },
      child: Container(
        margin: (100.w > 550) ? const EdgeInsets.all(15) : EdgeInsets.all(2.5.w),
        child: Stack(
          children: [
            ClayContainer(
              height: (100.w > 550) ? 80 : 17.w,
              width: (100.w > 550) ? 80  : 17.w,
              depth: 120,
              spread: 0,
              borderRadius: 360,
              color: const Color.fromRGBO(250, 249, 246, 1),
            ),
            Positioned(
              top: (100.w > 550) ? 5 : 1.w,
              left: (100.w > 550) ? 5 : 1.w,
              child: ClayContainer(
                height: (100.w > 550) ? 70  : 15.w,
                width: (100.w > 550) ? 70 : 15.w,
                depth: 90,
                spread: 3,
                borderRadius: 360,
                color: const Color.fromRGBO(250, 249, 246, 1),
                child: Center(
                  child: Text(
                    num.toString(),
                    style: GoogleFonts.notoSerif(
                      fontSize: (100.w > 550) ? 30 : 21.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.65),
                      decoration: TextDecoration.none,
                    ),
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
