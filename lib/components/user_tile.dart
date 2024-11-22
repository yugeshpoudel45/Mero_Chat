import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 32,
            ),
            Text(
              text,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
