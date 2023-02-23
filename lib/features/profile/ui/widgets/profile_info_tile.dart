import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title;
  final String info;
  final IconData? icon;
  const ProfileInfoTile(
      {super.key, required this.title, required this.info, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  info,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            if (icon != null) Icon(icon),
          ],
        ),
        const Divider()
      ],
    );
  }
}
