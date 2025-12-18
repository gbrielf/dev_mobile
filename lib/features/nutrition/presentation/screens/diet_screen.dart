import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:achieve_project/features/nutrition/presentation/providers/nutrition_provider.dart';
import '../../../../core/widgets/header_widget.dart';
import '../widgets/snack_card_widget.dart';

class DietScreen extends ConsumerWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dietAsync = ref.watch(nutritionProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(height: 8),
              const HeaderWidget(),
              const SizedBox(height: 15),
              const Text(
                'Dieta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: dietAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                  data: (meals) => ListView.separated(
                    itemCount: meals.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return SnackCardWidget(meal: meal);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
