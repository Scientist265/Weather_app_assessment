// import 'package:clima/services/location.dart';
// import 'package:clima/services/networking.dart';
// import 'package:weather/weather.dart';

// import '../constants/app_string.dart';

// const apiKey = '2bd7faae310593e99ac07dc82645e1bb';
// const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

// class WeatherModel {
//   Future<dynamic> getCityWeather(String cityName) async {
//     var url = '$baseUrl?q=$cityName&appid=$apikey&units=metric';
//     final response = Uri.http(url);
//     var weatherData = await response.data;
//     return weatherData;
//   }

//   Future<dynamic> getWeatherLocation() async {
//     final WeatherFactory _wf = WeatherFactory(apikey);
//   Weather? _weather;

//     await _wf.currentWeatherByCityName("lagos");
//         // this is use to get the current location even though not accurate
//     Http networkHelper = Uri.http(
//         '$openWeatherUrl?lat=${_weather!.latitude}&lon=${_weather.longitude}&appid=$apiKey&units=metric');
//     var weatherData = await networkHelper.g();
//     return weatherData;
//   }

//   String getWeatherIcon(int condition) {
//     if (condition < 300) {
//       return '🌩';
//     } else if (condition < 400) {
//       return '🌧';
//     } else if (condition < 600) {
//       return '☔️';
//     } else if (condition < 700) {
//       return '☃️';
//     } else if (condition < 800) {
//       return '🌫';
//     } else if (condition == 800) {
//       return '☀️';
//     } else if (condition <= 804) {
//       return '☁️';
//     } else {
//       return '🤷‍';
//     }
//   }

//   String getMessage(int temp) {
//     if (temp > 25) {
//       return 'It\'s 🍦 time';
//     } else if (temp > 20) {
//       return 'Time for shorts and 👕';
//     } else if (temp < 10) {
//       return 'You\'ll need 🧣 and 🧤';
//     } else {
//       return 'Bring a 🧥 just in case';
//     }
//   }
// }

// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

import 'package:weather_app_riverpod/models/cloud.dart';
import 'package:weather_app_riverpod/models/coord.dart';
import 'package:weather_app_riverpod/models/main.dart';
import 'package:weather_app_riverpod/models/rain.dart';
import 'package:weather_app_riverpod/models/sys.dart';
import 'package:weather_app_riverpod/models/weather.dart';
import 'package:weather_app_riverpod/services/wind.dart';

class WeatherModel {
  final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Rain rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherModel({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        coord: Coord.fromJson(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"],
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"],
        wind: Wind.fromJson(json["wind"]),
        rain: Rain.fromJson(json["rain"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        sys: Sys.fromJson(json["sys"]),
        timezone: json["timezone"],
        id: json["id"],
        name: json["name"],
        cod: json["cod"],
      );

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "rain": rain.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}
