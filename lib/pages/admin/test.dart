// import 'package:flutter/material.dart';

// /// Flutter code sample for [ListTile].

// void main() => runApp(const ListTileApp());

// class ListTileApp extends StatelessWidget {
//   const ListTileApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(useMaterial3: true),
//       home: const ListTileExample(),
//     );
//   }
// }

// class ListTileExample extends StatefulWidget {
//   const ListTileExample({super.key});

//   @override
//   State<ListTileExample> createState() => _ListTileExampleState();
// }

// class _ListTileExampleState extends State<ListTileExample> {
//   ListTileTitleAlignment? titleAlignment;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('ListTile.titleAlignment Sample')),
//       body: Column(
//         children: <Widget>[
//           const Divider(),
//           ListTile(
//             titleAlignment: titleAlignment,
//             leading: Checkbox(
//               value: true,
//               onChanged: (bool? value) {},
//             ),
//             title: const Text('Headline Text'),
//             subtitle: const Text(
//                 'Tapping on the trailing widget will show a menu that allows you to change the title alignment. The title alignment is set to threeLine by default if `ThemeData.useMaterial3` is true. Otherwise, defaults to titleHeight.'),
//             trailing: PopupMenuButton<ListTileTitleAlignment>(
//               onSelected: (ListTileTitleAlignment? value) {
//                 setState(() {
//                   titleAlignment = value;
//                 });
//               },
//               itemBuilder: (BuildContext context) =>
//                   <PopupMenuEntry<ListTileTitleAlignment>>[
//                PopupMenuItem<ListTileTitleAlignment>(
//                   value: ListTileTitleAlignment.titleHeight,
//                   child: TextButton(onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           AddEditProjectScreen(
//                                         project: project,
//                                       ),
//                                     ),
//                                   );
//                                 }, child: Text('Delete')),
//                 ),
//                  PopupMenuItem<ListTileTitleAlignment>(
//                   value: ListTileTitleAlignment.titleHeight,
//                   child: TextButton(onPressed: () {
//                                   _firestoreService.deleteProject(project.id!);
//                                   // _firestoreService.getProjects();
//                                 }, child: Text('Delete')),
//                 ),
                
//               ],
//             ),
//           ),
//           const Divider(),
//         ],
//       ),
//     );
//   }
// }
