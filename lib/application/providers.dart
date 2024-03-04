import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City { Lagos, Abuja, Ibadan }

final currentCityProvider = StateProvider<City?>((ref) {
  return null;
});

typedef Season = String;

Future<String> getWeather(City city) {
  final cityMap = {
    City.Abuja: "harmattan",
    City.Lagos: "rain",
    City.Ibadan: "dry"
  };

  return Future.delayed(const Duration(seconds: 1), () {
    return cityMap[city]!;
  });
}

final weatherProvider = FutureProvider<String>((ref) {
  final city = ref.watch(currentCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return "Please Choose City";
  }
});
