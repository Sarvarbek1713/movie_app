import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviePage extends StatefulWidget {
  // final  String assetName;
  const MoviePage({
    super.key,
  });

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> with ScreenSizeUtil {
  bool isFavorite = false; // Статус избранного
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: getHeight(context) * 0.65,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    tileMode: TileMode.repeated,
                    colors: [
                      Color(0xff1F1D2B),
                      Color(0xff1F1D2B),
                    ],
                    stops: [0.2, 1.0],
                  ),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/images/orgimchak_lotus.png',
                      //  assetName,
                    ),
                  ),
                ),
              ),
              Container(
                height: getHeight(context) * 0.65,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.2,
                      0.6,
                      1,
                    ],
                    colors: [Colors.black38, Colors.black54, Colors.black87],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ).copyWith(top: 10, bottom: getHeight(context) * 0.04),
                    child: Row(
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xff252836),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          'Spider-Man Lotus',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(0xff252836),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              isFavorite =
                                  !isFavorite; // Переключение состояния избранного
                            });
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.white,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Image.asset(
                        'assets/images/orgimchak_lotus.png',
                        height: getHeight(context) * 0.35,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const MovieInfoWidget(),
                  const RateWidget(),
                  const PlaybButton()
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: Text(
                    'Story Line',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Text(
                  'Впервые в истории фильмов о Человеке-пауке раскрывается личность нашего дружелюбного соседского героя, что приводит к противоречию его обязанностей супергероя с его обычной жизнью и подвергает опасности тех, кто ему дорог больше всего.',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffEBEBEF)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RateWidget extends StatelessWidget with ScreenSizeUtil {
  const RateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 60,
        decoration: BoxDecoration(
          color: const Color(0xff252836),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/star.svg',
                height: getHeight(context) * 0.02,
                width: getHeight(context) * 0.02,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                '4,5',
                style: TextStyle(
                    color: Color(0xffFF8700),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlaybButton extends StatefulWidget {
  const PlaybButton({
    super.key,
  });

  @override
  State<PlaybButton> createState() => _PlaybButtonState();
}

class _PlaybButtonState extends State<PlaybButton> {
    late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId:
          'dDF0afG6Vvk', // Идентификатор видео (часть URL после 'youtube.com/watch?v=')
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        children: [
          const Spacer(),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => const Color(0xffFF8700),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YoutubePlayer(controller: _controller),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Play',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Spacer(),
          Icon(
            Icons.calendar_month,
            size: 16,
            color: Colors.grey,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            '2021',
            style: TextStyle(
                fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            '|',
            style: TextStyle(
                color: Color(0xff696974),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.timelapse,
            size: 18,
            color: Colors.grey,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            '148 minutes',
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            '|',
            style: TextStyle(
                color: Color(0xff696974),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 12,
          ),
          Icon(
            Icons.local_movies,
            size: 18,
            color: Colors.grey,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            'Action',
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
