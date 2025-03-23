# Test Weather API - Flutter Project

## Introduction
This Flutter project utilizes WeatherAPI to fetch weather data and IPInfo to determine location information. The application allows users to:
- View real-time weather information for a specific location.
- Store search history locally for quick access.
- Display the real-time local time of a selected location.
- Automatically fetch new weather data when a new day begins in the selected location.
- When retrieving search history, the app will check if the stored data is outdated (i.e., a new day has started) and fetch fresh data from the API if necessary.
- On startup, the app will display the most recently searched location. If no previous searches are found, it will use the user's current location.

---

## Installation and Setup Guide

### 1. Clone the repository
```sh
git clone https://github.com/ystt1/test_weather_api.git
```

### 2. Navigate to the project directory
```sh
cd test_weather_api
```

### 3. Install dependencies
```sh
flutter pub get
```

### 4. Add the `.env` configuration file inside the `assets` folder
Create a `.env` file inside the `assets/` directory and add your API keys:
```
API_KEY=your_weatherapi_key
TOKEN=your_ipinfo_token
```

> ⚠️ Ensure that the `assets` directory is declared in `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/.env
```

### 5. Run the application
Open the terminal and execute:
```sh
flutter run
```
Then select the desired device to run the application.

---

## Contact
If you encounter any issues while running the project, please open an issue on GitHub or contact the repository admin.

Happy coding! 🚀

