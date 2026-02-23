import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';
import '../widgets/zikr_logo.dart'; // Reusing logo widget style for placeholders if needed

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String routeName = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      title: 'Daily Zikr Reminders',
      description: 'Receive gentle reminders to keep your heart connected to Allah throughout the day.',
      icon: Icons.notifications_active_outlined,
    ),
    OnboardingContent(
      title: 'Custom Zikr Creation',
      description: 'Personalize your spiritual journey by adding your own specialized zikr and duas.',
      icon: Icons.edit_note_rounded,
    ),
    OnboardingContent(
      title: 'Tasbeeh Counter',
      description: 'Track your dhikr with a beautiful digital tasbeeh designed for focus and ease.',
      icon: Icons.fingerprint,
    ),
    OnboardingContent(
      title: 'Streak & Analytics',
      description: 'Visualize your consistency and build a lasting habit of remembrance.',
      icon: Icons.insights_rounded,
    ),
  ];

  void _onNext() {
    if (_currentPage < _contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color activeDotColor = AppColors.accentGold;
    final Color inactiveDotColor = isDark ? Colors.white24 : Colors.black12;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? const [AppColors.darkTop, AppColors.darkBottom]
                : const [AppColors.lightTop, AppColors.lightBottom],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _contents.length,
                  itemBuilder: (context, index) {
                    return _OnboardingPage(content: _contents[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip button (visible unless on last page)
                    Opacity(
                      opacity: _currentPage == _contents.length - 1 ? 0 : 1,
                      child: TextButton(
                        onPressed:
                            _currentPage == _contents.length - 1 ? null : _finishOnboarding,
                        child: Text(
                          'Skip',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 14,
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                        ),
                      ),
                    ),
                    // Page Indicator
                    Row(
                      children: List.generate(
                        _contents.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: _currentPage == index ? 24 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? activeDotColor
                                : inactiveDotColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    // Next / Get Started Button
                    ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainGreen,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shadowColor: AppColors.mainGreen.withValues(alpha: 0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        _currentPage == _contents.length - 1 ? 'Get Started' : 'Next',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingContent {
  final String title;
  final String description;
  final IconData icon;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class _OnboardingPage extends StatelessWidget {
  final OnboardingContent content;

  const _OnboardingPage({required this.content});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mainGreen.withValues(alpha: 0.08),
              border: Border.all(
                color: AppColors.accentGold.withValues(alpha: 0.2),
                width: 1.5,
              ),
            ),
            child: Icon(
              content.icon,
              size: 80,
              color: isDark ? AppColors.accentGold : AppColors.mainGreen,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            content.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 26,
                  height: 1.2,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            content.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                  height: 1.5,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
          ),
        ],
      ),
    );
  }
}
