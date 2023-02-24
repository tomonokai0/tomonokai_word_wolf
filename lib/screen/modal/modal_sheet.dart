import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quickalert/quickalert.dart';
import 'package:word_wolf_tomonokai_public/screen/modal/jump_to_player_selector.dart';

class WWDrawer extends HookConsumerWidget {
  const WWDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 30.h,
      width: 100.w,
      color: const Color.fromRGBO(250, 249, 246, 1),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  title: 'Confirm to restart?',
                  confirmBtnText: 'Yes',
                  customAsset: 'assets/question.png',
                  onConfirmBtnTap: () {
                    html.window.location.reload();
                  }
              );
            },
            child:  Text(
              "Restart / Change player count",
              style: GoogleFonts.notoSerif(
                fontSize: (100.w > 550 ) ? 18 : 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.65),
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: 5.h,),
          GestureDetector(
              onTap: () async{
                await showCupertinoModalBottomSheet<bool ?>(
                    context: context,
                    backgroundColor: const Color.fromRGBO(250, 249, 246, 1),
                    isDismissible: true,
                    enableDrag: false,
                    elevation: 10,
                    builder: (context) {
                      return const JumpToPlayerInputScreen();
                    });
              },
              child:  Text(
                "Jump to Player...",
                style: GoogleFonts.notoSerif(
                  fontSize: (100.w > 550 ) ? 18 : 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.65),
                  decoration: TextDecoration.none,
                ),
              )
          ),
          SizedBox(height: 5.h,),
          GestureDetector(
              onTap: () {
                showLicensePage(context : context);
              },
              child:  Text(
                "Licenses",
                style: GoogleFonts.notoSerif(
                  fontSize: (100.w > 550 ) ? 18 : 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.65),
                  decoration: TextDecoration.none,
                ),
              )
          ),
        ],
      ),
    );
  }
}
