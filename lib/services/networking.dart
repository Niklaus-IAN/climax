import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({required this.authority, this.path, this.link});

  // final String uris;
  // final double? lat;
  // final double? lon;
  final String authority;
  final String? path;
  final Map<String, dynamic>? link;

  Future getData() async {
    Uri url = Uri.https(authority, path.toString(), link);
    // api.openweathermap.org/data/2.5/weather?q=London&appid={55d7f49802a9cc4dfa0e0f4dcc5603ac}
    // https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.body);
      String data = response.body;
      return jsonDecode(data);

      // var longitude = jsonDecode(data)['coord']['lon'];
      // print(longitude);

      // var weatherReport = jsonDecode(data)['weather'][0]['id'];
      // var cityName = jsonDecode(data)['name'];
      // var temperature = jsonDecode(data)['main']['temp'];
      //
      // print(weatherReport);
      // print(cityName);
      // print(temperature);
    } else {
      print(response.statusCode);
    }
  }
}
