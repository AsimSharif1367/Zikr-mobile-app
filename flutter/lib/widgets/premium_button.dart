import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PremiumButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isSecondary;
  final bool isFullWidth;

  const PremiumButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isSecondary = false,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Gradient for primary button
    final Gradient? gradient = isSecondary 
        ? null 
        : LinearGradient(
            colors: [
              AppColors.mainGreen,
              AppColors.mainGreen.withValues(alpha: 0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );

    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: isSecondary 
          ? Colors.transparent 
          : Colors.transparent, // Handled by Container
      shadowColor: Colors.transparent, // Handled by Container
      foregroundColor: isSecondary 
          ? (isDark ? Colors.white : AppColors.mainGreen) 
          : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusL),
        side: isSecondary 
            ? BorderSide(color: isDark ? Colors.white30 : AppColors.mainGreen, width: 1.5)
            : BorderSide.none,
      ),
      padding: EdgeInsets.zero, // Padding inside container
    );

    Widget content = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20),
          const SizedBox(width: AppSpacing.s),
        ],
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );

    Widget button = InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(AppSpacing.radiusL),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l, 
          vertical: AppSpacing.m
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.radiusL),
          gradient: isSecondary ? null : gradient,
          color: isSecondary ? null : AppColors.mainGreen,
          boxShadow: isSecondary ? [] : [
            BoxShadow(
              color: AppColors.mainGreen.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(child: content),
      ),
    );

    if (!isFullWidth) {
      return UnconstrainedBox(child: button);
    }
    
    return button;
  }
}
