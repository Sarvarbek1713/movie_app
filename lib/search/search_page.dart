import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/search/model.dart';
import 'package:movie_app/search/movie_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movie_app/h%20(2).dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<MovieModel> fetchMovies() async {
  final response = await http.get(Uri.parse('https://kino-1.onrender.com/get'));
  if (response.statusCode == 200) {
    return MovieModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}

class SearchPage extends StatefulWidget with ScreenSizeUtil {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with ScreenSizeUtil {
  final TextEditingController _searchController = TextEditingController();
  List<Data> _movies = [];
  List<Data> _filteredMovies = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    fetchMovies().then((movies) {
      setState(() {
        _movies = movies.data ?? [];
        _filteredMovies = movies.data ?? [];
        _isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    });
    _searchController.addListener(_filterMovies);
  }

  void _filterMovies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredMovies = _movies
          .where((movie) => movie.name!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMovies);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _hasError
              ? const Center(
                  child: Text('Failed to load movies',
                      style: TextStyle(color: Colors.white)))
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: getHeight(context) * 0.05)
                            .copyWith(bottom: getHeight(context) * 0.03),
                        child: SearchiBar(controller: _searchController),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                                horizontal: getHeight(context) * 0.03)
                            .copyWith(top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _filteredMovies
                              .map((movie) => MovieCard(
                                    name: movie.name ?? '',
                                    year: movie.year ?? '',
                                    time: movie.time ?? '',
                                    video: movie.movieVideo ?? '',
                                    image: movie.movieImage ?? '',
                                    description: movie.description ?? '',
                                    popularity: movie.popularity ?? '',
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final String name;
  final String year;
  final String time;
  final String video;
  final String image;
  final String description;
  final String popularity;

  const MovieDetailPage({
    super.key,
    required this.name,
    required this.year,
    required this.time,
    required this.video,
    required this.image,
    required this.description,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video)!,
      flags: const YoutubePlayerFlags(
        disableDragSeek: true,
        loop: true,
        captionLanguage: 'ru',
        autoPlay: false,
        forceHD: true,
        controlsVisibleAtStart: true,
        showLiveFullscreenButton: true,
        mute: false,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      appBar: AppBar(
        backgroundColor: const Color(0xff1F1D2B),
        centerTitle: true,
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
              ),
              const SizedBox(height: 16),
              // Image.asset(
              //   image,
              //   width: MediaQuery.of(context).size.width,
              // ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 14,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    year,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.timelapse,
                    size: 18,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchiBar extends StatelessWidget {
  final TextEditingController controller;
  const SearchiBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xff252836),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            size: 18,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              style: const TextStyle(
                leadingDistribution: TextLeadingDistribution.even,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hoverColor: Colors.grey,
                hintText: 'Search a title',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/icons/palochka.svg',
          ),
          const SizedBox(
            width: 8,
          ),
          SvgPicture.asset(
            'assets/icons/options.svg',
          ),
        ],
      ),
    );
  }
}
