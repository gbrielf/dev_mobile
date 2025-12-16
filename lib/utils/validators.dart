class Validators {
  static String? validateEmail(String? value){
    if (value == null || value.isEmpty) return 'E-mail obrigatório';
    if (!value.contains('@')) return 'E-mail inválido';
    return null;
  }

  static String? validatePassword(String? value){
    if(value==null || value.isEmpty) return 'Senha obrigatória';
    if(value.length < 6) return 'Senha deve ter ao menos 6 caracteres';
    return null;
  }
}