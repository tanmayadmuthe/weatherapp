# Minimal Weather App

A simple weather app built with Flutter and Dart. This app provides weather data for the user's current location using geolocation.

## Features

- Fetch current weather data based on user's geolocation.
- Clean and minimalistic UI.
- Error handling for geolocation and weather data fetch.

## Screenshots

![cloudy1](https://github.com/user-attachments/assets/dfeb2310-4b5e-4d16-b482-79505fb3907a)
![clear1](https://github.com/user-attachments/assets/1779ed2d-a8f4-4eae-8ecc-223f787e2b9e)
![cloudy](https://github.com/user-attachments/assets/82cbc0b6-49b7-4ebb-8d28-dd80f988917e)
![clear](https://github.com/user-attachments/assets/251cfa8d-f15d-41ed-8629-4d7b982caad2)


## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- A code editor, such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/tanmayadmuthe/weatherapp.git
   ```

2. Navigate to the repository
   ```bash
     cd weatherapp
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app
   ```bash
   flutter run
   ```

## Dependencies
This project uses the following dependencies:

geolocator: For fetching the user's current location.
geocoding: For reverse geocoding the location coordinates.
http: For fetching weather data from a weather API (OpenWeatherMap).

## API Setup
To get weather data, you will need to sign up for an API key from OpenWeatherMap.
1. Create an account and get an API key.
2. Add your API key to the app in the appropriate file (e.g., lib/api_service.dart):
```dart
const String apiKey = 'YOUR_API_KEY';
```
## Contributing
Feel free to fork this repository and submit pull requests. Contributions are welcome!

## License
This project is licensed under the MIT License.
```
Feel free to modify the content, add screenshots, and include any additional details specific to your project.
```


