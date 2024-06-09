import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:movie_app/home/home_page.dart';
import 'package:movie_app/movie_interface.dart/movie_page.dart';

class SearchPage extends StatefulWidget with ScreenSizeUtil {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with ScreenSizeUtil {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _movies = [
    {'title': 'Spider-Man No Way Home', 'date': '2021', 'time': '148 minutes'},
    {'title': 'The Batman', 'date': '2022', 'time': '176 minutes'},
    {'title': 'Doctor Strange', 'date': '2016', 'time': '115 minutes'},
    {'title': 'Thor: Love and Thunder', 'date': '2022', 'time': '119 minutes'},
  ];
  List<Map<String, String>> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_filterMovies);
  }

  void _filterMovies() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredMovies = _movies
          .where((movie) => movie['title']!.toLowerCase().contains(query))
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                      horizontal: 24, vertical: getHeight(context) * 0.05)
                  .copyWith(bottom: getHeight(context) * 0.03),
              child: SearchiBar(controller: _searchController),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getHeight(context) * 0.03)
                      .copyWith(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _filteredMovies
                    .map((movie) => MovieCard(
                          title: movie['title']!,
                          date: movie['date']!,
                          time: movie['time']!,
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

class MovieCard extends StatelessWidget with ScreenSizeUtil {
  final String title;
  final String date;
  final String time;

  const MovieCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MoviePage(),
            ),
          );
        },
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/images/spdrmn.png',
                width: getHeight(context) * 0.18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0xffFF8700),
                    ),
                    child: const Text(
                      'Premium',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getHeight(context) * 0.01),
                    child: Text(
                      title,
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        date,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getHeight(context) * 0.01),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.timelapse,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          time,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.local_movies,
                        size: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Action | ',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Фильм',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
          const SizedBox(
            width: 8,
          ),
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

class CategorySearchWidget extends StatelessWidget with ScreenSizeUtil {
  const CategorySearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(context) * 0.05,
          ),
          scrollDirection: Axis.horizontal,
          child: const Row(
            children: [
              ColorChangingButtonsRow(
                buttonLabels: [
                  'All',
                  'Comedy',
                  'Animation',
                  'Document 1',
                  'Document 2',
                  'Document 3'
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
