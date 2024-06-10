import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/search/model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/search/search_page.dart';

Future<MovieModel> fetchMovies() async {
  final response = await http.get(Uri.parse('https://kino-1.onrender.com/get'));
  if (response.statusCode == 200) {
    return MovieModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with ScreenSizeUtil {
  bool _showPopularWidget = false;
  int _selectedCategoryIndex = 0;

  void _onCategoryButtonPressed(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      _showPopularWidget = true;
    });
  }

  List<Data> getMoviesForSelectedCategory(List<Data> allMovies) {
    switch (_selectedCategoryIndex) {
      case 0: // 'Все'
        return allMovies;
      case 1: // 'Новые'
        return allMovies.where((movie) => movie.year == '2024').toList();
      case 2: // 'Боевик'
        return allMovies.where((movie) => movie.year == '2023').toList();
      case 3: // 'Фантастика'
        return allMovies.where((movie) => movie.year == '2022').toList();
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Data> allMovies = [
      Data(
          description: '',
          movieVideo: '',
          time: '',
          name: 'Movie 1',
          movieImage:
              'https://images.pexels.com/photos/3225517/pexels-photo-3225517.jpeg?auto=compress&cs=tinysrgb&w=600',
          year: '2024'),
      Data(
          description: '',
          movieVideo: '',
          time: '',
          name: 'Movie 1',
          movieImage:
              'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          year: '2023'),
      Data(
          description: '',
          movieVideo: '',
          time: '',
          name: 'Movie 1',
          movieImage:
              'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          year: '2024'),
      Data(
          description: '',
          movieVideo: '',
          time: '',
          name: 'Movie 1',
          movieImage:
              'https://images.pexels.com/photos/1547813/pexels-photo-1547813.jpeg?auto=compress&cs=tinysrgb&w=600',
          year: '2022'),
      Data(
          description: '',
          movieVideo: '',
          time: '',
          name: 'Movie 1',
          movieImage:
              'https://images.pexels.com/photos/2086622/pexels-photo-2086622.jpeg?auto=compress&cs=tinysrgb&w=600',
          year: '2023'),
      Data(
          description: '',
          movieVideo: '',
          time: '',
          name: 'Movie 1',
          movieImage:
              'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          year: '2022'),

      // Add more movies as needed
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(context) * 0.07,
          ).copyWith(bottom: 0.018),
          child: const Text(
            'Категории',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: getHeight(context) * 0.015,
        ),
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(context) * 0.05,
          ),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ColorChangingButtonsRow(
                buttonLabels: const [
                  'Все',
                  'Новые',
                  'Боевик',
                  'Фантастика',
                ],
                onButtonPressed: _onCategoryButtonPressed,
              ),
            ],
          ),
        ),
        if (_showPopularWidget)
          PopularWidget(
            descrip: '',
            movieVideo: '',
            popularity: '',
            time: '',
            year: '',
            movieImage: '',
            name: '',
            movies: getMoviesForSelectedCategory(allMovies),
          ),
      ],
    );
  }
}

class ColorChangingButtonsRow extends StatefulWidget {
  final List<String> buttonLabels;
  final void Function(int) onButtonPressed;

  const ColorChangingButtonsRow(
      {super.key, required this.buttonLabels, required this.onButtonPressed});

  @override
  _ColorChangingButtonsRowState createState() =>
      _ColorChangingButtonsRowState();
}

class _ColorChangingButtonsRowState extends State<ColorChangingButtonsRow> {
  int _selectedIndex = 0;

  void _handleButtonPress(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onButtonPressed(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.buttonLabels.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (index == _selectedIndex) {
                    return const Color(0xff252836);
                  }
                  return const Color(0xff1F1D2B);
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (index == _selectedIndex) {
                    return const Color(0xff12CDD9);
                  }
                  return Colors.white;
                },
              ),
            ),
            onPressed: () => _handleButtonPress(index),
            child: Text(widget.buttonLabels[index]),
          ),
        );
      }),
    );
  }
}

class PopularWidget extends StatelessWidget with ScreenSizeUtil {
  final List<Data> movies;
  final String movieImage;
  final String name;
  final String descrip;
  final String time;
  final String year;
  final String movieVideo;
  final String popularity;

  const PopularWidget(
      {super.key,
      required this.movies,
      required this.movieImage,
      required this.name,
      required this.descrip,
      required this.time,
      required this.year,
      required this.movieVideo,
      required this.popularity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(context) * 0.025),
      child: Column(
        children: [
          SizedBox(
            height: getHeight(context) * 0.3, // set height for the ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Container(
                        width: getHeight(context) * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xff252836),
                        ),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                description: descrip,
                                image: movieImage,
                                name: name,
                                year: year,
                                time: time,
                                popularity: popularity,
                                video: movieVideo,
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                movieImage,
                                height: getHeight(context) * 0.24,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ).copyWith(top: 8),
                                child: Text(
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
