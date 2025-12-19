String getNutritionScheduleLabel(int schedule) {
  const labels = {
    1: '08:00', // Café da manhã
    2: '10:30', // Lanche da manhã
    3: '13:00', // Almoço
    4: '16:00', // Lanche da tarde
    5: '20:00', // Jantar
    6: '22:00', // Ceia
  };
  return labels[schedule] ?? 'N/F';
}