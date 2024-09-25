import 'package:flutter/material.dart';
// import 'package:movie_app/h%20(2).dart';
// import 'package:movie_app/movie_interface.dart/movie_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieIntoWidget extends StatelessWidget {
  final String name;
  final String year;
  final String time;
  final String video;
  final String image;
  final String description;
  // final String popularity;

  const MovieIntoWidget({
    super.key,
    required this.name,
    required this.year,
    required this.time,
    required this.video,
    required this.image,
    required this.description,
    // required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(
            0xff1F1D2B,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                "$year | $time минут",
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              YoutubePlayer(
                controller: controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
              ),
              const SizedBox(height: 16),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xff1F1D2B),
    );
  }
}
