import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_wolf_tomonokai_public/constant/card_data/card_data.dart';
import 'dart:math';

import 'package:word_wolf_tomonokai_public/riverpod/class/game_state.dart';


class GameStateNotifier extends StateNotifier<GameStateModel> {
  GameStateNotifier() : super(_initState);

  static final _initState = GameStateModel(
    playerCount: 3,
    currentPlayerIndex: -1,
    currentGameIndex: -1,
    playedGameIndexes: [],
    wolfBoolArray: [],
    isPlayerCountConfirmed:false,
    isPassingScreen:false,
  );

  void startNewGame() async{
    //もしgameCountがmaxならCongratsのGIF??
    final newPlayedGameIndexes = (state.currentPlayerIndex == -1) ?
    [...state.playedGameIndexes] : [...state.playedGameIndexes, state.currentGameIndex];
    if (newPlayedGameIndexes.length != playableCardSets.length) {
      Random random = Random();
      int randomNumber = -1;
      while (randomNumber == -1 || newPlayedGameIndexes.contains(randomNumber)) {
        randomNumber = random.nextInt(playableCardSets.length);
      }
      List<int> newWolfBoolArray = List.generate(state.playerCount, (index) => 0, growable: false);
      int randomWolfIndex = random.nextInt(state.playerCount);
      newWolfBoolArray[randomWolfIndex] = 1;
      if (state.playerCount > 7) {
        int randomExtraWolfIndex =  -1;
        while (randomExtraWolfIndex == -1 || randomExtraWolfIndex == randomWolfIndex) {
          randomExtraWolfIndex = random.nextInt(state.playerCount);
        }
        newWolfBoolArray[randomExtraWolfIndex] = 1;
      }
      state = GameStateModel(
        playerCount: state.playerCount,
        currentPlayerIndex: 0,
        currentGameIndex: randomNumber,
        playedGameIndexes: [...newPlayedGameIndexes],
        wolfBoolArray: [...newWolfBoolArray],
        isPlayerCountConfirmed:state.isPlayerCountConfirmed,
        isPassingScreen: state.isPassingScreen,
      );
    } else {
      state = GameStateModel(
        playerCount: state.playerCount,
        currentPlayerIndex: 0,
        currentGameIndex: state.currentGameIndex,
        playedGameIndexes: [...newPlayedGameIndexes],
        wolfBoolArray: state.wolfBoolArray,
        isPlayerCountConfirmed:state.isPlayerCountConfirmed,
        isPassingScreen: state.isPassingScreen,
      );
    }
  }

  void switchPlayer({int? indexOption}) {
    late int newIndex;
    if (indexOption != null) {
      if (indexOption == -1 && state.currentPlayerIndex > 0) {
        newIndex = state.currentPlayerIndex - 1;
      } else {
        newIndex = (indexOption != -1 ) ? indexOption : state.currentPlayerIndex;
      }
    } else {
      newIndex = (state.currentPlayerIndex < state.playerCount) ? state.currentPlayerIndex + 1 : state.currentPlayerIndex ;
    }
    state = GameStateModel(
      playerCount: state.playerCount,
      currentPlayerIndex: newIndex,
      currentGameIndex: state.currentGameIndex,
      playedGameIndexes: state.playedGameIndexes,
      wolfBoolArray: state.wolfBoolArray,
      isPlayerCountConfirmed:state.isPlayerCountConfirmed,
      isPassingScreen: state.isPassingScreen,
    );
  }

  void inputPlayerCount(int count) {
    state = GameStateModel(
      playerCount: count,
      currentPlayerIndex: state.currentPlayerIndex,
      currentGameIndex: state.currentGameIndex,
      playedGameIndexes: state.playedGameIndexes,
      wolfBoolArray:  state.wolfBoolArray,
      isPlayerCountConfirmed:state.isPlayerCountConfirmed,
      isPassingScreen: state.isPassingScreen,
    );
  }

  void confirmPlayerCount() {
    startNewGame();
    state = GameStateModel(
      playerCount: state.playerCount,
      currentPlayerIndex: 0,
      currentGameIndex: state.currentGameIndex,
      playedGameIndexes: state.playedGameIndexes,
      wolfBoolArray: state.wolfBoolArray,
      isPlayerCountConfirmed: true,
      isPassingScreen: state.isPassingScreen,
    );
  }

  void changeIsPassingScreen() {
    state = GameStateModel(
      playerCount: state.playerCount,
      currentPlayerIndex: state.currentPlayerIndex,
      currentGameIndex: state.currentGameIndex,
      playedGameIndexes: state.playedGameIndexes,
      wolfBoolArray: state.wolfBoolArray,
      isPlayerCountConfirmed: state.isPlayerCountConfirmed,
      isPassingScreen: !state.isPassingScreen,
    );
  }
}
