import 'package:climax/screens/location_screen.dart';
import 'package:climax/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// This is when the screen initially loads.........

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

// class _LoadingScreenState extends State<LoadingScreen> {
//   Future<void> getLocation() async {
//     debugPrint('running');
//     LocationPermission permission = await Geolocator.requestPermission();
//     debugPrint(permission.name);
//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.low);
//       debugPrint(position.toString());
//     }
//   }

class _LoadingScreenState extends State<LoadingScreen> {
  // late double longitude;
  // late double latitude;

  void getLocationData() async {
    WeatherModel dWeatherModel = WeatherModel();
    dynamic dweatherData = await dWeatherModel.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationWeather: dweatherData),
      ),
    );
    // await weatherData.getData();
  }

  // void getData() async {
  //   // print(longitude);
  //   // print(latitude);
  //
  //   // https://api.openweathermap.org/data/2.5/weather?q=London&appid={55d7f49802a9cc4dfa0e0f4dcc5603ac};
  //   // https://jsonplaceholder.typicode.com/posts/1/comments
  //   // try {
  //   //   Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
  //   //       {'q': 'Lagos', 'appid': '55d7f49802a9cc4dfa0e0f4dcc5603ac'});
  //   //   // api.openweathermap.org/data/2.5/weather?q=London&appid={55d7f49802a9cc4dfa0e0f4dcc5603ac}
  //   //   http.Response response = await http.get(url);
  //   //   print(response.statusCode);
  //   //   print(response.body);
  //   // } catch (e) {
  //   //   print(e.toString());
  //   // }
  //
  //   Uri url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
  //     'lat': '$latitude',
  //     'lon': '$longitude',
  //     'appid': '55d7f49802a9cc4dfa0e0f4dcc5603ac'
  //   });
  //   // api.openweathermap.org/data/2.5/weather?q=London&appid={55d7f49802a9cc4dfa0e0f4dcc5603ac}
  //   // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
  //   http.Response response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     // print(response.statusCode);
  //     // print(response.body);
  //     String data = response.body;
  //
  //     // var longitude = jsonDecode(data)['coord']['lon'];
  //     // print(longitude);
  //
  //     var weatherReport = jsonDecode(data)['weather'][0]['id'];
  //     var cityName = jsonDecode(data)['name'];
  //     var temperature = jsonDecode(data)['main']['temp'];
  //
  //     print(weatherReport);
  //     print(cityName);
  //     print(temperature);
  //   } else {
  //     print(response.statusCode);
  //   }

  // Response response =
  //     await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  // print(response.body);

  //   try {
  //     var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
  //     var response = await http.get(url);
  //     print(response.body);
  //   } catch (e) {
  //     print(e.toString());
  //   }

  /*
  The userInfo, host and port components are set from the authority argument.
  If authority is null or empty, the created Uri has no authority, and isn't directly usable as an HTTP URL, which must have a non-empty host.

  The path component is set from the unencodedPath argument.
  The path passed must not be encoded as this constructor encodes the path. Only / is recognized as path separtor.
  If omitted, the path defaults to being empty.

  The query component is set from the optional queryParameters argument.
  */

  // Future<http.Response> fetchAlbum() async {
  //   var response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  //   return response;
  // }

  //get() grabs the url and returns a future response
  //The http.get() method returns a Future that contains a Response.
  //
  // Future is a core Dart class for working with async operations.
  // A Future object represents a potential value or error that will be available at some time in the future.
  // The http.Response class contains the data received from a successful http call.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
