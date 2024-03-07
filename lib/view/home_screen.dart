import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _data = [];
  // fetch content from the json file
  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString("assets/sample.json");
      final data = await jsonDecode(response);
      setState(() {
        _data = data["data"];
        print("...number of items ${_data.length}");
      });
    } catch (e) {
      print("can't load the json");
    }
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _data.isNotEmpty
              ? CarouselSlider.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index, int pageViewIndex) {
                    return Container(
                      margin:
                          const EdgeInsets.only(left: 12, right: 12, top: 30),
                      // height: size.height * 0.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.85],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _data[index]["city"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 30),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 0,
                  ),
                )
              : const SizedBox.shrink(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const TextField()),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              // height: size.height * 0.5,
              child: ListView.builder(
                  itemCount: _data.sublist(0, 15).length,
                  itemBuilder: (context, index) {
                    final cityData = _data[index];
                    return ListTile(
                      leading: Text(
                        "${index + 1}",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cityData["city"],
                          style: const TextStyle(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    );
                  }))
        ],
      )),
    );
  }
}
/**Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.75,
              width: size.width,
              margin: const EdgeInsets.only(right: 12, left: 12),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(40),
                gradient: const LinearGradient(
                  colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.2, 0.85],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.085,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        readJson();
                      },
                      child: const Text("Load Json")),
                  const Text(
                    "Constatine ",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  const Text(
                    "Monday,03,2024 ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Image.asset(
                    "assets/images/cloudy.png",
                    width: size.width * 0.4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Cloudy",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "15°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w800),
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Wind",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "19.1km/h",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "81",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Text(
                            "Wind Direction",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "SE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Gust",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "32.0 kp/h",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "UV",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "81",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Wind",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "19.1 km/h",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Pressure",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "1025.0 hpa",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "precipitation",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "0.0 mm",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      "Last update",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "2024-03-3:14",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ), */