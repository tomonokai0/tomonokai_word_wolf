import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_wolf_tomonokai_public/riverpod/provider.dart';
import 'package:word_wolf_tomonokai_public/screen/card_display_screen/card_display_screen.dart';
import 'package:word_wolf_tomonokai_public/screen/init_screen/player_count_input_screen.dart';
import 'package:word_wolf_tomonokai_public/screen/playing_screen/playing_screen.dart';
import 'package:word_wolf_tomonokai_public/screen/title/title.dart';
import 'firebase_options.dart';
import 'package:word_wolf_tomonokai_public/constant/color_palette/color_palette.dart' as colorPalette;


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child : MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Image playingImage;
  @override
  void initState() {
    super.initState();
    playingImage = Image.asset('assets/talk.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(playingImage.image, context);

  }
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp(
            title: 'Tomonokai WordWolf Web',
            color: Colors.white,
            theme: ThemeData(
              colorSchemeSeed: Colors.indigo,
              useMaterial3: true,
              backgroundColor: colorPalette.bgWhite,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              backgroundColor: colorPalette.bgWhite,
              colorSchemeSeed: Colors.blue,
              useMaterial3: true,
              brightness: Brightness.light,
            ),
            home: MyHomePage(playingImage),
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  final Image playingImage;
  const MyHomePage(this.playingImage, {Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerCountConfirmed = ref.watch(playerCountConfirmedProv);
    final currentPlayerIndex = ref.watch(currentPlayerIndexProv);
    final playerCount = ref.watch(playerCountProv);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 100.h,
            width: (100.w > 550 ) ?  550 : 100.w,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const GameTitleDisplay(),
                  if (!playerCountConfirmed) ... [
                    const NumberInputScreen(),
                  ] else if (currentPlayerIndex < playerCount) ... [
                    const CardDisplayScreen(),
                  ] else ... [
                    PlayingScreen(playingImage: playingImage),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

