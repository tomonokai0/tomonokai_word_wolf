import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quickalert/quickalert.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';
import 'package:word_wolf_tomonokai_public/screen/button/number_input_button.dart';

class  JumpToPlayerInputScreen extends HookConsumerWidget {
  const JumpToPlayerInputScreen ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerCount = ref.watch(playerCountProv);
    return Center(
      child: SizedBox(
        height: 75.h,
        width: 75.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Jump to Player...",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: (100.w > 550 ) ? 21 : 21.sp,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      color: Colors.black.withOpacity(.65),
                    ),
                  ),
                  SizedBox(height: (2.5).h,),
                ],
              ),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: List.generate(playerCount, (index) {
                return  Stack(
                  children: [
                    Container(
                      height: (100.w > 550) ? 70  : 15.w,
                      width: (100.w > 550) ? 70 : 15.w,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () async{
                          await QuickAlert.show(
                              context: context,
                              type: QuickAlertType.confirm,
                              title: 'Jump to Player${index+1} ?',
                              confirmBtnText: 'Yes',
                              customAsset: "assets/question.png",
                              onConfirmBtnTap: () async{
                                ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.loading,
                                  backgroundColor: Colors.white24,
                                  barrierColor: Colors.white24,
                                  customAsset: 'assets/running.png',
                                  autoCloseDuration: const Duration(seconds: 5),
                                  title: 'Pass to Player${index+1}  in 5 seconds!',
                                  text: '' ,
                                );
                                await Future.delayed(const Duration(seconds: 5)).then((_) async{
                                  await QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.confirm,
                                      backgroundColor: Colors.white24,
                                      barrierColor: Colors.white24,
                                      title: 'Are you Player ${index+1}?',
                                      confirmBtnText: 'Yes',
                                      customAsset: "assets/wait.png",
                                      onConfirmBtnTap: () {
                                        ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                                        Navigator.pop(context);
                                        ref.watch(gameStateModelProvider.notifier).switchPlayer(indexOption: index);
                                      }
                                  );
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                });
                              }
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: NumberInputButton(num: index + 1)
                    ),
                  ],
                );
              }, ),
            ),
          ],
        ),
      ),
    );
  }
}
