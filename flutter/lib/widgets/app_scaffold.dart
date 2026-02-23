import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final bool extendBody;

  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.appBar,
    this.extendBody = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: extendBody,
      appBar: appBar,
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      // We don't use a background container here to respect the clean solid/minimal look 
      // defined in the palette, unless a gradient is explicitly desired in specific screens.
      // But based on "Background Light: #F7F9F7", it seems solid.
      body: SafeArea(
        bottom: !extendBody,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
