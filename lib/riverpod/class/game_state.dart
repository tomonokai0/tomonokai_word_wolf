class GameStateModel{
  final int playerCount;
  final int currentPlayerIndex;
  final int currentGameIndex;
  final List<int> playedGameIndexes;
  final List<int> wolfBoolArray;
  final bool isPlayerCountConfirmed;
  final bool isPassingScreen;

  GameStateModel({required this.playerCount, required this.currentGameIndex,
    required this.currentPlayerIndex, required this.playedGameIndexes, required this.wolfBoolArray,
    required this.isPlayerCountConfirmed, required this.isPassingScreen,});
}
