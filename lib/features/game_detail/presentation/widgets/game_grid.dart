import 'package:flutter/material.dart';
import '../../domain/entities/game.dart';
import 'game_card.dart';

class GameGrid extends StatelessWidget {
  final List<Game> games;

  const GameGrid({
    super.key,
    required this.games,
  });

  @override
  Widget build(BuildContext context) {
    // Sort by sortOrder ascending as per requirement
    final sortedGames = List<Game>.from(games)
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0, // Adjust to match design
      ),
      itemCount: sortedGames.length,
      itemBuilder: (context, index) {
        final game = sortedGames[index];
        return GameCard(
          title: game.title,
          imageUrl: game.imageUrl,
          onTap: () {
            // Future game implementation
          },
        );
      },
    );
  }
}
