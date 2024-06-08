import 'package:flutter/material.dart';


class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesManager = FavoritesManager();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: favoritesManager.favorites.length,
        itemBuilder: (context, index) {
          final movie = favoritesManager.favorites[index];
          return ListTile(
            title: Text(
              movie,
              style: const TextStyle(color: Colors.white),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                favoritesManager.removeFavorite(movie);
                (context as Element).markNeedsBuild();
              },
            ),
          );
        },
      ),
    );
  }
}
class FavoritesManager {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;
  FavoritesManager._internal();

  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addFavorite(String movie) {
    if (!_favorites.contains(movie)) {
      _favorites.add(movie);
    }
  }

  void removeFavorite(String movie) {
    _favorites.remove(movie);
  }

  bool isFavorite(String movie) {
    return _favorites.contains(movie);
  }
}
