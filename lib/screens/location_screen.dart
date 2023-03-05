import 'package:climax/screens/city_screen.dart';
import 'package:flutter/material.dart';
import '../utilities/constants.dart';
// import '../screens/loading_screen.dart';
import '../services/weather.dart';

// This is when you require for a new location weather information......

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  late String weatherReport;
  late String cityName;
  late int temperatures;
  late String temperature;
  // LoadingScreen loadScreen = LoadingScreen();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locateWeather(widget.locationWeather);
  }

  void locateWeather(theWeather) {
    setState(() {
      // print(theWeather.toString());
      // theWeather;
      if (theWeather == null) {
        temperatures = 0;
        weatherReport = "Error";
        temperature = "Unable to get weather data";
        cityName = "";
        return;
      }
      int weatherId = theWeather['weather'][0]['id'];
      cityName = theWeather['name'];
      double temp = theWeather['main']['temp'];
      temperatures = temp.round();
      int temperate = temp.toInt();

      temperature = weather.getMessage(temperate);
      weatherReport = weather.getWeatherIcon(weatherId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherDatum = await weather.getLocationWeather();
                      locateWeather(weatherDatum);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () async {
                          var typedCity = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CityScreen(),
                            ),
                          );
                          if (typedCity != null) {
                            var weatherDatum =
                                await weather.getCityWeather(typedCity);
                            locateWeather(weatherDatum);
                          }
                        },
                      );
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperatures°c',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherReport,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$temperature $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//It's 🍦 time in $cityName
// var weatherReport = jsonDecode(data)['weather'][0]['id'];
// var cityName = jsonDecode(data)['name'];
// var temperature = jsonDecode(data)['main']['temp'];
