import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color icolor;
  const IconWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.icolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        size: 30,
        color: icolor,
      ),
    );
  }
}
