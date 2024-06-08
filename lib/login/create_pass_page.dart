// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:movie_app/button_widget.dart';
// import 'package:movie_app/h%20(2).dart';

// class CreatePassPage extends StatelessWidget with ScreenSizeUtil {
//   CreatePassPage({super.key});
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff1F1D2B),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff1F1D2B),
//         iconTheme: const IconThemeData(
//           size: 24,
//           color: Colors.white,
//         ),
//         leading: Padding(
//           padding: EdgeInsets.only(
//               left: getWidth(context) * 0.054, top: getHeight(context) * 0.019),
//           child: IconButton(
//             style: IconButton.styleFrom(
//               backgroundColor: Color(0xff252836),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.chevron_left),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: getWidth(context) * 0.064,
//         ),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric()
//                   .copyWith(bottom: getHeight(context) * 0.059),
//               child: const Column(
//                 children: [
//                   Text(
//                     'Create New Password',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     'Enter your new password',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xff92929D),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric()
//                   .copyWith(bottom: getHeight(context) * 0.059),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     style: const TextStyle(
//                       color: Color(0xffEBEBEF),
//                     ),
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'New Password',
//                       labelStyle: const TextStyle(
//                         color: Colors.white,
//                       ),
//                       fillColor: Colors.white,
//                       hintStyle: const TextStyle(color: Colors.white),
//                       suffixIcon: InkWell(
//                         child: SvgPicture.asset(
//                           'assets/icons/eye.svg',
//                         ),
//                       ),
//                       suffixIconColor: const Color(0xffEBEBEF),
//                       suffixIconConstraints: const BoxConstraints(minWidth: 50),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: getHeight(context) * 0.0295,
//                   ),
//                   TextField(
//                     style: const TextStyle(
//                       color: Color(0xffEBEBEF),
//                     ),
//                     obscureText: true,
//                     controller: passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Confirm Password',
//                       labelStyle: const TextStyle(
//                         color: Colors.white,
//                       ),
//                       fillColor: Colors.white,
//                       hintStyle: const TextStyle(color: Colors.white),
//                       suffixIcon: InkWell(
//                         child: SvgPicture.asset(
//                           'assets/icons/eye.svg',
//                         ),
//                       ),
//                       suffixIconColor: const Color(0xffEBEBEF),
//                       suffixIconConstraints: const BoxConstraints(minWidth: 50),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             ButtonWidget(buttonName: 'Reset', functionApply: () {})
//           ],
//         ),
//       ),
//     );
//   }
// }
