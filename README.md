# 🎯 Achieve App - Plataforma de Nutrição e Treinamento

## 📱 Sobre o Projeto

**Achieve App** é uma aplicação mobile multiplataforma desenvolvida em **Flutter** para gerenciamento de nutrição e treinamento físico. O aplicativo oferece uma experiência completa para usuários que buscam acompanhar seus objetivos de saúde e bem-estar através de uma interface moderna e intuitiva.

## ✨ Principais Funcionalidades

- **🔐 Autenticação Segura**: Sistema completo de login e cadastro com armazenamento seguro de credenciais
- **🥗 Gestão Nutricional**: Acompanhamento de dietas, refeições e metas nutricionais
- **💪 Planos de Treinamento**: Gerenciamento de rotinas de exercícios e progressão
- **📊 Dashboard Interativo**: Visualização de métricas e progresso do usuário (ainda não implementado)
- **🎥 Conteúdo Multimídia**: Suporte para vídeos de exercícios e tutoriais

## 🛠️ Tecnologias Utilizadas

- **Flutter 3.10+**: Framework para desenvolvimento multiplataforma
- **Dart**: Linguagem de programação
- **Riverpod**: Gerenciamento de estado reativo e eficiente
- **GoRouter**: Navegação declarativa e type-safe
- **Dio**: Cliente HTTP para comunicação com API REST
- **Flutter Secure Storage**: Armazenamento seguro de dados sensíveis

## 🏗️ Arquitetura

O projeto segue os princípios de **Clean Architecture**, separando responsabilidades em camadas:

```
lib/
├── core/                 # Recursos compartilhados (Router, Temas, Utilitários)
├── features/             # Módulos de funcionalidades
│   ├── auth/             # Autenticação
│   │   ├── data/         # Repositórios e Models
│   │   ├── domain/       # Entidades e Casos de Uso
│   │   └── presentation/ # UI e Providers (Riverpod)
│   ├── dashboard/        # Painel principal
│   ├── nutrition/        # Gestão nutricional
│   └── training/         # Planos de treinamento
```

Essa estrutura modular garante:
- ✅ **Separação de responsabilidades**
- ✅ **Testabilidade**
- ✅ **Manutenibilidade**
- ✅ **Escalabilidade**

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK 3.10+
- Dart SDK
- Android Studio / Xcode (para emuladores)

### Instalação

```bash
# Clone o repositório
git clone [URL_DO_REPOSITORIO]

# Acesse o diretório do projeto
cd achieve_app_nutrition

# Instale as dependências
flutter pub get

# Execute o aplicativo
flutter run
```

## 📦 Build para Produção

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## 🎨 Características Técnicas

- Interface responsiva e adaptativa
- Theme customizado (Dark Mode)
- Navegação fluida com animações
- Cache de dados local
- Integração com API REST
- Tratamento robusto de erros

## � Protótipos de Telas

### Splash Screen
![Splash Screen](docs/screenshots/splash-screen.png)

### Authentication Screen
![Authentication Screen](docs/screenshots/authentication-screen.png)

### Diet Screen
![Diet Screen](docs/screenshots/diet-screen-achieve.png)

### Diet Screen - Card Expandido
![Diet Screen with Card Expanded](docs/screenshots/diet-screen-achieve-with-card-expanded.png)

### Training Screen
![Training Screen](docs/screenshots/training-screen-achieve.png)

### Training Screen - Card Expandido
![Training Screen with Card Expanded](docs/screenshots/training-screen-achieve-with-card-expanded.png)

## �👨‍💻 Desenvolvedor

Projeto desenvolvido como parte do portfólio de desenvolvimento mobile multiplataforma.

---

**Status**: Em desenvolvimento ativo 🚧

**Versão**: 1.0.0