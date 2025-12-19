import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'logo_widget.dart';
import 'theme_button_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LogoWidget(),
          _HeaderButton(
            text: 'dashboard',
            onTap: () => context.go('/dashboard'),
          ),
          _HeaderButton(text: 'dieta', onTap: () => context.go('/diet')),
          _HeaderButton(text: 'treino', onTap: () => context.go('/training')),
          const ThemeButtonWidget(),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _HeaderButton({required this.text, required this.onTap});

  Color _getSelectedColor() {
    switch (text.toLowerCase()) {
      case 'dieta':
        return const Color(0xFFE9B118);
      case 'dashboard':
        return const Color(0xFF51A4FF);
      case 'treino':
        return const Color(0xFF4CAF50);
      default:
        return const Color(0xFF696969);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final isSelected =
        (text == 'dashboard' && currentLocation.contains('/dashboard')) ||
        (text == 'dieta' && currentLocation.contains('/diet')) ||
        (text == 'treino' && currentLocation.contains('/training'));

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? _getSelectedColor() : const Color(0xFF696969),
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
