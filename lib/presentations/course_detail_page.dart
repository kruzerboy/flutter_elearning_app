// import 'package:flutter/material.dart'
// ;

// import 'screens/course_details_screen/course.dart';

// class CourseDetailPage extends StatelessWidget {
//   final Course course;

//   const CourseDetailPage({super.key, required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(course.title),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               course.description,
//               style: const TextStyle(fontSize: 18.0),
//             ),
//             const SizedBox(height: 20.0),
//             const Text(
//               'Materials:',
//               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: course.materials.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(course.materials[index]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
