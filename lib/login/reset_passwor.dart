// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/button_widget.dart';
// import 'package:movie_app/h%20(2).dart';
// import 'package:movie_app/login/verification_page.dart';

// class ResetPassword extends StatelessWidget with ScreenSizeUtil {
//   ResetPassword({super.key});
//   final emailController = TextEditingController();

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
//           padding: EdgeInsets.only(left: 20, top: 15),
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
//         padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.064)
//             .copyWith(top: getHeight(context) * 0.05),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(bottom: getHeight(context) * 0.06),
//               child: const Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Reset Passwor',
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'Recover your account password',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: getHeight(context) * 0.05),
//               child: TextField(
//                 style: const TextStyle(
//                   color: Color(0xffEBEBEF),
//                 ),
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email Adress',
//                   labelStyle: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xffEBEBEF),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                 ),
//               ),
//             ),
//             ButtonWidget(
//               buttonName: 'Next',
//               functionApply: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const VerificationPage(),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
