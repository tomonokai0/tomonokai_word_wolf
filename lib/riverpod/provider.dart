import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:word_wolf_tomonokai_public/riverpod/class/game_state.dart';
import 'package:word_wolf_tomonokai_public/riverpod/notifier.dart';
// import 'dart:math';

final gameStateModelProvider = StateNotifierProvider<GameStateNotifier, GameStateModel>(
      (ref) =>  GameStateNotifier(),
);

final _currentPlayerIndex = Provider<int>(
        (ref) => ref.watch(gameStateModelProvider).currentPlayerIndex
);

final currentPlayerIndexProv = Provider<int>(
        (ref) => ref.watch(_currentPlayerIndex)
);

final _currentGameIndex = Provider<int>(
        (ref) => ref.watch(gameStateModelProvider).currentGameIndex
);

final currentGameIndexProv = Provider<int>(
        (ref) => ref.watch(_currentGameIndex)
);

final _gameCountIndex = Provider<int>(
        (ref) => ref.watch(gameStateModelProvider).playedGameIndexes.length + 1
);

final gameCountIndexProv = Provider<int>(
        (ref) => ref.watch(_gameCountIndex)
);

final _wolfBoolArray = Provider<List<int>>(
        (ref) => ref.watch(gameStateModelProvider).wolfBoolArray
);

final wolfBoolArrayProv = Provider<List<int>>(
        (ref) => ref.watch(_wolfBoolArray)
);

final _playerCount = Provider<int>(
        (ref) => ref.watch(gameStateModelProvider).playerCount
);

final playerCountProv = Provider<int>(
        (ref) => ref.watch(_playerCount)
);

final _playerCountConfirmed = Provider<bool>(
        (ref) => ref.watch(gameStateModelProvider).isPlayerCountConfirmed
);

final playerCountConfirmedProv = Provider<bool>(
        (ref) => ref.watch(_playerCountConfirmed)
);

final _isPassingScreen = Provider<bool>(
        (ref) => ref.watch(gameStateModelProvider).isPassingScreen
);

final isPassingScreenProv = Provider<bool>(
        (ref) => ref.watch(_isPassingScreen)
);

