import 'package:flutter/material.dart';

class ProfileInfoTile extends StatelessWidget {
  final String title;
  final String info;
  final IconData? prefixIcon;
  final IconData? sufficIcon;
  const ProfileInfoTile({
    super.key,
    required this.title,
    required this.info,
    this.prefixIcon,
    this.sufficIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (sufficIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(sufficIcon),
              ),
            Expanded(
              child: Column(
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
            ),
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Icon(prefixIcon),
              ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
