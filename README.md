# My Trainings App

A Flutter project just for demonstration purpose only.

## Getting Started

### Prerequisites
- Install Flutter (version 3.24.5).
- Install an IDE like Android Studio or Visual Studio Code.

### Setup

1. Clone the repository:
```dart
  git clone https://github.com/devendroid/trainings_app.git
  cd trainings_app
```

2. Install dependencies:

```dart
  flutter pub get
```

3. Run the app:

```dart
   flutter run
```

## Project Structure
```dart
lib/
├── main.dart
├── routing/
│   ├── route_name.dart        # Defined all the routes name
│   ├── router.dart            # Navigation and route management
├── features/  
│   ├── trainings/  
│   │   ├── data/              # Mock API or training repository
│   │   │   ├── repository/    # Repository implementation
│   │   │   ├── model/         # Models for training
│   │   ├── domain/            
│   │   │   ├── repository/    # Repository abstraction (declaration)
│   │   │   ├── usecase/       # Usecases contaning business logics
│   │   ├── presentation/      
│   │   │   ├── bloc/          # BLoC logic for state management
│   │   │   ├── widgets/       # UI layer (widgets and screens)
│   └── shared/  
│       ├── widgets/           # Reusable widgets
│       ├── modal/             # Reusable modal classes.
└── core/  
    ├── utils/                 # Utilities like constants, helpers
    ├── theme/                 # Global app theme
    ├── di/                    # Dependency managements 
    ├── datasource/            # Datasource either from network, local or mock
```

## Packages Used
* **flutter_bloc**: A predictable state management library for Flutter, implementing the BLoC (Business Logic Component) pattern.
* **equatable**: Simplifies equality comparisons in Dart by overriding == and hashCode, often used with state management.
* **get_it**: A simple service locator for dependency injection, useful for managing app-wide services or objects.
* **carousel_slider**: A Flutter widget to create highly customizable and responsive carousels or sliders.
* **modal_bottom_sheet**: A Flutter package to create customizable modal bottom sheets with advanced features like scrollable content.


