// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:movie_app/button_widget.dart';
// import 'package:movie_app/h%20(2).dart';
// // ignore: depend_on_referenced_packages

// class VerificationPage extends StatelessWidget with ScreenSizeUtil {
//   const VerificationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xff1F1D2B),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff1F1D2B),
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
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//                 vertical: 0, horizontal: getWidth(context) * 0.064)
//             .copyWith(top: getHeight(context) * 0.05),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 const Text(
//                   'Verifying Your Account',
//                   style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white),
//                 ),
//                 SizedBox(
//                   height: getHeight(context) * 0.02,
//                 ),
//                 const Text(
//                   'We have just sent you 4 digit code via your ',
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xff7F7E83)),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(bottom: getHeight(context) * 0.04),
//                   child: RichText(
//                     text: const TextSpan(
//                       text: 'email',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                         color: Color(0xff7F7E83),
//                       ),
//                       children: [
//                         TextSpan(
//                           text: ' example@gmail.com',
//                           style: TextStyle(
//                               fontSize: 14,
//                               color: Color(0xfffffffff),
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: EdgeInsets.only(bottom: getHeight(context) * 0.08),
//               child: const VerificCodeWidget(),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric()
//                   .copyWith(bottom: getHeight(context) * 0.0259),
//               child: ButtonWidget(
//                 buttonName: 'Continue',
//                 functionApply: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CreatePassPage(),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             RichText(
//               text: const TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Didn\'t recive code? ',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff92929D),
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'Resend',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xff12CDD9),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class VerificCodeWidget extends StatelessWidget with ScreenSizeUtil {
//   const VerificCodeWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: getHeight(context) * 0.068,
//             width: getWidth(context) * 0.143,
//             child: TextFormField(
//               onSaved: (pin1) {},
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   FocusScope.of(context).nextFocus();
//                 }
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: const Color(0xff252836),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(
//                     color: Color(0xff12CDD9),
//                   ),
//                 ),
//               ),
//               style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white),
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.number,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//           SizedBox(
//             height: getHeight(context) * 0.068,
//             width: getWidth(context) * 0.143,
//             child: TextFormField(
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   FocusScope.of(context).nextFocus();
//                 }
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color(0xff252836),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(
//                     color: Color(0xff12CDD9),
//                   ),
//                 ),
//               ),
//               style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white),
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.number,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//             ),
//           ),
//           SizedBox(
//             height: getHeight(context) * 0.068,
//             width: getWidth(context) * 0.143,
//             child: TextFormField(
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   FocusScope.of(context).nextFocus();
//                 }
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color(0xff252836),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(
//                     color: Color(0xff12CDD9),
//                   ),
//                 ),
//               ),
//               style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white),
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.number,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//             ),
//           ),
//           SizedBox(
//             height: getHeight(context) * 0.068,
//             width: getWidth(context) * 0.143,
//             child: TextFormField(
//               onChanged: (value) {
//                 if (value.length == 1) {
//                   FocusScope.of(context).nextFocus();
//                 }
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color(0xff252836),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                   borderSide: const BorderSide(
//                     color: Color(0xff12CDD9),
//                   ),
//                 ),
//               ),
//               style: const TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white),
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.number,
//               inputFormatters: [
//                 LengthLimitingTextInputFormatter(1),
//                 FilteringTextInputFormatter.digitsOnly,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
