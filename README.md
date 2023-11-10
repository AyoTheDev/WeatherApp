# Flutter Weather Application

## Overview

This Flutter weather application is designed to provide you with a quick and easy way to access weather information from [weatherapi.com](https://weatherapi.com). This readme will guide you through the process of obtaining an API key, setting it in the environment file, and understanding the libraries and patterns used in the project.

## Getting Started

Follow these steps to get started with the project:

1. **Clone the Repository:**

   ```bash
   git clone git@github.com:YesayanHarutyun/flutter_weather_app.git
   cd flutter-weather-app
   ```

2. **Obtain an API Key:**

   - Visit [https://www.weatherapi.com/](https://www.weatherapi.com/) and sign up or log in to get your API key.

3. **Set Up Environment Variables:**

   - Create a `.env` file in the root of your project.
   - Add your API key to the `.env` file like this:

     ```plaintext
     API_KEY=your-api-key
     ```

4. **Install Dependencies:**

   Run the following command to install the required dependencies:

   ```bash
   flutter pub get
   ```

5. **Run the Application:**

   Launch the Flutter application using the following command:

   ```bash
   flutter run
   ```

## Project Structure

This Flutter weather application follows a structured project layout with the following key packages, each serving a specific purpose:

- **`lib` Directory:** The main source code directory containing the core application logic and UI components.
   - **`main.dart`:** The entry point of the application.

- **`data` Package:** The `data` package is responsible for managing data-related operations. It handles data fetching from external sources like APIs or databases, as well as data storage and caching. Key components within this package include data models, repositories, and data sources.

- **`domain` Package:** The `domain` package defines the core business logic and domain models of the application. It acts as an abstraction layer between the data layer and the presentation layer. Here, you'll find the core business logic, entities, and use cases.

- **`navigation` Package:** The `navigation` package is responsible for managing the navigation flow within the application. It includes routing and navigation logic, ensuring a smooth user experience as they move between different screens and features of the app.

- **`presentation` Package:** The `presentation` package is the user interface layer of the application. It contains all the UI components, including screens, widgets, themes, and ViewModels. This package focuses on the visual and interactive aspects of the application, providing a delightful user interface.

- **`utils` Package:** The `utils` package contains utility functions, helper classes, and tools used throughout the application. It helps keep the codebase organized by encapsulating common functionalities that are used in different parts of the project.

This structured project layout follows best practices for maintainability and scalability. By separating concerns into these packages, it becomes easier to work on specific parts of the application independently, leading to a more organized and maintainable codebase.

## Dependencies

Here is a list of dependencies used in this project:

- `cupertino_icons: ^1.0.2`
- `build_runner: ^2.4.6`
- `anim_search_bar: ^2.0.3`
- `geocoding: ^2.0.4`
- `geolocator: ^10.0.1`
- `dio: ^5.3.2`
- `freezed_annotation: ^2.2.0`
- `freezed: ^2.3.2`
- `state_notifier: ^0.7.2+1`
- `sqflite: ^2.2.2`
- `path: ^1.8.2`
- `intl: ^0.18.1`
- `shared_preferences: ^2.2.2`
- `flutter_dotenv: ^5.1.0`
- `flutter_riverpod: ^2.1.3`
- `flutter_typeahead: ^4.8.0`
- `flutter_svg: ^2.0.5`
- `flutter_lints: ^2.0.0`
- `flutter: sdk: flutter`
- `flutter_localizations: sdk: flutter`
- `mockito: ^5.3.2`
- `flutter_test: sdk: flutter`
