import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';
import 'package:word_wolf_tomonokai_public/constant/color_palette/color_palette.dart' as colorPalette;
import 'package:word_wolf_tomonokai_public/screen/button/big_button.dart';
import 'package:word_wolf_tomonokai_public/screen/card_display_screen/card_window.dart';
import 'package:word_wolf_tomonokai_public/screen/card_display_screen/player_name_display.dart';
import 'package:ionicons/ionicons.dart';
import 'package:quickalert/quickalert.dart';

class CardDisplayScreen extends HookConsumerWidget {
  const CardDisplayScreen({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayerIndex = ref.watch(currentPlayerIndexProv);
    final playerTotal = ref.watch(playerCountProv);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            const PlayerNameDisplay(),
            SizedBox(height: 5.h,),
            const CardDisplayTile(),
            SizedBox(height: 5.h,),
            BigButton(
                label: Text(
                  'Pass to your next buddy!',
                  style  : GoogleFonts.notoSerif(
                    fontSize: (100.w > 550 ) ? 21 : 18.sp,
                    fontWeight: FontWeight.w600,
                    color: colorPalette.pink.withOpacity(.85),
                  ),
                ),
                icon: Icon(
                  Ionicons.chevron_forward,
                  color: colorPalette.pink.withOpacity(.85),
                  size: (100.w > 550 ) ? 21 : 18.sp,
                ),
                onPressed: () async{
                  await QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      backgroundColor: Colors.white24,
                      barrierColor: Colors.white24,
                      title: 'Did you remember?',
                      customAsset: 'assets/question.png' ,
                      onConfirmBtnTap: () async{
                        ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.loading,
                          backgroundColor: Colors.white24,
                          barrierColor: Colors.white24,
                          customAsset: 'assets/running.png',
                          autoCloseDuration: const Duration(seconds: 5),
                          title: 'Pass to your next buddy in 5 seconds!',
                          text: '' ,
                        );
                        await Future.delayed(const Duration(seconds: 5)).then((_) async{
                          if (currentPlayerIndex + 1 < playerTotal) {
                            await QuickAlert.show(
                                context: context,
                                type: QuickAlertType.confirm,
                                backgroundColor: Colors.white24,
                                barrierColor: Colors.white24,
                                title: 'Are you Player ${currentPlayerIndex + 2}?',
                                confirmBtnText: 'Yes',
                                customAsset: "assets/wait.png",
                                onConfirmBtnTap: () {
                                  ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                                  Navigator.pop(context);
                                }
                            );
                          } else {
                            ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                          }
                          ref.watch(gameStateModelProvider.notifier).switchPlayer();
                          Navigator.pop(context);
                        });
                      }
                  );
                },
                innerDepth:  90,
                outerDepth:  120,
                outerSpread: 0,
                innerSpread: 3,
            ),
            SizedBox(height: 3.h,),
            BigButton(
                label: Text(
                    "Pass to your previous buddy",
                    style: GoogleFonts.notoSerif(
                      fontSize: (100.w > 550 ) ? 18 : 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.45),
                    )
                ),
                icon: null,
                onPressed: () async{
                  if (currentPlayerIndex != 0) {
                    await QuickAlert.show(
                        context: context,
                        type: QuickAlertType.confirm,
                        backgroundColor: Colors.white24,
                        barrierColor: Colors.white24,
                        title: 'Did you remember?',
                        customAsset: 'assets/question.png' ,
                        onConfirmBtnTap: () async{
                          ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.loading,
                            backgroundColor: Colors.white24,
                            barrierColor: Colors.white24,
                            customAsset: 'assets/running.png',
                            autoCloseDuration: const Duration(seconds: 5),
                            title: 'Pass to your previous buddy in 5 seconds!',
                            text: '' ,
                          );
                          await Future.delayed(const Duration(seconds: 5)).then((_) async{
                            if (currentPlayerIndex != 0) {
                              await QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.confirm,
                                  backgroundColor: Colors.white24,
                                  barrierColor: Colors.white24,
                                  title: 'Are you Player $currentPlayerIndex?',
                                  confirmBtnText: 'Yes',
                                  customAsset: "assets/wait.png",
                                  onConfirmBtnTap: () {
                                    ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                                    ref.watch(gameStateModelProvider.notifier).switchPlayer(indexOption: -1);
                                    Navigator.pop(context);
                                  }
                              );
                            } else {
                              ref.watch(gameStateModelProvider.notifier).changeIsPassingScreen();
                            }
                            Navigator.pop(context);
                          });
                        }
                    );
                  }
                },
                innerDepth: 45,
                outerDepth: 60,
                outerSpread: 0,
                innerSpread: 3,
            ),
        ],
    );
  }
}
