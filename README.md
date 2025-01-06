# Flutter Applications Repository

This repository contains multiple Flutter applications demonstrating different state management approaches and functionalities. It includes a Quiz App implemented with both Provider and BLoC patterns, and a Weather App using standard Flutter state management.

## Applications Overview

### 1. Quiz App (Provider Implementation)
### 2. Quiz App (BLoC Implementation)
### 3. Weather App

## Project Structure

```
lib/
├── main.dart               # App entry point
├── quiz/
│   ├── provider/          # Provider implementation
│   │   ├── quiz_provider.dart
│   │   └── quiz_page.dart
│   ├── bloc/             # BLoC implementation
│   │   ├── quiz_bloc.dart
│   │   ├── quiz_event.dart
│   │   ├── quiz_state.dart
│   │   └── quiz_page.dart
│   └── models/
│       └── question.dart
├── weather/
│   ├── models/
│   │   └── weather.dart
│   ├── services/
│   │   └── weather_service.dart
│   ├── components/
│   │   └── forecast.dart
│   └── pages/
│       └── weather_page.dart
```


## Quiz App Features

Common features across both implementations:
- True/False questions with image illustrations
- Immediate feedback on answers
- Question navigation system
- Visual feedback with color-coded responses
- French language interface

### Provider Implementation
- State management using Provider pattern
- Simple and intuitive state updates
- Direct access to state through context

### BLoC Implementation
- Event-driven architecture
- Clear separation of business logic
- Immutable state management
- Predictable state transitions

## Weather App Features

- Current weather display
- 4-day weather forecast
- City-based weather search
- Detailed weather metrics:
    - Temperature
    - Humidity
    - Wind Speed
    - Precipitation
- Weather condition icons
- Formatted date display

## Setup and Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. For Weather App: Get an API key from [OpenWeatherMap](https://openweathermap.org/api)
4. Update the API key in `weather/services/weather_service.dart`

## Usage

### Quiz App (Provider)
```dart
// Access the quiz state
final quizProvider = context.watch<QuizProvider>();

// Update state
context.read<QuizProvider>().checkAnswer(true);
```

### Quiz App (BLoC)
```dart
// Dispatch events
context.read<QuizBloc>().add(CheckAnswerEvent(true));
context.read<QuizBloc>().add(NextQuestionEvent());
```

### Weather App
1. Launch the app
2. Enter a city name
3. Tap "Get Weather"
4. View weather information and forecast

## State Management Comparison

### Provider
- Pros:
    - Simple implementation
    - Easy to understand
    - Direct state access
- Best for:
    - Small to medium applications
    - Simple state management needs

### BLoC
- Pros:
    - Better separation of concerns
    - Testable business logic
    - Predictable state flow
- Best for:
    - Large applications
    - Complex state management
    - Team development

## Error Handling

Each application implements error handling for:
- Invalid inputs
- Failed API requests (Weather App)
- State transitions
- User feedback

## Contributing

1. Fork the repository
2. Create a feature branch
3. Implement your changes
4. Add tests if applicable
5. Submit a pull request

## Testing

Run tests using:
```bash
flutter test
```

