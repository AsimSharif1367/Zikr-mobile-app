import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/zikr_logo.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _breathController;
  late final AnimationController _introController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _fadeAnimation;
  Timer? _navigationTimer;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.96, end: 1.04).animate(
      CurvedAnimation(parent: _breathController, curve: Curves.easeInOut),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _introController,
      curve: Curves.easeOutCubic,
    );

    _navigationTimer = Timer(const Duration(milliseconds: 2500), _goNext);
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _breathController.dispose();
    _introController.dispose();
    super.dispose();
  }

  void _goNext() {
    if (!mounted || _navigated) {
      return;
    }
    _navigated = true;
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _goNext,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isDark
                  ? const [AppColors.darkTop, AppColors.darkBottom]
                  : const [AppColors.lightTop, AppColors.lightBottom],
            ),
          ),
          child: Center(
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.2, end: 1).animate(_fadeAnimation),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 390, maxHeight: 844),
                child: AspectRatio(
                  aspectRatio: 390 / 844,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      border: Border.all(
                        color: AppColors.accentGold.withValues(alpha: isDark ? 0.28 : 0.42),
                        width: 1.25,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: isDark ? 0.45 : 0.18),
                          blurRadius: 30,
                          offset: const Offset(0, 18),
                        ),
                        BoxShadow(
                          color: AppColors.accentGold.withValues(alpha: isDark ? 0.09 : 0.12),
                          blurRadius: 22,
                          spreadRadius: 1,
                          offset: const Offset(0, -1),
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isDark
                            ? const [Color(0xFF103524), Color(0xFF0B2A1D)]
                            : const [Color(0xFFF8FFF8), Color(0xFFF2FBF6)],
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -70,
                          right: -65,
                          child: Container(
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.accentGold.withValues(alpha: 0.12),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -85,
                          left: -70,
                          child: Container(
                            width: 230,
                            height: 230,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mainGreen.withValues(alpha: 0.16),
                            ),
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ScaleTransition(
                                scale: _scaleAnimation,
                                child: const ZikrLogo(size: 146),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Tasbeehly',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withValues(alpha: isDark ? 0.32 : 0.18),
                                          blurRadius: 8,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                              ),
                              const SizedBox(height: 9),
                              Text(
                                'Build your daily zikr habit',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: isDark
                                  ? AppColors.accentGold.withValues(alpha: 0.92)
                                  : const Color(0xFF38513F),
                                ),
                              ),
                              const SizedBox(height: 26),
                              SizedBox(
                                width: 26,
                                height: 26,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.8,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isDark ? AppColors.accentGold : AppColors.mainGreen,
                                  ),
                                  backgroundColor: AppColors.accentGold.withValues(alpha: 0.2),
                                ),
                              ),
                              const SizedBox(height: 14),
                              Text(
                                'Tap anywhere to skip',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: isDark
                                          ? Colors.white.withValues(alpha: 0.75)
                                          : Colors.black.withValues(alpha: 0.58),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
