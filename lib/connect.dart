// // import 'dart:convert';

// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // Future<Album> fetchAlbum() async {
// //   final response = await http
// //       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

// //   if (response.statusCode == 200) {
// //     // If the server did return a 200 OK response,
// //     // then parse the JSON.
// //     return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
// //   } else {
// //     // If the server did not return a 200 OK response,
// //     // then throw an exception.
// //     throw Exception('Failed to load album');
// //   }
// // }

// // Future<void> fetchData() async {
// //   var url = 'https://kino-1.onrender.com/';
// //   var response = await http.get(Uri.parse(url));

// //   if (response.statusCode == 200) {
// //     // Обработка успешного ответа
// //     print('Response body: ${response.body}');
// //   } else {
// //     // Обработка ошибки
// //     print('Request failed with status: ${response.statusCode}');
// //   }
// // }

// // //  Future<http.Response> fetchAlbum() {
// // //   return http.get(
// // //     Uri.parse('https://kino-1.onrender.com/regis'),
// // //   );
// // // }

// // class Album {
// //   final String name;
// //   final String email;
// //   final String password;

// //   const Album({
// //     required this.name,
// //     required this.email,
// //     required this.password,
// //   });

// //   factory Album.fromJson(Map<String, dynamic> json) {
// //     return switch (json) {
// //       {
// //         'name': String name,
// //         'email': String email,
// //         'title': String password,
// //       } =>
// //         Album(
// //           name: name,
// //           email: email,
// //           password: password,
// //         ),
// //       _ => throw const FormatException('Failed to load album.'),
// //     };
// //   }
// // }

// // class MyAppConnect extends StatefulWidget {
// //   const MyAppConnect({super.key});

// //   @override
// //   State<MyAppConnect> createState() => _MyAppConnectState();
// // }

// // class _MyAppConnectState extends State<MyAppConnect> {
// //   late Future<Album> futureAlbum;

// //   @override
// //   void initState() {
// //     super.initState();
// //     futureAlbum = fetchAlbum();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Fetch Data Example',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //       ),
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Fetch Data Example'),
// //         ),
// //         body: Center(
// //           child: FutureBuilder<Album>(
// //             future: futureAlbum,
// //             builder: (context, snapshot) {
// //               if (snapshot.hasData) {
// //                 return Text(snapshot.data!.name);
// //               } else if (snapshot.hasError) {
// //                 return Text('${snapshot.error}');
// //               }
// //               return const CircularProgressIndicator();
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signUpUser(String name, String email, String password) async {
  var url =
      'https://kino-1.onrender.com/regis'; // Замените на адрес вашего сервера API
  var response = await http.post(
    Uri.parse(url),
    body: jsonEncode({
      'username': name,
      'email': email,
      'password': password,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // Обработка успешной регистрации
    print('Пользователь успешно зарегистрирован');
  } else {
    // Обработка ошибки
    print('Ошибка при регистрации пользователя: ${response.statusCode}');
    print(response.body);
  }
}

Future<Map<String, dynamic>> signInUser(String email, String password) async {
  var url =
      'https://kino-1.onrender.com/regis'; // Замените на адрес вашего сервера API
  var response = await http.post(
    Uri.parse(url),
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    // Возвращаем данные пользователя в виде Map
    return jsonDecode(response.body);
  } else {
    // Если возникла ошибка, бросаем исключение
    throw Exception('Failed to sign in');
  }
}

Future<void> saveUserDataLocally(Map<String, dynamic> userData) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('userData', jsonEncode(userData));
}

Future<Map<String, dynamic>?> getUserDataLocally() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userDataString = prefs.getString('userData');
  if (userDataString != null) {
    return jsonDecode(userDataString);
  } else {
    return null;
  }
}
