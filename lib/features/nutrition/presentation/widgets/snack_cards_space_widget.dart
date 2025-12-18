import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'snack_card_widget.dart';
import '../providers/nutrition_provider.dart';

class SnackCardsSpaceWidget extends ConsumerWidget {
  const SnackCardsSpaceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. O watch fica observando o estado do seu nutritionProvider (lógica de rede)
    final mealsAsync = ref.watch(nutritionProvider);

    return mealsAsync.when(
      loading: () =>
          const Center(child: CircularProgressIndicator(color: Colors.white)),
      error: (e, st) => Center(
        child: Text('Erro: $e', style: const TextStyle(color: Colors.white)),
      ),
      data: (meals) {
        if (meals.isEmpty) {
          return const Center(
            child: Text(
              'Nenhuma refeição encontrada.',
              style: TextStyle(color: Colors.white70),
            ),
          ); // Faltava o ponto e vírgula aqui
        }

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          itemCount: meals.length, // Corrigido de "lenght" para "length"
          separatorBuilder: (_, __) => const SizedBox(height: 4),
          itemBuilder: (context, index) {
            final meal = meals[index];

            // 2. Agora passamos apenas o objeto meal completo para o card
            // O card se encarrega de ler o .name e o .schedule
            return SnackCardWidget(meal: meal);
          },
        );
      },
    );
  }
}
