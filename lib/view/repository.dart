//    import 'package:flutter/material.dart';
// import 'package:weather_app_riverpod/models/weather.dart';

// Weather? weather;
 
//  Widget buildUi(context) {
//     if (weather == null) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     return SizedBox(
//       height: MediaQuery.sizeOf(context).height,
//       width: MediaQuery.sizeOf(context).width,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _locationHeader(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.08,
//           ),
//           _dateTimeInfo(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.01,
//           ),
//           weathericon(),
//           _currentTemp(),
//           SizedBox(
//             height: MediaQuery.sizeOf(context).height * 0.01,
//           ),
//           _extraInfo(),
//         ],
//       ),
//     );
//   }

//   Widget _locationHeader() {
//     return Text(
//       weather?.areaName ?? "",
//       style: const TextStyle(fontSize: 20),
//     );
//   }

//   Widget _dateTimeInfo() {
//     DateTime now = weather!.date!;
//     return Column(
//       children: [
//         Text(
//           DateFormat("h:mm a").format(now),
//           style: const TextStyle(fontSize: 35),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               DateFormat("EEEE").format(now),
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
//             ),
//             Text(
//               "   ${DateFormat("d.m.y").format(now)}",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//           ],
//         )
//       ],
//     );
//   }

//   Widget weathericon() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           height: MediaQuery.sizeOf(context).height * 0.20,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: NetworkImage(
//                   "http://openweathermap.org/img/wn/${weather?.weatherIcon}@4x.png"),
//             ),
//           ),
//         ),
//         Text(
//           weather?.weatherDescription ?? "",
//           style: const TextStyle(fontSize: 17),
//         )
//       ],
//     );
//   }

//   Widget _currentTemp() {
//     return Text(
//       "${weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
//       style: const TextStyle(
//         fontSize: 18,
//       ),
//     );
//   }

//   Widget _extraInfo() {
//     return Container(
//       height: MediaQuery.sizeOf(context).height * 0.15,
//       width: MediaQuery.sizeOf(context).width * 0.80,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.deepPurpleAccent,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Max: ${weather?.tempMax?.celsius?.toStringAsFixed(0)}° C",
//                 style: const TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 "Max: ${weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
//                 style: const TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           ),
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 "Wind: ${weather?.windSpeed?.toStringAsFixed(0)}m/s",
//                 style: const TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                 ),
//               ),
//               Text(
//                 "Humidity: ${weather?.humidity?.toStringAsFixed(0)}%",
//                 style: const TextStyle(
//                   fontSize: 17,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
