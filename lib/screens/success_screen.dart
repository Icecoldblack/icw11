import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

// Final screen: celebrates the new registration.
class SuccessScreen extends StatefulWidget {
  final String userName;
  final String creatureType;

  const SuccessScreen({
    super.key,
    required this.userName,
    required this.creatureType,
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late final ConfettiController _confetti =
      ConfettiController(duration: const Duration(seconds: 3));

  // Each creature gets its own emoji
  final Map<String, String> _creatureEmoji = {
    'Ghost': '👻',
    'Bat': '🦇',
    'Black Cat': '🐈‍⬛',
    'Pumpkin Spirit': '🎃',
    'Witch': '🧙',
  };

  @override
  void initState() {
    super.initState();
    _confetti.play(); // fire confetti once when the screen opens
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emoji = _creatureEmoji[widget.creatureType] ?? '🎃';
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 64)),
                Text(
                  'Welcome, ${widget.userName}!',
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Creature registered: ${widget.creatureType}.',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back to the Foyer'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confetti,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
            ),
          ),
        ],
      ),
    );
  }
}
