import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_project_nutrition/features/nutrition/nutrition_provider.dart';
import '../widgets/common/header_widget.dart';
import '../widgets/diet/snack_card_widget.dart';

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
                  data: (meals) => ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      final String itemsDescription = meal.items
                          .map(
                            (item) =>
                                "${item.name}: ${item.weight ?? item.portion}",
                          )
                          .join(", ");
                      return SnackCardWidget(
                        title: meal.name,
                        description: itemsDescription,
                      );
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
