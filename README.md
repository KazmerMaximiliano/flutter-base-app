# Flutter Base App

A modern Flutter application built with Clean Architecture and Hexagonal Architecture principles, implementing a single feature approach. This app connects to the [Laravel Base App](https://github.com/KazmerMaximiliano/laravel-base-app) backend API to provide a complete authentication system and user management.

## Table of Contents

- [Architecture Overview](#architecture-overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Backend Integration](#backend-integration)
- [Requirements](#requirements)
- [Installation](#installation)
- [Development](#development)
- [Troubleshooting](#troubleshooting)

## Architecture Overview

This project follows **Clean Architecture** with **Hexagonal Architecture** principles:

- **Single Feature Architecture**: All features are organized in a single, cohesive structure
- **Clean Architecture Layers**: Domain, Data, and Presentation layers are clearly separated
- **Dependency Inversion**: High-level modules don't depend on low-level modules
- **Repository Pattern**: Abstract data access through interfaces
- **Use Cases**: Business logic encapsulated in dedicated classes

## Features

- **🔐 Complete Authentication System**: Register, login, logout with JWT tokens
- **👤 User Management**: Profile viewing and user data management
- **🏗️ Clean Architecture**: Scalable and maintainable code structure
- **🎯 State Management**: Riverpod for reactive state management
- **🔒 Secure Storage**: Flutter Secure Storage for sensitive data
- **🌍 Internationalization**: Multi-language support with flutter_i18n
- **📱 Responsive Design**: Adaptive layouts for different screen sizes
- **🧭 Navigation**: Go Router for type-safe navigation
- **🎨 Modern UI**: Material Design with custom theming
- **⚡ Code Generation**: Automated code generation with build_runner

## Tech Stack

### Core Dependencies

- **Flutter SDK**: ^3.1.2
- **Dart**: ^3.1.2

### State Management & Architecture

- **flutter_riverpod**: ^2.4.2 - Reactive state management
- **riverpod_annotation**: ^2.1.6 - Code generation for Riverpod
- **get_it**: ^7.6.4 - Dependency injection
- **dartz**: ^0.10.1 - Functional programming utilities

### Networking & Data

- **dio**: ^5.3.3 - HTTP client for API communication
- **json_annotation**: ^4.8.1 - JSON serialization
- **flutter_secure_storage**: ^9.0.0 - Secure local storage
- **shared_preferences**: ^2.2.2 - Local preferences storage

### Navigation & Routing

- **go_router**: ^12.0.0 - Declarative routing solution

### Internationalization

- **flutter_i18n**: ^0.34.0 - Internationalization support
- **flutter_localizations**: SDK - Localization widgets
- **intl**: ^0.18.1 - Internationalization utilities

### UI & Design

- **google_fonts**: ^6.0.0 - Custom fonts
- **font_awesome_flutter**: ^10.5.0 - Icon library

### Utilities

- **email_validator**: ^2.1.17 - Email validation
- **equatable**: ^2.0.5 - Value equality
- **freezed_annotation**: ^2.4.1 - Immutable data classes
- **flutter_dotenv**: ^5.1.0 - Environment configuration

## Project Structure

```
lib/
├── main.dart                           # App entry point
├── injection_container.dart            # Dependency injection setup
├── core/                              # Core utilities and configurations
│   ├── config/
│   │   └── enviroment_config.dart     # Environment variables
│   └── http/                          # HTTP utilities
│       ├── custom_error.dart          # Error handling
│       └── server_exception.dart      # Server exceptions
└── features/                          # Single feature architecture
    ├── data/                          # Data layer
    │   ├── datasources/
    │   │   ├── local/
    │   │   │   └── security_dao.dart   # Secure storage operations
    │   │   └── remote/
    │   │       ├── api_client.dart     # HTTP client configuration
    │   │       ├── auth_client.dart    # Authentication HTTP client
    │   │       └── api/
    │   │           ├── auth_remote_datasource.dart
    │   │           └── user_remote_datasource.dart
    │   ├── models/                     # Data models
    │   │   ├── auth_model.dart
    │   │   └── user_model.dart
    │   └── repositories/               # Repository implementations
    │       ├── auth_repository.dart
    │       └── user_repository.dart
    ├── domain/                         # Domain layer
    │   ├── entities/                   # Business entities
    │   │   ├── auth.dart
    │   │   └── user.dart
    │   ├── presenters/                 # Repository interfaces
    │   │   ├── auth_presenter.dart
    │   │   └── user_presenter.dart
    │   ├── services/                   # Domain services
    │   │   └── shared_preferences.dart
    │   └── usecases/                   # Business use cases
    │       ├── auth/
    │       │   ├── is_authenticated_use_case.dart
    │       │   ├── register_use_case.dart
    │       │   ├── signin_use_case.dart
    │       │   └── singout_use_case.dart
    │       └── user/
    │           └── get_user_use_case.dart
    └── presentation/                   # Presentation layer
        ├── layouts/                    # App layouts
        │   ├── auth_layout.dart
        │   └── main_layout.dart
        ├── providers/                  # Riverpod providers
        │   ├── auth_providers.dart
        │   ├── bottom_navigation_provider.dart
        │   └── user_provider.dart
        ├── router/                     # Navigation setup
        │   ├── router_listenable.dart
        │   └── routes.dart
        └── screens/                    # UI screens
            ├── auth/
            │   ├── login_screen.dart
            │   └── register_screen.dart
            ├── home/
            │   └── home_screen.dart
            ├── splash/
            │   └── splash_screen.dart
            └── user/
                └── user_screen.dart
```

## Backend Integration

This Flutter app is designed to work with the **Laravel Base App** backend, which provides:

- **Authentication API**: Register, login, logout endpoints
- **User Management**: User profile and data endpoints
- **Laravel Sanctum**: Token-based authentication
- **RESTful API**: Standard HTTP methods and response formats

### API Endpoints Used

| Method | Endpoint        | Description           |
| ------ | --------------- | --------------------- |
| POST   | `/api/register` | User registration     |
| POST   | `/api/login`    | User authentication   |
| POST   | `/api/logout`   | User logout           |
| GET    | `/api/user`     | Get current user data |

## Requirements

- **Flutter SDK**: >=3.1.2 <4.0.0
- **Dart SDK**: >=3.1.2
- **Android SDK**: API level 21+ (Android 5.0+)
- **iOS**: iOS 11.0+
- **Backend**: Laravel Base App running

## Installation

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd flutter-base-app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Environment setup**

   ```bash
   cp .env.example .env
   ```

   Update the `.env` file with your backend API URL:

   ```env
   API_URL=http://localhost:8000/api
   ```

4. **Code generation**

   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## Development

### Code Generation

This project uses code generation for various features. Run the following command during development:

```bash
flutter pub run build_runner watch -d
```

This will watch for changes and automatically generate:

- **Riverpod providers** (`.g.dart` files)
- **JSON serialization** (`.g.dart` files)
- **Go Router routes** (`.g.dart` files)
- **Freezed classes** (`.g.dart` files)

## Troubleshooting

### Common Issues

1. **Build runner issues**

   ```bash
   flutter pub run build_runner clean
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

2. **Dependency conflicts**

   ```bash
   flutter clean
   flutter pub get
   ```

3. **iOS build issues**
   ```bash
   cd ios && pod install && cd ..
   ```
