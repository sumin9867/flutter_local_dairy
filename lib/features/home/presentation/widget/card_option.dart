import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class ChatOptionsWidget extends StatelessWidget {
  const ChatOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double cardHeight = size.height * 0.3; // 30% of screen height
    final double cardPadding = size.width * 0.04; // 4% horizontal padding
    final double spacing = size.width * 0.03;

    return Padding(
      padding: EdgeInsets.all(cardPadding),
      child: Row(
        children: [
          // Left: Large Purple Card
          Expanded(
            flex: 1,
            child: Container(
              height: cardHeight,
              padding: EdgeInsets.all(cardPadding),
              decoration: BoxDecoration(
                color: const Color(0xFFE1D9FB), // Light purple
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(IconsaxPlusLinear.microphone),
                  ),
                  const Spacer(),
                  const Text(
                    "Talk with Cooper",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Let's try it now",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(width: spacing),

          // Right Side: Two stacked cards
          Expanded(
            flex: 1,
            child: Column(
              children: [
                // Top Right: New Chat
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: cardHeight / 2 - spacing / 2,
                      padding: EdgeInsets.all(cardPadding),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF2C6), // Light yellow
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    crossAxisAlignment: CrossAxisAlignment.start,

                        children: const [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(IconsaxPlusLinear.message_search),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "New chat",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "New",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: spacing),

                // Bottom Right: Search by image
                Container(
                  width: double.infinity,
                  height: cardHeight / 2 - spacing / 2,
                  padding: EdgeInsets.all(cardPadding),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1D1D),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white12,
                        child: Icon(IconsaxPlusLinear.user_search, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Search by name",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
