import 'package:flutter/material.dart';
import 'package:hk_music/common/constants/colors.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;

  const ProfileItem({
    required this.title,
    required this.subtitle,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
      ),
    );
  }
}
