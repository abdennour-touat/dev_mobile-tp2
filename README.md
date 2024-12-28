# Flutter True/False Quiz App

A simple yet engaging quiz application built with Flutter that presents users with true/false questions about general knowledge facts. Each question is accompanied by a relevant image to enhance the learning experience.

## Features

- True/False questions with image illustrations
- Immediate feedback on answers
- Simple and intuitive user interface
- Question navigation system
- Visual feedback with color-coded responses
- French language interface

## Structure

The app consists of two main classes:
- `QuizzPage`: The main stateful widget that handles the quiz interface
- `Question`: A data model class that holds question information

## Getting Started


### Installation

1. Clone this repository
2. Navigate to the project directory
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Usage

The quiz presents questions one at a time. For each question:
1. Read the question text
2. View the associated image
3. Select either "Vrai" (True) or "Faux" (False)
4. Receive immediate feedback on your answer
5. Move to the next question using the "Question suivant" button

## Current Question Set

The quiz currently includes questions about:
- The location of the Eiffel Tower
- The Great Wall of China's visibility from space
- Amazon rainforest's oxygen production
- Whales' classification
- Mount Everest's height status

## Customization

To add or modify questions, update the `_questions` list in the `_QuizzPageState` class. Each question requires:
- `text`: The question text
- `isCorrect`: The correct answer (true/false)
- `imageUrl`: A URL to an illustration image (optional)


## License

This project is open source and available under the MIT License.