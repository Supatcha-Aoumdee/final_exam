import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  final String name;
  final String email;
  final String? imageUrl;
  final bool isAsset;

  const Answer1({
    super.key,
    required this.name,
    required this.email,
    this.imageUrl,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: isAsset
                  ? AssetImage(imageUrl!) as ImageProvider
                  : NetworkImage(imageUrl!),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
