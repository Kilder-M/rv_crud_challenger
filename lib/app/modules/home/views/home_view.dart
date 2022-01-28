import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rv_crud_challenger/app/util/widgets/views_titles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            viewsTitles(title: 'Lista de Produtos',),
          ],
        ),
      ),
    ),);
  }
}


// Container(
//       width: double.infinity,
//       height: double.infinity,
//       color: Colors.grey[200],
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20.0),
//               child: const Text(
//                 'Lista produto',
//                 style: TextStyle(
//                   fontSize: 26,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),);