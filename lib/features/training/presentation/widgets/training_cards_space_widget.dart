import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'training_card_widget.dart';
import '../providers/training_provider.dart';

class TrainingCardsSpaceWidget extends ConsumerWidget {
  const TrainingCardsSpaceWidget({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    final trainingAsync = ref.watch(trainingProvider);

    return trainingAsync.when(
      loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
      error: (err, stack) => Center(child: Text('Erro ao carregar treinos: $err')),
      data: (exercises){
        if(exercises.isEmpty){
          return const Center(child: Text('Nenhum exercício para hoje.', style: TextStyle(color: Colors.white70)));
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical:16),
          itemCount: exercises.length,
          separatorBuilder: (_,__) => const SizedBox(height:12),
          itemBuilder: (context, index){
            final exercise = exercises[index];
            // passando o objeto completo para o card, assim como em dieta
            return TrainingCardWidget(exercise: exercise);
          },
        );
      },
      );
  }
}
