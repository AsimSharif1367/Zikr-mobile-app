import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'premium_card.dart';

class ZikrTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? count;
  final VoidCallback onTap;
  final Widget? trailing;

  const ZikrTile({
    super.key,
    required this.title,
    this.subtitle,
    this.count,
    required this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.s),
      child: PremiumCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m, vertical: AppSpacing.s + 4),
        child: Row(
          children: [
            // Decorative bullet/icon
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: isDark 
                    ? AppColors.mainGreen.withValues(alpha: 0.2) 
                    : AppColors.softGreen,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: count != null 
                    ? Text(
                        count!, 
                        style: TextStyle(
                          color: AppColors.mainGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      )
                    : const Icon(
                        Icons.brightness_2_outlined, // Crescent
                        color: AppColors.mainGreen,
                        size: 20,
                      ),
              ),
            ),
            const SizedBox(width: AppSpacing.m),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: isDark ? AppColors.textDark : AppColors.textLight,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark ? Colors.grey[400] : AppColors.textGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing!,
            if (trailing == null) 
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16,
                color: isDark ? Colors.white30 : Colors.black26,
              ),
          ],
        ),
      ),
    );
  }
}
