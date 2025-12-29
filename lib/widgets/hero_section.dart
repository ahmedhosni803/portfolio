
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../core/constants/app_data.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Column(
        children: [
           Text(
            AppData.heroTitle,
            textAlign: TextAlign.center,
            style: AppTheme.heroTitle,
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.3, end: 0),
          
          const SizedBox(height: 20),
          
           Text(
            AppData.heroSubtitle,
            textAlign: TextAlign.center,
            style: AppTheme.bodyText.copyWith(fontSize: 22),
          ).animate().fadeIn(delay: 300.ms, duration: 800.ms).slideY(begin: 0.3, end: 0),
          
           const SizedBox(height: 50),
           
           Text( 
            AppData.heroDescription,
             textAlign: TextAlign.center,
             style: AppTheme.bodyText,
           ).animate().fadeIn(delay: 600.ms, duration: 800.ms),
        ],
      ),
    );
  }
}
