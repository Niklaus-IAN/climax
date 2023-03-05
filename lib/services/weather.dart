import 'package:climax/services/networking.dart';
import 'package:climax/services/location.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    NetworkHelper weatherData = NetworkHelper(
        authority: 'api.openweathermap.org',
        path: '/data/2.5/weather',
        link: {
          'q': cityName,
          'appid': '55d7f49802a9cc4dfa0e0f4dcc5603ac',
          'units': 'metric'
        });

    var dweatherData = await weatherData.getData();
    return dweatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    double longitude = location.longitude;
    // print(longitude);
    double latitude = location.latitude;
    // print(latitude);

    NetworkHelper weatherData = NetworkHelper(
      authority: 'api.openweathermap.org',
      path: '/data/2.5/weather',
      link: {
        'lat': '$latitude',
        'lon': '$longitude',
        'appid': '55d7f49802a9cc4dfa0e0f4dcc5603ac',
        'units': 'metric'
      },
    );

    // const spinkit = SpinKitCircle(
    //   color: Colors.white,
    //   size: 50.0,
    // );

    var dweatherData = await weatherData.getData();
    return dweatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
