import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app_riverpod/application/providers.dart';

void main() {
  runApp(
    const ProviderScope(
      child: WeatherApp(),
    ),
  );
}

class WeatherApp extends ConsumerWidget {
  const WeatherApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
        ),
        body: Column(
          children: [
            currentWeather.when(
              data: (data) {
                return Text(data);
              },
              error: ((error, stackTrace) {
                return Text(error.toString());
              }),
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: City.values.length,
                  itemBuilder: (context, index) {
                    final currentCity = ref.watch(currentCityProvider);
                    final isSelected = currentCity == City.values[index];
                    return ListTile(
                      onTap: () {
                        ref.read(currentCityProvider.notifier).state =
                            City.values[index];
                      },
                      trailing: isSelected ? const Icon(Icons.check) : null,
                      title: Text(
                        City.values[index].toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
