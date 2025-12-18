# flutter_project_nutrition

## Futura arquitetura a ser aplicada:

lib/
├── core/                 # Coisas globais (Router, Temas, Erros, DioProvider)
├── features/             # Cada funcionalidade do app é uma "Feature"
│   ├── auth/             # Autenticação (Login, Cadastro)
│   │   ├── data/         # CAMADA DE DADOS: Repositories e Models (JSON)
│   │   ├── domain/       # CAMADA DE NEGÓCIO: Entidades e Casos de Uso
│   │   └── presentation/ # CAMADA VISUAL: Widgets, Screens e Providers (Riverpod)
│   ├── nutrition/        # Outra feature independente
│   └── training/         # Outra feature independente