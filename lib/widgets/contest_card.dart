import 'package:flutter/material.dart';

class ContestCard extends StatelessWidget {
  final int fee;
  final int totalPlayers;
  final int joinedPlayers;
  final VoidCallback onJoin;

  const ContestCard({
    super.key,
    required this.fee,
    required this.totalPlayers,
    required this.joinedPlayers,
    required this.onJoin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "$fee PKR Contest",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text("Players: $joinedPlayers / $totalPlayers"),

            const SizedBox(height: 10),

            LinearProgressIndicator(
              value: joinedPlayers / totalPlayers,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 15),

            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onJoin,
                child: const Text("Join"),
              ),
            )

          ],
        ),
      ),
    );
  }
}