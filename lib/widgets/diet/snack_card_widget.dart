class SnackCardWidget extends StatefulWidget {
  final Meal meal; // Passamos o objeto completo para ter acesso aos itens
  final String time;

  const SnackCardWidget({super.key, required this.meal, required this.time});

  @override
  State<SnackCardWidget> createState() => _SnackCardWidgetState();
}

class _SnackCardWidgetState extends State<SnackCardWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2D2D),
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // CABEÇALHO DO CARD
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.meal.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => isExpanded = !isExpanded),
                child: ButtonExpandDetailsWidget(
                  width: 24,
                  height: 24,
                  isExpanded: isExpanded, // Passamos o estado para o botão
                ),
              ),
            ],
          ),

          // ÁREA EXPANDIDA (O visual da imagem)
          if (isExpanded) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFC4C4C4), // Cinza claro da imagem
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Alimentos",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Lista de itens formatados como nos botões escuros da imagem
                  ...widget.meal.items
                      .map((item) => _buildItemRow(item))
                      .toList(),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Widget para cada linha de alimento (o retângulo escuro dentro do cinza)
  Widget _buildItemRow(MealItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF333333), // Fundo escuro do item
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "${item.weight}g ou ${item.portion} port.",
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
