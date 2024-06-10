import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/search/model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/search/search_page.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with ScreenSizeUtil {
  List<Data> allMovies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies().then((movieModel) {
      setState(() {
        allMovies = movieModel.data ?? [];
      });
    }).catchError((error) {
      print('Error fetching movies: $error');
      // Handle error as needed
    });
  }

  Future<MovieModel> fetchMovies() async {
    final response = await http.get(
      Uri.parse('https://kino-1.onrender.com/get'),
    );
    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

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
        return allMovies.where((movie) => movie.year == '2023').toList();
      case 2: // 'Боевик'
        return allMovies.where((movie) => movie.year == '2022').toList();
      case 3: // 'Фантастика'
        return allMovies.where((movie) => movie.year == '2024').toList();
      default:
        return [];
    }
  }

  void _onMovieTapped(Data movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(
          name: movie.name ?? '',
          year: movie.year ?? '',
          time: movie.time ?? '',
          video: movie.movieVideo ?? '',
          image: movie.movieImage ?? '',
          description: movie.description ?? '',
          popularity: movie.popularity ?? '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.07)
              .copyWith(bottom: 0.018),
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
          padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.05),
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
            movies: getMoviesForSelectedCategory(allMovies),
            onMovieTap: _onMovieTapped,
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
  final Function(Data) onMovieTap;

  const PopularWidget({
    Key? key,
    required this.movies,
    required this.onMovieTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(context) * 0.025),
      child: SizedBox(
        height: getHeight(context) * 0.3, // set height for the ListView
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: () => onMovieTap(movie),
                child: Container(
                  width: getHeight(context) * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff252836),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        movie.movieImage ?? '', // Use movie image URL
                        height: getHeight(context) * 0.24,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ).copyWith(top: 8),
                        child: Text(
                          movie.name ?? '', // Use movie name
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
