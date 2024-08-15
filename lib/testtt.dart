// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // Sample data list
//   final List<Map<String, dynamic>> tileData = [
//     {"title": "Tile 1", "height": 100},
//     {"title": "Tile 2", "height": 150},
//     {"title": "Tile 3", "height": 200},
//     {"title": "Tile 4", "height": 250},
//     {"title": "Tile 5", "height": 300},
//     {"title": "Tile 6", "height": 350},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Masonry Grid View Example'),
//         ),
//         body: MasonryGridView.count(
//           crossAxisCount: 2, // Number of columns in the grid
//           mainAxisSpacing: 4, // Vertical spacing between items
//           crossAxisSpacing: 4, // Horizontal spacing between items
//           itemCount: tileData.length, // Number of items in the grid
//           itemBuilder: (context, index) {
//             // Accessing the data from the list
//             final data = tileData[index];
//             return Container(
//               height: data['height'], // Height based on the data list
//               color: Colors.teal,
//               child: Center(
//                 child: Text(
//                   data['title'], // Displaying the title from the data list
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
