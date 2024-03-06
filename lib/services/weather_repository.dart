import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:weather_app_riverpod/constants/app_string.dart';

class WeatherRepository {


  void fetchWeatherData() async {

    String cityName = 'Ibadan';

    String url =
        '$baseUrl/data/2.5/weather?q=$cityName&appid=$apikey';

    // Make the HTTP GET request
    var response = await http.get(Uri.parse(url));

    // Check if the request was successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the JSON response
      Map<String, dynamic> data = json.decode(response.body);
      // Extract the current location data
      String location = data['name'];
      print('Current location: $location');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  }
}
