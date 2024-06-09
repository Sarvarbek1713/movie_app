import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/connect.dart';
import 'package:movie_app/h%20(2).dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:movie_app/home/wishlist.dart';
import 'package:movie_app/movie_interface.dart/movie_page.dart';
import 'package:movie_app/profile/profile.dart';
import 'package:movie_app/search/search_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ScreenSizeUtil {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePageContent(),
    const SearchPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1F1D2B),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xff92929D),
        fixedColor: const Color(0xff12CDD9),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff1F1D2B),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Главная',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Поиск',
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: Icon(
              Icons.person_4_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageContent extends StatelessWidget with ScreenSizeUtil {
  final List<Map<String, String>> movies = [
    {
      'ImageName': 'assets/images/most.png',
      'Moviename': 'Spider-Man No Way Home'
    },
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Moviklnkne 2'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'},
    {'ImageName': 'assets/images/most.png', 'Moviename': 'Movicdscde 3'}
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: getUserDataLocally(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Scaffold(
              backgroundColor: const Color(0xff1F1D2B),
              body: Padding(
                padding: const EdgeInsets.symmetric()
                    .copyWith(top: getHeight(context) * 0.01),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getWidth(context) * 0.06),
                      child: Row(
                        children: [
                          SizedBox(
                            width: getWidth(context) * 0.032,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                'Добро пожаловать',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Давайте посмотрим ваш любимый фильм',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Wishlist(),
                                ),
                              );
                            },
                            icon: SvgPicture.asset(
                              'assets/icons/like.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.039,
                    ),
                    // const SearchWidget(),
                    const PageViewImage(),
                    const CategoryWidget(),
                    PopularWidget(movies: movies),
                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.white,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class PopularWidget extends StatelessWidget with ScreenSizeUtil {
  final List<Map<String, String>> movies;

  const PopularWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    

    return Padding(
      padding: EdgeInsets.symmetric(vertical: getHeight(context) * 0.025),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.07),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Самые популярные',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Все',
                  style: TextStyle(
                      color: Color(0xff12CDD9),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: getHeight(context) * 0.024,
          ),
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
                                builder: (context) =>
                                  MoviePage()),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                movie['ImageName']!,
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
                                  movie['Moviename']!,
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

class CategoryWidget extends StatelessWidget with ScreenSizeUtil {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: const Row(
            children: [
              ColorChangingButtonsRow(
                buttonLabels: [
                  'Все',
                  'Комедия',
                  'Aнимация',
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ColorChangingButtonsRow extends StatefulWidget {
  final List<String> buttonLabels;

  const ColorChangingButtonsRow({super.key, required this.buttonLabels});

  @override
  // ignore: library_private_types_in_public_api
  _ColorChangingButtonsRowState createState() =>
      _ColorChangingButtonsRowState();
}

class _ColorChangingButtonsRowState extends State<ColorChangingButtonsRow> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.buttonLabels.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _buildElevatedButton(index, widget.buttonLabels[index]),
        );
      }),
    );
  }

  ElevatedButton _buildElevatedButton(int index, String text) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
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
        side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
      ),
      onPressed: () => _onButtonPressed(index),
      child: Text(text),
    );
  }
}

class PageViewImage extends StatefulWidget {
  const PageViewImage({
    super.key,
  });

  @override
  State<PageViewImage> createState() => _PageViewImageState();
}

class _PageViewImageState extends State<PageViewImage> with ScreenSizeUtil {
  int _currentImageIndex = 0;
  final List _images = [
    'assets/images/orgimchak.png', //https://www.youtube.com/watch?v=dDF0afG6Vvk /Человек паук Лотос 2023
    'assets/images/moviy_q.jpg', //https://youtu.be/1x6nMFHTKDg?si=dsRU3pP5Ru6pOVsI Moviy qo'ng'iz
    'assets/images/viking.jpg', //https://youtu.be/nBVq39TMzXY?si=6mK0nUV_kXsbMjFp Викинги 2024
    'assets/images/zateryanniy.jpg', //https://youtu.be/mJ4zEX0M1o4?si=HaIbrzw_5nHR_jDG Затерянный мир
    'assets/images/peregovorshik.png', //https://youtu.be/lUsqCOusCJI?si=Csa_rPUfeHKJ5pe0  Переговорщик
    'assets/images/wakanda.jpg', //https://youtu.be/n3qeyZJE1i0?si=gaAPW0P5AsvSjpAw Black Panther
  ];
  final List _names = [
    'Человек паук Лотос 2023',
    'Moviy qo\'ng\'iz',
    'Викинги 2024',
    'Затерянный мир',
    'Переговорщик',
    'Black Panther',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final String name = _names[index];
            final String imagePath = _images[index];
            return Stack(
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    imagePath,
                  ),
                ),
                Positioned(
                  bottom: getHeight(context) * 0.02,
                  left: getWidth(context) * 0.055,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoviePage(),
                      ),
                    );
                  },
                ),
              ],
            );
          },
          options: CarouselOptions(
            aspectRatio: 16 / 7,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(
                () {
                  _currentImageIndex = index;
                },
              );
              // Можно добавить дополнительную логику, если нужно
            },
          ),
        ),
        DotsIndicator(
          mainAxisAlignment: MainAxisAlignment.center,
          dotsCount: _images.length,
          position: _currentImageIndex,
          decorator: DotsDecorator(
            color: const Color.fromARGB(
                255, 176, 239, 244), // Цвет неактивных точек
            activeColor: const Color(0xff12CDD9), // Цвет активной точки
            size: const Size.square(10),
            activeSize: const Size(30, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> with ScreenSizeUtil {
  int _currentImageIndex = 0;
  final List _images = [
    'assets/images/wakanda.png',
    'assets/images/Bg.png',
    'assets/images/Bg1.png',
    'assets/images/wakanda.png',
    'assets/images/Bg1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final String imagePath = _images[index];
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // boxShadow: const [
                    //   BoxShadow(
                    //       color: Color.fromARGB(255, 153, 151, 151),
                    //       blurRadius: 4,
                    //       offset: Offset(2, 4),
                    //       blurStyle: BlurStyle.solid
                    //       // Shadow position
                    //       ),
                    // ],
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: getHeight(context) * 0.1945,
                  width: getWidth(context) * 0.786,

                  //  Image.asset(
                  //   imagePath,
                  // ),
                ),
                Positioned(
                  bottom: getHeight(context) * 0.04,
                  left: getWidth(context) * 0.055,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Black Panther: Wakanda Forever',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        'On March 2, 2022 ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffEBEBEF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            aspectRatio: 16 / 7,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
              // Можно добавить дополнительную логику, если нужно
            },
          ),
        ),
        DotsIndicator(
          mainAxisAlignment: MainAxisAlignment.center,
          dotsCount: _images.length,
          position: _currentImageIndex,
          decorator: DotsDecorator(
            color: const Color.fromARGB(
                255, 176, 239, 244), // Цвет неактивных точек
            activeColor: const Color(0xff12CDD9), // Цвет активной точки
            size: const Size.square(10),
            activeSize: const Size(30, 10),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget with ScreenSizeUtil {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(context) * 0.06)
          .copyWith(bottom: getHeight(context) * 0.03),
      child: Container(
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
            const Expanded(
              child: TextField(
                style: TextStyle(
                  leadingDistribution: TextLeadingDistribution.even,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                cursorColor: Colors.grey,
                decoration: InputDecoration(
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
      ),
    );
  }
}
