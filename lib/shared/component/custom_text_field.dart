// import 'package:agile/shared/styles/colors.dart';
// import 'package:flutter/material.dart';
//
//
// class CustomTextField extends StatelessWidget {
//    CustomTextField({super.key, required this.hint,required this.controller,});
//
//   final String hint ;
//   var controller ;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 20.0,right: 20.0, bottom: 30),
//           child: TextField(
//             decoration:  InputDecoration(
//                 enabledBorder: buildOutlineInputBorder(),
//                 focusedBorder: buildOutlineInputBorder(),
//                 hintText: hint
//             ),
//             controller: controller,
//           ),
//         )
//       ],
//     );
//   }
// }
//
// buildOutlineInputBorder(){
//   return OutlineInputBorder(
//       borderSide:  const BorderSide(color: Styles.kColor),
//       borderRadius: BorderRadius.circular(6)
//   );
//
// }