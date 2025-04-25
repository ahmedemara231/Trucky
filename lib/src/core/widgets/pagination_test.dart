// import 'package:flutter/material.dart';
// import 'package:flutter_base/src/core/widgets/app_text.dart';
// import 'package:flutter_base/src/core/widgets/paginated_list.dart';
//
// class CustomPaginationTest extends StatefulWidget {
//   const CustomPaginationTest({super.key});
//
//   @override
//   State<CustomPaginationTest> createState() => _CustomPaginationTestState();
// }
//
// class _CustomPaginationTestState extends State<CustomPaginationTest> {
//   Future<List<String>> getStrings()async{
//     await Future.delayed(const Duration(seconds: 1));
//     return List.generate(12, (index) => 'Item $index');
//   }
//
//   @override
//   void initState() {
//     getStrings();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PaginatedList<String>(
//         getItems: () => getStrings(),
//         pagesNumber: 3,
//         builder: (data, index) => AppText(data[index]),
//       ),
//     );
//   }
// }
