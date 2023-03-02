import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';
import 'package:word_wolf_tomonokai_public/screen/button/number_input_button.dart';
import 'package:word_wolf_tomonokai_public/screen/button/player_number_confirm_button.dart';

class  NumberInputScreen extends HookConsumerWidget {
  const NumberInputScreen ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerCount = ref.watch(playerCountProv);
    return Center(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "How Many Players?",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: (100.w > 550 ) ? 24 : 21.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.65),
                    ),
                  ),
                  SizedBox(height: (2.5).h,),
                  Stack(
                    children: [
                      Positioned(
                        child: ClayContainer(
                          height: 50,
                          width: 100,
                          color: const Color.fromRGBO(250, 249, 246, 1),
                          borderRadius: 75,
                          depth: 25,
                          spread: 0,
                          emboss: true,
                          child: Center(
                            child: Text(
                              playerCount.toString(),
                              style: GoogleFonts.notoSerif(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.65),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: ClayContainer(
                          emboss: true,
                          height: 42,
                          width: 90,
                          color: const Color.fromRGBO(250, 249, 246, 1),
                          borderRadius: 75,
                          depth: 25,
                          spread: 3,
                          child: Center(
                            child: Text(
                              playerCount.toString(),
                              style: GoogleFonts.notoSerif(
                                fontSize: (100.w > 550) ? 30 : 21.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.65),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: (2.5).h,),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NumberInputButton(num: 3),
                NumberInputButton(num: 4),
                NumberInputButton(num: 5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NumberInputButton(num: 6),
                NumberInputButton(num: 7),
                NumberInputButton(num: 8),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NumberInputButton(num: 9),
                NumberInputButton(num: 10),
                NumberInputButton(num: 11),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                NumberInputButton(num: 12),
                PlayConfirmButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
